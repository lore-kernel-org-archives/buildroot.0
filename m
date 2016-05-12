From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 16:21:04 +0200
Subject: [Buildroot] [git commit] package/go: Fix powerpc64 config typo
Message-ID: <20160512142121.04C7481844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6b718ca4bd1efa51674a824ff8d32a90a1d6584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo in config powerpc64 depends.  Go language only supports 64 bit powerpc.

Also add BR2_powerpc64le to depends list.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go/Config.in.host | 2 +-
 package/go/go.mk          | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 094e402..b570803 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
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
