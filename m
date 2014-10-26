From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:02:58 +0100
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: disable colouring
	the output
Message-ID: <20141026160659.F140AB0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8773d61f7cc8e3644cbb52659a3fcd0d1afa375
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because cmake was the only build-system supporting this feature, it has been
disabled for the target packages.
For consistency, this patch does the same for host package too.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 3c5d4fe..c8735ef 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -95,6 +95,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
+		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
 		-DBUILD_DOCS=OFF \
 		-DBUILD_EXAMPLE=OFF \
