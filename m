Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F125BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F1EE40204;
	Mon,  4 Apr 2022 19:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zw8BEStsyaId; Mon,  4 Apr 2022 19:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E742401A3;
	Mon,  4 Apr 2022 19:24:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DBA81BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B6160A99
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D35uW1f_sooH for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:24:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AA7360A77
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F153081E71; Mon,  4 Apr 2022 19:14:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:16:45 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2e088c7aca10578157fd175f216319c286541dea
X-Git-Newrev: 4b191c4e8b076aee532daf6674ac10dd9390eade
X-Patchwork-Hint: ignore
Message-Id: <20220404191458.F153081E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cppcms: zlib is
 optional, not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b191c4e8b076aee532daf6674ac10dd9390eade
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

zlib is not mandatory since at least version 1.0.5 and
https://github.com/artyom-beilis/cppcms/commit/fc1c25f9c7af440f2fc579b150025addfa5421a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f413bf2c641954d2202287c3858a007a24e02a6a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppcms/Config.in | 1 -
 package/cppcms/cppcms.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 1d7635a83e..25fd93a7d0 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_CPPCMS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBGCRYPT
 	help
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index b289617bbc..530b44427b 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -18,7 +18,7 @@ CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
 	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
 
-CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
+CPPCMS_DEPENDENCIES = pcre libgcrypt
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
@@ -28,6 +28,13 @@ else
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=ON
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CPPCMS_CONF_OPTS += -DDISABLE_GZIP=OFF
+CPPCMS_DEPENDENCIES += zlib
+else
+CPPCMS_CONF_OPTS += -DDISABLE_GZIP=ON
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # posix backend needs monetary.h which isn't available on uClibc
 CPPCMS_CONF_OPTS += -DDISABLE_POSIX_LOCALE=on
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
