From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:20:09 +0200
Subject: [Buildroot] [git commit] fcgiwrap: Add a patch to link with
	libsystemd, not libsystemd-daemon.
Message-ID: <20160718212412.5EE53803A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3dbd99c0d7a4d9fa318900db11d7b88141985739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/9b5e70e42e53e7752245f7c43bd01f208fcf76d0/

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ith-libsystemd-instead-of-libsystemd-daemon.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch b/package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch
new file mode 100644
index 0000000..e88706f
--- /dev/null
+++ b/package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch
@@ -0,0 +1,20 @@
+configure.ac: Check for libsystemd, not libsystemd-daemon.
+
+Newer versions of systemd do not provide libsystemd-daemon anymore.
+Therefore, use libsystemd instead.
+
+Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
+
+diff --git a/configure.ac b/configure.ac
+index bb3674e..2b02ef4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,7 +28,7 @@ AC_ARG_WITH([systemd],
+   [], [with_systemd=check])
+ have_systemd=no
+ if test "x$with_systemd" != "xno"; then
+-  PKG_CHECK_MODULES(systemd, [libsystemd-daemon],
++  PKG_CHECK_MODULES(systemd, [libsystemd],
+     [AC_DEFINE(HAVE_SYSTEMD, 1, [Define if systemd is available])
+     have_systemd=yes],
+   have_systemd=no)
