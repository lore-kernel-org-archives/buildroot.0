From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 20:02:56 +0100
Subject: [Buildroot] [git commit] package/kexec-lite: update to latest
	version
Message-ID: <20151029190717.7E6BE7FA76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8749c3fc6e85939136d05809271d8def261c8cc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream now supports little endian, so enable for little-endian
powerpc.

[Peter: add hash]
Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec-lite/Config.in       |    2 +-
 package/kexec-lite/kexec-lite.hash |    2 ++
 package/kexec-lite/kexec-lite.mk   |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index ede5cba..fcc0d88 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KEXEC_LITE
 	bool "kexec-lite"
-	depends on BR2_powerpc || BR2_powerpc64
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_STATIC_LIBS # dtc, elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
diff --git a/package/kexec-lite/kexec-lite.hash b/package/kexec-lite/kexec-lite.hash
new file mode 100644
index 0000000..e8179b7
--- /dev/null
+++ b/package/kexec-lite/kexec-lite.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2300187bf25616c382cb2f191a2eb13033e019511854794ce234a76cf9f5ad6b  kexec-lite-783fb4a811d0b0f8cc2ed68fa7872dcad56a3944.tar.gz
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 7e3c8d3..27bc204 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_LITE_VERSION = fb8543fea3beb0522b5a63a74ea1a845dbd7b954
+KEXEC_LITE_VERSION = 783fb4a811d0b0f8cc2ed68fa7872dcad56a3944
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPLv2+
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
