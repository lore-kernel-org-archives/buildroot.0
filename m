From: Geoff Levand <geoff@infradead.org>
Date: Fri, 06 May 2016 11:01:42 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
In-Reply-To: <1462551812-8952-1-git-send-email-christian@paral.in>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
Message-ID: <1462557702.27026.27.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2016-05-06 at 12:23 -0400, Christian Stewart wrote:
> Golang has significant improvements to support for multiarch in later
> versions. This bump is required to make many go programs functional
> under arm64, for example.

MIPS support was added in 1.6.

Otherwise, Acked-by: Geoff Levand <geoff@infradead.org>


--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le || BR2_mips64 || BR2_mips64el
 	depends on !BR2_ARM_CPU_ARMV4

--- a/package/go/go.mk
+++ b/package/go/go.mk
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
