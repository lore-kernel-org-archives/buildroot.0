Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59852C001B0
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 06:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB88409A5;
	Mon, 14 Aug 2023 06:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB88409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ic2BYIX6SP21; Mon, 14 Aug 2023 06:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8883415A7;
	Mon, 14 Aug 2023 06:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8883415A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D869A1BF3D1
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 06:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA25280F1E
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 06:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA25280F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l47GrHoyZh3i for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 06:49:31 +0000 (UTC)
X-Greylist: delayed 391 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Aug 2023 06:49:31 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBE180FBA
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EBE180FBA
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 06:49:31 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 08:42:47 +0200
Message-Id: <20230814064247.333044-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; s=mail; t=1691995376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zI7yI4wezE07kPBodIeIAzI1m8Lm/HdxGESlPvZvIzg=;
 b=ms6N89uGpEGgnb2HB94FiW0P7l8JiTwzk//IMdrMGJkHYQUAbAd+k0x50MqWaP9fw3cgmK
 HXqtULbAkqLli15yYa6fDL/V4fUtWwu4IMWnkIaPs+/fU2ax3kGwkBbPryEGrTBaajo63g
 V7m3E4l6mcVeT7y8Ty3Bj+KlgODg0/I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=ms6N89uG
Subject: [Buildroot] [PATCH 1/1] package/libiio: bump to version v0.25
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The changelog is available here:
https://github.com/analogdevicesinc/libiio/releases/tag/v0.25

Remove the 0001 patch as it is included in the v0.24 version.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../0001-iiod-serial.c-fix-sparc-build.patch  | 76 -------------------
 package/libiio/libiio.hash                    |  2 +-
 package/libiio/libiio.mk                      |  2 +-
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 package/libiio/0001-iiod-serial.c-fix-sparc-build.patch

diff --git a/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
deleted file mode 100644
index 1c2d606e63..0000000000
--- a/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 40ffc5d9b8f6e47866292bf1365ac3a5d22cf123 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 25 Sep 2022 11:19:18 +0200
-Subject: [PATCH] iiod/serial.c: fix sparc build
-
-Fix the following sparc build failure raised since version 0.24 and
-https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cbac664:
-
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c: In function 'serial_configure':
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B2500000' undeclared (first use in this function); did you mean 'B1500000'?
-   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
-      |                                                          ^
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
-  127 |         CASE_BPS(2500000, &tty_attrs);
-      |         ^~~~~~~~
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: note: each undeclared identifier is reported only once for each function it appears in
-   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
-      |                                                          ^
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
-  127 |         CASE_BPS(2500000, &tty_attrs);
-      |         ^~~~~~~~
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3000000' undeclared (first use in this function); did you mean 'B1000000'?
-   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
-      |                                                          ^
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:128:9: note: in expansion of macro 'CASE_BPS'
-  128 |         CASE_BPS(3000000, &tty_attrs);
-      |         ^~~~~~~~
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3500000' undeclared (first use in this function); did you mean 'B1500000'?
-   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
-      |                                                          ^
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:129:9: note: in expansion of macro 'CASE_BPS'
-  129 |         CASE_BPS(3500000, &tty_attrs);
-      |         ^~~~~~~~
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B4000000' undeclared (first use in this function); did you mean 'B1000000'?
-   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
-      |                                                          ^
-/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:130:9: note: in expansion of macro 'CASE_BPS'
-  130 |         CASE_BPS(4000000, &tty_attrs);
-      |         ^~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/8a9902f6eddaab812ebce3506ed6de686f647e02
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: actual backport now that upstream accepted it]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- iiod/serial.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/iiod/serial.c b/iiod/serial.c
-index f829361d..b140d051 100644
---- a/iiod/serial.c
-+++ b/iiod/serial.c
-@@ -124,10 +124,18 @@ static int serial_configure(int fd, unsigned int uart_bps,
- 	CASE_BPS(1152000, &tty_attrs);
- 	CASE_BPS(1500000, &tty_attrs);
- 	CASE_BPS(2000000, &tty_attrs);
-+#ifdef B2500000 /* Not available on all architectures, i.e. sparc */
- 	CASE_BPS(2500000, &tty_attrs);
-+#endif
-+#ifdef B3000000 /* Not available on all architectures, i.e. sparc */
- 	CASE_BPS(3000000, &tty_attrs);
-+#endif
-+#ifdef B3500000 /* Not available on all architectures, i.e. sparc */
- 	CASE_BPS(3500000, &tty_attrs);
-+#endif
-+#ifdef B4000000 /* Not available on all architectures, i.e. sparc */
- 	CASE_BPS(4000000, &tty_attrs);
-+#endif
- 	default:
- 		IIO_ERROR("Invalid baud rate\n");
- 		return -EINVAL;
--- 
-2.25.1
-
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index f497756eac..0f024af78c 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2b5d848531ea64fd9f95327dfd5a588bd227d9577281ec375e822702c6a52d5  libiio-0.24.tar.gz
+sha256  21972599a3c143ab1f98002ad2b3f28f4aff927fde5f677478311cd4e517730c  libiio-0.25.tar.gz
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 9e2cf454b5..733a0c90ed 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.24
+LIBIIO_VERSION = 0.25
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
