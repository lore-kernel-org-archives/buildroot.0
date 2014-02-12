From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 22:14:45 +0100
Subject: [Buildroot] [git commit branch/next] manual: update /dev management
	section.
Message-ID: <20140212213526.34DDD9C9C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46dde29fbbf1450abb5584fb34b68d3bb24cb9d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch updates the /dev management section in the manual with information
about eudev, which replaces udev.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/configure.txt |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 89df3d9..9b8135a 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -216,7 +216,7 @@ x86_64 target, you have to generate a cross-compilation toolchain with
 Buildroot or crosstool-NG.
 
 If you want to generate a custom toolchain for your project, that can
-be used as an external toolchain in Buildroot, our recommandation is
+be used as an external toolchain in Buildroot, our recommendation is
 definitely to build it with http://crosstool-ng.org[crosstool-NG]. We
 recommend to build the toolchain separately from Buildroot, and then
 _import_ it in Buildroot using the external toolchain backend.
@@ -310,22 +310,24 @@ different solutions to handle the +/dev+ directory :
    about +mdev+ and the syntax of its configuration file, see
    http://git.busybox.net/busybox/tree/docs/mdev.txt.
 
- * The fourth solution is *Dynamic using udev*. This method also
+ * The fourth solution is *Dynamic using eudev*. This method also
    relies on the _devtmpfs_ virtual filesystem detailed above, but
-   adds the +udev+ userspace daemon on top of it. +udev+ is a daemon
+   adds the +eudev+ userspace daemon on top of it. +eudev+ is a daemon
    that runs in the background, and gets called by the kernel when a
    device gets added or removed from the system. It is a more
-   heavyweight solution than +mdev+, but provides higher flexibility
-   and is sometimes mandatory for some system components (systemd for
-   example). +udev+ is the mechanism used in most desktop Linux
-   distributions. For more details about +udev+, see
-   http://en.wikipedia.org/wiki/Udev.
+   heavyweight solution than +mdev+, but provides higher flexibility.
+   +eudev+ is a standalone version of +udev+, the original userspace
+   daemon used in most desktop Linux distributions, which is now part
+   of Systemd. For more details, see http://en.wikipedia.org/wiki/Udev.
 
-The Buildroot developers recommandation is to start with the *Dynamic
+The Buildroot developers recommendation is to start with the *Dynamic
 using devtmpfs only* solution, until you have the need for userspace
 to be notified when devices are added/removed, or if firmwares are
 needed, in which case *Dynamic using mdev* is usually a good solution.
 
+Note that if +systemd+ is chosen as init system, /dev management will
+be performed by the +udev+ program provided by +systemd+.
+
 init system
 ~~~~~~~~~~~
 
