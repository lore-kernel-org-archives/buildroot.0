Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43289C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC63E846DD;
	Thu, 30 Nov 2023 22:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC63E846DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsOZBsBxbxiQ; Thu, 30 Nov 2023 22:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45960846CD;
	Thu, 30 Nov 2023 22:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45960846CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 455501BF983
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29337401E1
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29337401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5eu-HJ8MJSB6 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:17:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA35B40167
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA35B40167
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C051C87621; Thu, 30 Nov 2023 22:17:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:14:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fcd48aff97866df5488eb47589f6f45064f0228
X-Git-Newrev: d590c2c9398bce36efe042233054a2c6b75fcad0
X-Patchwork-Hint: ignore
Message-Id: <20231130221739.C051C87621@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusb-compat: fix hash
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8442686374792769986=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8442686374792769986==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d590c2c9398bce36efe042233054a2c6b75fcad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream re-released the v0.1.8 tarballs with autotools related stuff. [1]
That makes the hash test to fail:

ERROR: while checking hashes from package/libusb-compat//libusb-compat.hash
ERROR: libusb-compat-0.1.8.tar.bz2 has wrong sha256 hash:
ERROR: expected: 698c76484f3dec1e0175067cbd1556c3021e94e7f2313ae3ea6a66d900e00827
ERROR: got     : b692dcf674c070c8c0bee3c8230ce4ee5903f926d77dc8b968a4dd1b70f9b05c
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Update the hash and drop LIBUSB_COMPAT_AUTORECONF.

[1] https://github.com/libusb/libusb-compat-0.1/issues/28#issuecomment-1759400548

[Peter: use .tar.gz to not conflict with s.b.o]
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libusb-compat/libusb-compat.hash | 2 +-
 package/libusb-compat/libusb-compat.mk   | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.hash b/package/libusb-compat/libusb-compat.hash
index a198e76058..b22fa5434d 100644
--- a/package/libusb-compat/libusb-compat.hash
+++ b/package/libusb-compat/libusb-compat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  698c76484f3dec1e0175067cbd1556c3021e94e7f2313ae3ea6a66d900e00827  libusb-compat-0.1.8.tar.bz2
+sha256  d199c173fd3cd9d27c7f4bb6608befc7eb761984e6664da7d9d4386ff66fe6fc  libusb-compat-0.1.8.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index d49b753670..b54dbded27 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -6,7 +6,6 @@
 
 LIBUSB_COMPAT_VERSION_MAJOR = 0.1
 LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).8
-LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = https://github.com/libusb/libusb-compat-0.1/releases/download/v$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf host-libusb
@@ -14,9 +13,6 @@ LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
 LIBUSB_COMPAT_LICENSE = LGPL-2.1+
 LIBUSB_COMPAT_LICENSE_FILES = COPYING
-# 0.1.8 tarball was released without configure script by upstream
-# discussed here: https://github.com/libusb/libusb-compat-0.1/issues/28
-LIBUSB_COMPAT_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),)
 LIBUSB_COMPAT_CONF_ENV += \

--===============8442686374792769986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8442686374792769986==--
