From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 27 Apr 2021 18:54:40 +0200
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2021.04
Message-ID: <20210427165440.635036-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zstd is a new dependency (since 2021.03)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/Config.in   | 1 +
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index c370a0f22..acef8f5d6 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_MOARVM
 	# See: https://github.com/MoarVM/MoarVM/issues/222
 	# dyncall does not work also on powerpc64 and powerpc64le
 	select BR2_PACKAGE_LIBFFI if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc64 || BR2_powerpc64le
+	select BR2_PACKAGE_ZSTD
 	help
 	  Short for "Metamodel On A Runtime", MoarVM is a virtual
 	  machine built especially for Rakudo Perl 6 and the NQP
diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index abe96c3d4..5464c4e12 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  08914f1c464151ebc678cf0d360c9e479a036178fa7c9ddfd34aa4d556d03ea2  MoarVM-2020.12.tar.gz
+sha256  e094728536da421dc9a3e8651160ab6a5e8d0eafa834e8953feecf33285a11e7  MoarVM-2021.04.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 1f4140441..b6b9b6908 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.12
+MOARVM_VERSION = 2021.04
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
 MOARVM_LICENSE_FILES = Artistic2.txt
 MOARVM_INSTALL_STAGING = YES
-MOARVM_DEPENDENCIES = host-pkgconf libuv libtommath libatomic_ops
+MOARVM_DEPENDENCIES = host-pkgconf libuv libtommath libatomic_ops zstd
 
 MOARVM_CONF_OPTS = \
 	--build=$(GNU_HOST_NAME) \
-- 
2.27.0
