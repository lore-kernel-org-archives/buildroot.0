From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 23:15:33 +0100
Subject: [Buildroot] [git commit] kmscube: Bump to latest version to fix
	mips64el errors
Message-ID: <20170322221536.CFF1B82644@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a602f3c2ee7acc95bea082e2fdcddb926b032e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building kmscube for mips64el leads to the following build error:

cube-tex.c: In function 'get_fd_rgba':
cube-tex.c:230:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (int i = 0; i < texh; i++) {
  ^
cube-tex.c:230:2: note: use option -std=c99 or -std=gnu99 to compile your code
cube-tex.c: In function 'get_fd_y':
cube-tex.c:261:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (int i = 0; i < texh; i++) {
  ^
cube-tex.c: In function 'get_fd_uv':
cube-tex.c:292:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (int i = 0; i < texh/2; i++) {

I have sent a fix to mainline kmscube to address such issue, so bump to
the latest version.

Fixes: http://autobuild.buildroot.net/results/1f2/1f2ad0536254834582cf7fbce6a38dbb46a5e249/build-end.log

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmscube/kmscube.hash | 2 +-
 package/kmscube/kmscube.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
index e88bff9..e306d00 100644
--- a/package/kmscube/kmscube.hash
+++ b/package/kmscube/kmscube.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 dbd3eedd7fa518e3fc8bbcd424e408846a67c2c57661db30b3f5adb25f7e1513  kmscube-db8c6fc0f625e3a3d36731363276c459661d4149.tar.gz
+sha256 254d34209740731a557469030c960bbfd2299485a2ad0cbed2f7040b56a292a7  kmscube-6cbd03ab94066dddbba7bedfde87c7c4319c18d5.tar.gz
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index f04b882..37983b1 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSCUBE_VERSION = db8c6fc0f625e3a3d36731363276c459661d4149
+KMSCUBE_VERSION = 6cbd03ab94066dddbba7bedfde87c7c4319c18d5
 KMSCUBE_SITE = https://cgit.freedesktop.org/mesa/kmscube/snapshot
 KMSCUBE_LICENSE = MIT
 KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
