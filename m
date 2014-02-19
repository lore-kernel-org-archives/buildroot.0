From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 23:17:00 +0100
Subject: [Buildroot] [git commit] libvncserver: needs mmu
Message-ID: <20140219221844.1ABE09CA86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c150f893de021eaa88f081a65308f186edcdf34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/30e/30e6a879ab6d84df4688c3d29761522f68dad9fc/

fork() is only used in VNCommand.c, so it seems doable to patch the sources
(and send upstream) to make it work on !mmu if people are interested.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index ff83e34..07b77f5 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBVNCSERVER
 	bool "libvncserver"
+	depends on BR2_USE_MMU # VNCommand.c uses fork()
 	help
 	  libvncserver is a VNC server/client library.
 
