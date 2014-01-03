From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  3 Jan 2014 13:44:17 +0100
Subject: [Buildroot] [PATCH v5 5/5] manual: update /dev management section.
In-Reply-To: <1388753057-13485-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1388753057-13485-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1388753057-13485-6-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates the /dev management section in the manual with information
about eudev, which replaces udev.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 docs/manual/configure.txt |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 89df3d9..32a12ce 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
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
 
 The Buildroot developers recommandation is to start with the *Dynamic
 using devtmpfs only* solution, until you have the need for userspace
 to be notified when devices are added/removed, or if firmwares are
 needed, in which case *Dynamic using mdev* is usually a good solution.
 
+Note that if +systemd+ is chosen as init system, /dev management will
+be performed by the +udev+ program provided by +systemd+.
+
 init system
 ~~~~~~~~~~~
 
-- 
1.7.9.5
