From: Geoff Levand <geoff@infradead.org>
Date: Tue, 10 May 2016 11:02:55 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/go: bump version to 1.6.2
In-Reply-To: <1462551812-8952-1-git-send-email-christian@paral.in>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
Message-ID: <1462903375.27026.55.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Golang has significant improvements to support for multiarch in later
versions. This bump is required to make many go programs functional
under arm64, for example.

Signed-off-by: Christian Stewart <christian@paral.in>
[Also enable go language support for mips64 and mips64el (mips64le), which
were added in go-1.6.2.]
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/Config.in.host | 2 +-
 package/go/go.hash        | 2 +-
 package/go/go.mk          | 6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 5833bd9..3d8fe45 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le || BR2_mips64 || BR2_mips64el
 	depends on !BR2_ARM_CPU_ARMV4
diff --git a/package/go/go.hash b/package/go/go.hash
index e7c72de..b1e5d27 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  754e06dab1c31ab168fc9db9e32596734015ea9e24bc44cae7f237f417ce4efe  go1.5.3.src.tar.gz
+sha256  787b0b750d037016a30c6ed05a8a70a91b2e9db4bd9b1a2453aa502a63f1bccc  go1.6.2.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 05236f1..00b1d21 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.5.3
+GO_VERSION = 1.6.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -30,6 +30,10 @@ else ifeq ($(BR2_powerpc64),y)
 GO_GOARCH = ppc64
 else ifeq ($(BR2_powerpc64le),y)
 GO_GOARCH = ppc64le
+else ifeq ($(BR2_mips64),y)
+GO_GOARCH = mips64
+else ifeq ($(BR2_mips64el),y)
+GO_GOARCH = mips64le
 endif
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
-- 
2.5.0
