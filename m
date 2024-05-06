Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5DFC10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 14:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46EE608A6;
	Mon,  6 May 2024 14:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dR5KXEiawWWa; Mon,  6 May 2024 14:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15DB3608B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15DB3608B1;
	Mon,  6 May 2024 14:46:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 478E61BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A344381B01
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnNyB0E6fXUY for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 14:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6539E81E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6539E81E07
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6539E81E07
 for <buildroot@busybox.net>; Mon,  6 May 2024 14:45:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1swVOd0YkR-00sxsz
 for <buildroot@busybox.net>; Mon, 06 May 2024 16:45:56 +0200
To: buildroot@busybox.net
Date: Mon,  6 May 2024 16:45:44 +0200
Message-ID: <20240506144555.31709-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506144555.31709-1-ps.report@gmx.net>
References: <20240506144555.31709-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:iHTssDnghNCB7SoKU9MdKCxLQr6RTb2CjGdyORqFrSNwooBdT7q
 sesGNV26Sb4ztcAyVzI6spaeUadPuJqNg51/wwlFPwkOtr6LlI2HFogJUj6zPyP3RO2Tccg
 Kbcd1UKr8goGt4nDgi7hFhuT3LqytPy43xgELVvyQwA1hhdCXNUHkdPLd1wxorEomV53YkF
 ryKDNS86HkjyRTZnpoFtw==
UI-OutboundReport: notjunk:1;M01:P0:AyUwe6QRKOQ=;QqWe0p7VEfQFBDxtRCjJZi1q4u9
 pK8KbJStUJAO1jksVJuPP6QS3W5QkSPZoBYCciROrZahgELGbRiN5cf5/cV1+5Bm90EZjMJQj
 JQdifCQsrbNQONhtsie21YLACNwR11usrwJJR+MS3KpMsG8p3ofd3QSvzxj7Xjk5KKlL9Qcbt
 fzcgaTc1ZaOSDFgv+neWdtlKRL+teadjnVBYvu4bfGImA+KGKexnuKAhdRbabfDVa3F/5KEMY
 KTwsJUpWgTfPp2EHgrV0Ljwm5Ec8p3Sgb5rjGsFAMbaP1q6Qtww2KWxh81nXcySJaJxG3wJJ4
 zdnOblapcyqHAWzdtzffNgTI1NKNFpC68kdE47jIJ5a9L7xPXZ3JByr6YujzNQ39g1juQGhb6
 NllBVWjaMzUsmQ0v47Zi+X+kKpzj9Fx/KJeIyEfscAphIS5YhmReuVhewZBev/hQUUP46jYu4
 tFiwPQB5AL8uytZRZcHSf+PClpmRs1cDNgCSSyGn1qtjT5w+/1kgFRVFExmwoIELbI2BXr64U
 LBH2i3QgJkPcxe5F/scqkGnk9Km46G55X0Oce6yCj4YkMjDFoBYg5ZZ6YAKqywFFmtSqVpSy8
 S2kjSWQ3NgyeT258HUyy3/IKOJwjilbTh/qzqPgLfQhRuv3FJvxJsQB3YJ5B0v0oow/F+RaXL
 MjGrg7h8nk8W4SZmIjrJydyihVLT5r7C0KdqqBvx57DbVUgioRMaVGZOOCYPkPQBi6H1Hjgcq
 uyl9h/yoGU1VrE8JQnptRg3mpB+a4141+PyAU44BdVjiFmwHEB+ZGguydmGSP/cHDpifEtfdK
 A3bEbAt13hk4bvVGFHXvznzEyEk8DzoJbOcb05tgYhsvA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715006756; x=1715611556; i=ps.report@gmx.net;
 bh=80rSJ4wR4mCWetfDsIYIfKlIHdyow4gJWEku34WVukU=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AYETiSc8qWjyjr1y3tKMmL7ood6j+DIUgICb8ObBGyEAPO1tl2TQBSqR8htR1N1N
 xlLTMuphJD4aN5dCBV9IPlnktv4hUGLIcWVzhH/A1U69/tE04xmHrSbllpdxNUAki
 X2GhpJuPoIUeGTUtQaSmGa8npc+B5eYR/4C592YsHU54jFgGGD/hjNtOVXh6x4TQ8
 2jfqfjNSeIeVo6CMntTxiXT862USUhLR8vdhvZjVsg0TEIzqNL8kk2L4NGIYDiRoF
 /JGZSjNmlM1DMkdEmU50TqMLb9Q8gC6+aQRkZgz7U6MmEZEpTCzG5m3bAV1A39FJO
 xx6kElU8AQD3RbdyvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=AYETiSc8
Subject: [Buildroot] [PATCH v1 1/8] boot/barebox/Config.in: source argument
 needs quotation marks
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  boot/barebox/Config.in:79: syntax error
  boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:79:warning: ignoring unsupported character '.'
  boot/barebox/Config.in:79: invalid statement
  boot/barebox/Config.in:93: syntax error
  boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:93:warning: ignoring unsupported character '.'
  boot/barebox/Config.in:93: invalid statement

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 boot/barebox/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index dba4a1a8d6..0bd3386795 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -76,7 +76,7 @@ config BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION
 
 endif
 
-source boot/barebox/barebox/Config.in
+source "boot/barebox/barebox/Config.in"
 
 menuconfig BR2_TARGET_BAREBOX_AUX
 	bool "Build barebox with an auxiliary config"
@@ -90,7 +90,7 @@ menuconfig BR2_TARGET_BAREBOX_AUX
 
 if BR2_TARGET_BAREBOX_AUX
 
-source boot/barebox/barebox-aux/Config.in
+source "boot/barebox/barebox-aux/Config.in"
 
 endif
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
