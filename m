From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 13:01:20 +0100
Subject: [Buildroot] [git commit] gadget-test: inherit arch dependencies
	from libaio
Message-ID: <20121218120147.91FDB9A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc274b38ef2bfd12043d8e962864a509f82e78d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/7ad59020d4584a777d721352ae73ab2dd33326d7/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gadgetfs-test/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index a582db6..36713fc 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -6,8 +6,13 @@ config BR2_PACKAGE_GADGETFS_TEST
 
 config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	bool "use asynchronous i/o"
-	depends on BR2_PACKAGE_GADGETFS_TEST
 	select BR2_PACKAGE_LIBAIO
+	depends on BR2_PACKAGE_GADGETFS_TEST
+	# libaio is available only on few architectures
+	depends on \
+		BR2_arm   || BR2_armeb || BR2_avr32  || BR2_i386    || \
+		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
+		BR2_sparc || BR2_x86_64
 	help
 	  Select this to have gadgetfs-test do asynchronous I/O using
 	  the libaio library.
