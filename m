From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  8 Sep 2015 23:28:53 +0200
Subject: [Buildroot] [RFC 5/6] docs/manual: document "Dynamic using mdev
	only" /dev management
In-Reply-To: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1441747734-18730-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/configure.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 997be2b..ea78d96 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -324,6 +324,17 @@ different solutions to handle the +/dev+ directory :
    daemon used in most desktop Linux distributions, which is now part
    of Systemd. For more details, see http://en.wikipedia.org/wiki/Udev.
 
+ * *Dynamic using mdev only* uses +mdev+ and allows to use all the
+   features of +mdev+, including dynamic device creation and firmware
+   handling, but does not use _devtmpfs_.
+   If you have to use a kernel older than 2.6.32 this is the only
+   option to have dynamic /dev management, although it can be used
+   with more recent versions of the kernel as well.
+   If you build your Linux kernel outside of Buildroot, you should
+   disable +CONFIG_DEVTMPFS+ and +CONFIG_DEVTMPFS_MOUNT+ in your kernel
+   configuration. When Buildroot is in charge of building the Linux
+   kernel, it disables them automatically.
+
 The Buildroot developers recommendation is to start with the *Dynamic
 using devtmpfs only* solution, until you have the need for userspace
 to be notified when devices are added/removed, or if firmwares are
-- 
1.9.1
