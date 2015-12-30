From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:02:45 +0100
Subject: [Buildroot] [git commit] libvncserver: disable on nios2,
	due to binutils issues
Message-ID: <20151230220308.A387E80AE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b093218c452a4846c1db0c01300db8086d130c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/469/469d5667f05ca6954805772fcaaa2b33dfdc6167/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvncserver/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 28fbaa5..460aa78 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBVNCSERVER
 	bool "libvncserver"
 	depends on BR2_USE_MMU # VNCommand.c uses fork()
+	# binutils issue (bad expression)
+	depends on !BR2_nios2
 	help
 	  libvncserver is a VNC server/client library.
 
