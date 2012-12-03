From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Dec 2012 16:31:54 -0800
Subject: [Buildroot] [git commit] libtool: undeprecate for now
Message-ID: <20121203010304.2A651996F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f619d5ba20ef46c57259f35a21bb98b7c85c35a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pulseaudio selects libtool, so get rid of the deprecated annotation so
people don't get warnings about unmet dependencies when exiting menuconfig.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtool/Config.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/libtool/Config.in b/package/libtool/Config.in
index 42df25b..d3cf2d7 100644
--- a/package/libtool/Config.in
+++ b/package/libtool/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_LIBTOOL
 	bool "libtool"
-	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED
 	help
 	  Library that hides the complexity of using shared/static libraries
 	  on different platforms behind a consistent, portable interface.
