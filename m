From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Sep 2012 22:44:10 +0200
Subject: [Buildroot] [git commit] collectd: fix rrdtool suboption dependency
Message-ID: <20120903210607.DE63990958@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11f338bcbc48816b0e4d637ea6f798f7df328d2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes warning: (BR2_PACKAGE_COLLECTD_RRDTOOL) selects BR2_PACKAGE_RRDTOOL
which has unmet direct dependencies (BR2_USE_WCHAR).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 4fae6d5..fe520f8 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -360,6 +360,7 @@ config BR2_PACKAGE_COLLECTD_NETWORK
 
 config BR2_PACKAGE_COLLECTD_RRDTOOL
 	bool "rrdtool"
+	depends on BR2_USE_WCHAR # rrdtool
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBART
 	select BR2_PACKAGE_LIBPNG
@@ -368,6 +369,9 @@ config BR2_PACKAGE_COLLECTD_RRDTOOL
 	help
 	  Writes values to RRD-files.
 
+comment "rrdtool support requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_COLLECTD_UNIXSOCK
 	bool "unixsock"
 	help
