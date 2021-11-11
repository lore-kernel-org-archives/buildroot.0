Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CF0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FAC361264
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FAC361264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E648460B00;
	Thu, 11 Nov 2021 20:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boEu3fmhrpMh; Thu, 11 Nov 2021 20:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4942C6067A;
	Thu, 11 Nov 2021 20:05:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC3321BF44A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E21D281BF5
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5rmy1EZ9Wb5 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:04:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 081AC8176E
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636661081;
 bh=nuOs1uPh8hQR8IzWeBhqBfd964yEgsMFx6/EPo9PnDo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=faahdcDNnIXLWoYNo31cC2UkuEr6XxcyrXwUf08Av+RZEoBdFxc7FZZFjb2MXzIty
 QpWpOxNTnygLgH1Mj/yhHUh1S6eB4DzA0LylQkJMVK0lSMiD7I2PqrzOYoUxBGl6Wi
 1+4/X/ciKfoRmwadVBQSV5ZmItNfztabxH4MaqDo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dsb-1mfV2T3OmD-015Zh4; Thu, 11
 Nov 2021 21:04:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 21:04:35 +0100
Message-Id: <20211111200439.15379-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111200439.15379-1-ps.report@gmx.net>
References: <20211111200439.15379-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FSp3lB0KbH7wkhAqWPX+D1sjzPHpUAV5g57gLZ8QnY94rXfkUfI
 H/OZKbmze2mXIj/BiZZ+COh3jGY5MimEMAgBFJbQPWPI+RukZL79r4lqZ5n5DZ5KnTrZII8
 fbtmcVuWWL5Gs+PSmj7GahQT9dfZ09EEkwQlA7jXroujxj+v1ClmxOBVatXdnCUVXNe6LOU
 sruUzPq07leyjKSwRgjNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eSOhjXlBONc=:AxiqOf789vbvxDFqod86Hn
 PdTTV2X2pCI5vRvRkChzutYZUrOXdMPVVFzFTkTkWBSwHobTRLHn+BPkax9j9LBvE5Xx9NT7w
 eRC4pkmwv+FC89CRQ8PbrZ/EwihqaPM1TGh2Y2IDy2ZwpqPxuT+/z8QU5usNJHtBm+jpfsENj
 P9HEfDiFa2OKA1Avg+iCCgWgr8z4uiP7SzVtOxUN+3gXnJu6Hp9ijETL5hjTIcvsi/QPCv6LK
 nw3MOJJPi1NnHo1YmzlsbLnb306Bcpsr3QJO6Cqh3EUzUuF8dFOdrymTMsoLJEluaiEeLNU0G
 4cDCdeWcx0FDsnR8Vmk0D+fyxHUWWjltgCC1ZV5R0Bb2ePg9ijTMoFXkXTyHaSN+bx2AnLT87
 pmD36Qx4ELo4LK1Op6rQSpGJZ2YUcK71nxWRjGiAMBHLhwecSWWJKQXerte0vQ06j1qn/Ig1u
 w7KedkbpR3I+uPLHUFUYr/uqQ/UCc5Y9t+f7AmjPwsbo+RxsCQcls4I8noB83WdeYu3MYKBwf
 TxUWfxi8oWoUfqed5x5rosjwupSjvFNlna2ivdFCiAdUYTHyVN3Ag6D0vi1EHRB1Rfud7caQk
 E2c4nPHuFVwNIDdTY3q8YSm9PgeGKsWdgpb/8di3C5GH1Ugv9AWm5Xo1r3ol7+s7TxsUntXX8
 jub0PMX5WKnLW9HlKi+aO/5bpl5UvtHXWNH9VvHVWgNoSFt5UX3ejj60PJ/fV3M94PuB4pKRz
 6uwdremKKISNHpoddrKm1KLJr+IrNBglssDpqK8zs8MKZgmvZmGct/jNb1Nqudb3J1sKupfxb
 J4ok3ntYLJsd5cecuWONnE56KIbHmG7O1jGYSKUHfLGDhlxDl4anG+mg7Qa/UUqDtkaQG34eo
 ooT7xIbQ9o5UfYUwBcXRr5c9EGDlNor1CzpYJ7Yult/sURvT+/QUVbPJNSED2Nt3DfSyJ3hx1
 koHQCVNgIHBjeXB9LD0Od0VKuH6MQZ0MMYreV97BBXgwlv+COibkMHcazYDf/GMn4PdPnPGG+
 Dx4kXwrINooJ/gI/ZbsaVoZvW8T7pZwLt0S00MMytdAGt9cjhTdne6NWqrOZNKUoLblFgPQtG
 c5uHxKxPQ6nJrQ=
Subject: [Buildroot] [PATCH/next v1 3/7] package/rpi-userland: bump version
 to bab9bf8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog (since 6e8f786):

  - 7f72bc2 userland: Reduce debug_sym error messages
  - 0093675 interface/vcos: Get rid of LLTHREAD cast warning
  - 705ff8e hello_fft: Update outdated link to V3D spec
  - bab9bf8 hello_fft: Remove unused function declaration

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 4927a8b43b..da573f3eae 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-6e8f786db223c2ab6eb9098a5cb0e5e1b25281cd.tar.gz
+sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index a670a4a02d..09a7f6af74 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 6e8f786db223c2ab6eb9098a5cb0e5e1b25281cd
+RPI_USERLAND_VERSION = bab9bf8790cd69660d443ce43b4e372999f3f7ac
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
