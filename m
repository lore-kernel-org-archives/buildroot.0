Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AE7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A89F41649;
	Wed, 26 Jan 2022 21:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHuDhDf5Uour; Wed, 26 Jan 2022 21:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1F6416BA;
	Wed, 26 Jan 2022 21:05:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC34F1BF9B9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A485560F93
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2TBYaObxyZT for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE14660F9E
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 827B182883; Wed, 26 Jan 2022 20:57:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:03:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17ed9108a65ba78b108cb4d4b936cf0940948faf
X-Git-Newrev: 0e6ea33ded6354b6f6e6122b124707db89a2ef2f
X-Patchwork-Hint: ignore
Message-Id: <20220126205732.827B182883@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add brotli support
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e6ea33ded6354b6f6e6122b124707db89a2ef2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...002-build-meson-fix-typo-in-variable-name.patch | 25 ++++++++++++++++++++++
 package/lighttpd/Config.in                         |  6 ++++++
 package/lighttpd/lighttpd.mk                       |  8 ++++++-
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch b/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
new file mode 100644
index 0000000000..d338979d46
--- /dev/null
+++ b/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
@@ -0,0 +1,25 @@
+From 876a1e1b2cc21282a0df5245004197cdffe1d380 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Thu, 20 Jan 2022 07:04:51 -0500
+Subject: [PATCH] [build] meson: fix typo in variable name
+
+[Retrieved from:
+https://github.com/lighttpd/lighttpd1.4/commit/876a1e1b2cc21282a0df5245004197cdffe1d380]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 4ee163468..b35c1037f 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -266,7 +266,7 @@ endif
+ libbrotli = []
+ if get_option('with_brotli')
+ 	libbrotli = [ compiler.find_library('brotlienc') ]
+-	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotlienc, prefix: '#include <brotli/encode.h>')
++	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotli, prefix: '#include <brotli/encode.h>')
+ 		conf_data.set('HAVE_BROTLI_ENCODE_H', true)
+ 		conf_data.set('HAVE_BROTLI', true)
+ 	else
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 05a7c84961..f3e252d850 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -21,6 +21,12 @@ config BR2_PACKAGE_LIGHTTPD
 
 if BR2_PACKAGE_LIGHTTPD
 
+config BR2_PACKAGE_LIGHTTPD_BROTLI
+	bool "brotli support"
+	select BR2_PACKAGE_BROTLI
+	help
+	  Enable brotli support for lighttpd mod_deflate.
+
 config BR2_PACKAGE_LIGHTTPD_BZIP2
 	bool "bzip2 support"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 4f05db4e29..22db1a7348 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -13,7 +13,6 @@ LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf xxhash
 LIGHTTPD_CONF_OPTS = \
-	-Dwith_brotli=false \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
 	-Dwith_gnutls=false \
@@ -36,6 +35,13 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_BROTLI),y)
+LIGHTTPD_DEPENDENCIES += brotli
+LIGHTTPD_CONF_OPTS += -Dwith_brotli=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_brotli=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
 LIGHTTPD_DEPENDENCIES += bzip2
 LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
