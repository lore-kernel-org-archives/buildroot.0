Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FC0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CD9D40364;
	Mon,  4 Apr 2022 19:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tL21FIE6UF7y; Mon,  4 Apr 2022 19:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D9E401A3;
	Mon,  4 Apr 2022 19:24:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD2401BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC0CF408B1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qjnf4m1ypCdx for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:24:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE376408A9
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 078CA81E7F; Mon,  4 Apr 2022 19:14:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:16:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4b191c4e8b076aee532daf6674ac10dd9390eade
X-Git-Newrev: defafdf3f80a1311d0ba0c735624497a549ec0a4
X-Patchwork-Hint: ignore
Message-Id: <20220404191459.078CA81E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cppcms: libgcrypt
 is optional, not mandatory
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=defafdf3f80a1311d0ba0c735624497a549ec0a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

If libgcrypt (or openssl) is not enabled, aes_encryptor is disabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 32045a73a39904617a3c281e02ccf93ad953b5d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppcms/Config.in | 2 --
 package/cppcms/cppcms.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 25fd93a7d0..6c0bff934c 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_CPPCMS
 	bool "cppcms"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 530b44427b..357909f31d 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -18,7 +18,7 @@ CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
 	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
 
-CPPCMS_DEPENDENCIES = pcre libgcrypt
+CPPCMS_DEPENDENCIES = pcre
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
@@ -28,6 +28,13 @@ else
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=ON
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+CPPCMS_CONF_OPTS += -DDISABLE_GCRYPT=OFF
+CPPCMS_DEPENDENCIES += libgcrypt
+else
+CPPCMS_CONF_OPTS += -DDISABLE_GCRYPT=ON
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 CPPCMS_CONF_OPTS += -DDISABLE_GZIP=OFF
 CPPCMS_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
