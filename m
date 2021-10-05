Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03080C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:14:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F3E61090
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96F3E61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D42D4028C;
	Tue,  5 Oct 2021 20:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10WY0j6xrnBd; Tue,  5 Oct 2021 20:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63964403EB;
	Tue,  5 Oct 2021 20:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7563B1BF2CC
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7242D83A4F
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cq2af1jiTX-N for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 20:14:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C94E28295A
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 20:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633464841;
 bh=bq2H38uVHLrscAZkK2ho1kwZd34uN7GwT7MOe1pAZIY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=UrfMBfXLeKhWOu4IBtef+BUhV7F4jMpQ6wJoCCztBMxJh8/M3vVZOevp/IEKIMWEJ
 VZu4hz9zFKQRG4mA9/G27vR13BHeVn8cDNntz7IjIn7wkQwxsZovwxH/zxAaQS/sVq
 ZF/jzwEMhng3DlOtwWUEHmQ1OxOwR8v5ZmW+1YnI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M3DO3-1mUq9M37vx-003b6X; Tue, 05 Oct 2021 22:14:01 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 22:14:01 +0200
Message-Id: <20211005201401.10843-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:EZtkbovzoSQWQoRWtLPQSeUDlWBG2DeYX4sLWB0XDsDAPt0E5tM
 j6aXFMk+9QJl1fB9FWrFItwgJC+7luAqFuwu6oBpm1GgValb5OoK6yo0rS1ZzsFVhdB3xif
 Lp2THzC3aXR2SuNlXwPasuOG8df7S4YBIl6rJ+NzsVJK5m+NzLVXawIVmESC76nGKuOxbDM
 Xs/wyDp6aJki5UEv8lKdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CXBm2e+giL8=:/rNG1EaEJWva4eDyXQQ/No
 Fbxq38hMPHlAk3pm18XthCzCGzERRU/F9V9j1ebi+sXL3NfO8mScaPPQHl9tm7ENwtF/YE5xN
 Dg27fackZltd6Px6KRFBu/TG+rQL7ttqp8yKSKW1rdbvuApg6/AHSbN8dMOKsef6m48Z2l+mD
 UepI4UsqnnwkUxRfcMkJb2yxDIyS9kaV1m+4mkRWZXcyzfaFgcjVDzLjbZNSTn8awOKcDT3xj
 prm4M83XmM9Ki1b+u2TnuVLSyyg3k4+IIJRHN8kySwLLVpdSgPD7KcahUBHdPvlBjiSDJHkNR
 bLBiuR8SP2ajy4sMcNZyEEepJVfGD60XdVwJyAnHWak7nhHd2I3Tuc4/zUkBOjYdjaEsPtD77
 JTNuOPid+7F3ch/6yq0SVMuz9R6H+UbUhGgSiE80a/8yTJYt3Ka4EoOyko3mZtnJl89ecrXFB
 GpPwn9srWIx47Ln0f5D622l9lOPs2R9Q0s1tmZiwxGuf2OtrpY35Yyh5LaQutrybkWVBROSn9
 FJsIvhkn2gbiQJVO3rrPXZ/pMwyRZXl/6wv7bl4PbXWiTtGpus9TxtTGrE841x0kIjxIbLU8n
 iKb6eJfnfGhdM+LGN1A7gv9B9Dfi+nLm2kXgd9P+Ecq8MyMYBUQ4hhkDjFkvinoU8UTQCKCpc
 0yR2wLkN6iPzTbHlyfJEqC34OH21cIar8r1F9rOzptEkCX8SxPaODMtNThUenDVK4CnbVPuQI
 13i8a1lGiyeQYmR8eCm2wdKkhY5Aqzwwu7aQASmLcoSW+6Jv80TN9bZ86lP8ZoYudV2yt1PUH
 Vhz0quWpQgU2Wvn6fFWvyOYTHKe7jPxcyVyLfIOH2MlYn7eOHsNRf3Lht/6R60P7tjoR+V06N
 +nZ55iboXIvqPChiprxmJDhku3r8ns+Qz+ss6fV6JXInbZkSB3K42uvwcbowF+1zgQYE6zCmq
 4zLQRjgJ1POsraqV0Pe4y/t5NIdkth3LIX0sM6nM/NdPpxHKNxp/0jrm4ZKYZtOGpp7oKBZLg
 vHk4ZducjCKW1SNmDp5vNwr7UIqGbIh1BsFAiZ3NakVdmiYpMj7gs0oex8kyqxv31IgvtgW+t
 RxBkyOAdc9wu+g=
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.19.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041989.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 7d57ae9b2d..0f0b12bc49 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041977.html
-sha256  3d3a2f12b4a65cd82684121ae4b33cdc3ad541c761a55e8eb73a8e5e443cccbb  libinput-1.19.0.tar.xz
-sha512  daf42ce797f2b5aef8d6f7a5c0d967590581e6ac12c26fa6bde5fbc619d75319e39ca55d65d5347e554dd6a48b91f5fed4d3167eabef8ad1ebc43bc0c3e8e220  libinput-1.19.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041989.html
+sha256  0bdcf5b1783b737854b7af1ca22df67bc36a6fe7c9cfa71f01e9149f9220446d  libinput-1.19.1.tar.xz
+sha512  63084f5e081ee4918fee8584d99e6feb84ce9b771015c556c930843e0097abb9b93b6f9731c488b8493eac18fa4086f4822a2ed00f3cb3258346341ad0061c36  libinput-1.19.1.tar.xz
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 3ab1a2c38f..0c232994df 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.19.0
+LIBINPUT_VERSION = 1.19.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
