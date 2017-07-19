From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:11:42 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] webkitgtk: select
	libgcrypt
Message-ID: <20170720055508.7C59A7F999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c2fbc0c5d14d52214f86c8e4437b15142b72b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Libgrcrypt is a direct dependency of WebKitGTK+, and as such it
should be selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: add missing dependency on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit b61c805fcaf8980a3dbcd23c444660f7f5327ecf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in    | 2 ++
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 25f6fad..7b50a13 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	# Disabled on SuperH because of segfault
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
 comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
@@ -30,6 +31,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBSECRET
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index e9fb66b..187885a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -13,7 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
-	enchant harfbuzz icu jpeg libgtk3 libsecret libsoup \
+	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libxml2 libxslt sqlite webp
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
