From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:23:43 +0200
Subject: [Buildroot] [git commit] cmake: disable building of ccmake
Message-ID: <20140512204138.AA32A9CB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e87c0ded4df0e539c5c1cb0b578dfc2ab2af5e45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To speedup building disable ccmake because it's not needed by buildroot.
Also disabling ccmake get rid of the ncurses optional unspecified
dependency for the sake of reproducible builds.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Alexander Potashev <aspotashev@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 235988b..ee49e80 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -19,6 +19,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
 			-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
 			-DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" \
 			-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+			-DBUILD_CursesDialog=OFF \
 	)
 endef
 
