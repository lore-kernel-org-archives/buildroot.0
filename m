From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Feb 2011 20:44:45 +0100
Subject: [Buildroot] [git commit master 1/1] bzip2: don't hide on
	!BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
Message-ID: <20110203195508.1628E8F39F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3cc0e5f85a23c884efebb357d35295a08a3c8c97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quite a lot of packages select bzip2 (for its libbz2 library), so don't
hide it even though busybox DOES have a bzip2 applet - Otherwise
kconfig complains.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 16a9e8f..de51c46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -7,8 +7,8 @@ source "package/customize/Config.in"
 source "package/multimedia/Config.in"
 
 menu "Compressors and decompressors"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bzip2/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gzip/Config.in"
 endif
 source "package/lzop/Config.in"
-- 
1.7.3.4
