From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  7 May 2014 18:40:39 +0200
Subject: [Buildroot] [PATCH] cmake: disable building of ccmake
Message-ID: <1399480839-30134-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ccmake program requires the ncurses package so it fails to build if
the host system does not have it installed.
To get rid off the ncurses dependency do not build anymore the ccmake
program because it's not needed by buildroot.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Alexander Potashev <aspotashev@gmail.com>
---
 package/cmake/cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d45c642..d0af828 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -15,6 +15,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		CFLAGS="$(HOST_CFLAGS)" \
 		./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) \
+		-- -DBUILD_CursesDialog=OFF \
 	)
 endef
 
-- 
1.9.1
