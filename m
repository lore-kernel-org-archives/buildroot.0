From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:06:55 +0200
Subject: [Buildroot] [git commit] package/go: add double quotes around
	TARGET_CC/TARGET_CXX
Message-ID: <20160526191312.642B881926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a1e4a5c7dd94e0490df95597635eb48e4f7f7fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using double quotes around TARGET_CC/TARGET_CXX is mandatory, since
they are composed of several words when ccache support is enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go/go.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 98615aa..a1d6cf9 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -40,8 +40,8 @@ HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
 	GOARCH=$(GO_GOARCH) \
 	GOROOT="$(HOST_GO_ROOT)" \
-	CC=$(TARGET_CC) \
-	CXX=$(TARGET_CXX) \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
 # The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
@@ -74,8 +74,8 @@ HOST_GO_MAKE_ENV = \
 	CC=$(HOSTCC_NOCCACHE)
 
 HOST_GO_TARGET_CC = \
-	CC_FOR_TARGET=$(TARGET_CC) \
-	CXX_FOR_TARGET=$(TARGET_CXX)
+	CC_FOR_TARGET="$(TARGET_CC)" \
+	CXX_FOR_TARGET="$(TARGET_CXX)"
 
 HOST_GO_HOST_CC = \
 	CC_FOR_TARGET=$(HOSTCC_NOCCACHE) \
