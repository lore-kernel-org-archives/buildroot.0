From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 12 May 2014 13:19:36 +0200
Subject: [Buildroot] [PATCH v2] cmake: disable building of ccmake
Message-ID: <1399893576-24505-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---

v2:
 - rebased
 - change description

Luca because the patch it's changed I was not sure if adding your
Reviewed-by and Tested-by tags by myself was ok.

 package/cmake/cmake.mk | 1 +
 1 file changed, 1 insertion(+)

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
 
-- 
1.9.1
