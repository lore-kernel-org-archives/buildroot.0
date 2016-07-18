From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 18 Jul 2016 16:28:50 +0200
Subject: [Buildroot] [PATCH 2/2] fcgiwrap: Add a patch to link with
	libsystemd, not libsystemd-daemon.
In-Reply-To: <1468852130-1525-1-git-send-email-thomas.claveirole@green-communications.fr>
References: <1468852130-1525-1-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <1468852130-1525-3-git-send-email-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 ...ith-libsystemd-instead-of-libsystemd-daemon.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch

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
-- 
2.8.1
