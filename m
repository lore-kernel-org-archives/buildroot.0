From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:33:25 +0000
Subject: [Buildroot] [PATCH 2/3] package/go: Enable MIPS support
In-Reply-To: <cover.1463696779.git.geoff@infradead.org>
References: <cover.1463696779.git.geoff@infradead.org>
Message-ID: <c138dede8cf5d38117bdbff2bc3dfa796d904671.1463696779.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable go language support for mips64 and mips64el (mips64le), which
were added in go-1.6.2.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/Config.in.host | 2 +-
 package/go/go.mk          | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index b570803..446e505 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le || BR2_mips64 || BR2_mips64el
 	depends on !BR2_ARM_CPU_ARMV4
diff --git a/package/go/go.mk b/package/go/go.mk
index a9e16dd..00b1d21 100644
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
