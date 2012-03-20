From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 00:20:21 +0100
Subject: [Buildroot] [git commit] parted: make sure to select libuuid in
	util-linux
Message-ID: <20120320233159.EA198953F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8402bc658afb7c6e9856f8dbe753388c64e53da3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

parted correctly depends on util-linux, but fails to select the
libuuid suboption of util-linux, causing the following build failure
if libuuid remains unselected:

checking for uuid_generate in -luuid... no
configure: error: GNU Parted requires libuuid - a part of the util-linux-ng package (but
usually distributed separately in libuuid-devel, uuid-dev or similar)
This can probably be found on your distribution's CD or FTP site or at:
    http://userweb.kernel.org/~kzak/util-linux-ng/
Note: originally, libuuid was part of the e2fsprogs package.  Later, it
moved to util-linux-ng-2.16, and that package is now the preferred source.
make: *** [/home/test/test/output/build/parted-3.1/.stamp_configured] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/parted/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/parted/Config.in b/package/parted/Config.in
index 610c040..7349763 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  parted, the GNU partition resizing program
 
