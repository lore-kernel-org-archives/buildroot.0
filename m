From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:47 +0000
Subject: [Buildroot] [PATCH 5/9] package/go: Fix powerpc64 config typo
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <07463ddac4fb3a64b56a60b5915e53a115c989b5.1463010771.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix typo in config powerpc64 depends.  Go language only supports 64 bit powerpc.

Also add BR2_powerpc64le to depends list.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/Config.in.host | 2 +-
 package/go/go.mk          | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index e988483..5833bd9 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_ARM_CPU_ARMV4
diff --git a/package/go/go.mk b/package/go/go.mk
index 720c75a..a9e16dd 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -26,8 +26,10 @@ else ifeq ($(BR2_i386),y)
 GO_GOARCH = 386
 else ifeq ($(BR2_x86_64),y)
 GO_GOARCH = amd64
-else ifeq ($(BR2_powerpc),y)
+else ifeq ($(BR2_powerpc64),y)
 GO_GOARCH = ppc64
+else ifeq ($(BR2_powerpc64le),y)
+GO_GOARCH = ppc64le
 endif
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
-- 
2.5.0
