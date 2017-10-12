From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 12 Oct 2017 20:33:32 -0300
Subject: [Buildroot] [PATCH] coreutils: expand list of files moved from
	/usr/bin to /bin
Message-ID: <20171012233332.30550-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BusyBox installs kill, link, mktemp, nice and printenv on /bin, so
ensure that coreutils replaces them.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/coreutils/coreutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6a8a31b061..8259f42f4a 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -56,8 +56,8 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	INSTALL_PROGRAM=$(INSTALL)
 
 COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
-	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
-	uname join
+	kill link ln ls mkdir mknod mktemp mv nice printenv pwd rm rmdir \
+	vdir sleep stty sync touch true uname join
 
 # If both coreutils and busybox are selected, make certain coreutils
 # wins the fight over who gets to have their utils actually installed.
-- 
2.13.6
