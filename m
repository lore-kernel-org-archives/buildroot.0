From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 23:41:09 +0200
Subject: [Buildroot] [git commit] package/go: Enable MIPS support
Message-ID: <20160601214119.2209F81D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e2bf3cb58f86d14e320229c9bb31753888410a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable go language support for mips64 and mips64el (mips64le), which
were added in go-1.6.2.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index a1d6cf9..d5d964f 100644
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
