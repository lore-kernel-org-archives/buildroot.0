From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 18:18:49 +0200
Subject: [Buildroot] [git commit] portmap: prevent selecting the package
	when rpcbind is selected
Message-ID: <20140629161910.69CF99D109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c314a37eb39ad742b7fac56acc53452bb1ae83d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

portmap and rpcbind must not be selected at the same time. Users
should use rpcbind in favor of the deprecated portmap.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/portmap/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index fa7eaf1..d960690 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PORTMAP
 	bool "portmap"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# portmap and rpcbind provide the same feature, so they are
+	# mutually exclusive. rpcbind is the newer, preferred
+	# implementation.
+	depends on !BR2_PACKAGE_RPCBIND
 	help
 	  The standard portmapper for RPC services.
 
