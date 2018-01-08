From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Jan 2018 22:30:02 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] coreutils: expand list of
 files moved from /usr/bin to /bin
Message-ID: <20180108215441.82A0C803A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67bd585fba27985dc5e32fe45d489d1a22bab3d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

BusyBox installs kill, link, mktemp, nice and printenv on /bin, so
ensure that coreutils replaces them.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 443897bce4b01eae98155ac947d3387e6a2f289e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6a8a31b..8259f42 100644
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
