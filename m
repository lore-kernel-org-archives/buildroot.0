From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:49 +0200
Subject: [Buildroot] [git commit branch/next] package/go: pass
 CFLAGS/CXXFLAGS/LDFLAGS in HOST_GO_TARGET_ENV
Message-ID: <20200829124232.AE6B9815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a89fa07ee2813a515da91d884ce5920e1ba1887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

HOST_GO_HOST_ENV is explicitly specifying
HOST_CGO_{CFLAGS,CXXFLAGS,LDFLAGS}, so let's do the same for target
packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 9f86374300..af1548a65e 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -55,6 +55,9 @@ HOST_GO_TARGET_ENV = \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
+	CGO_CFLAGS="$(TARGET_CFLAGS)" \
+	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
 # The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
