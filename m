From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 11:52:01 +0200
Subject: [Buildroot] [git commit] lighttpd: bump to version 1.4.37
Message-ID: <20150904100014.00ADD81EDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4d35acc9a6fa851b2ea468ebf32df1ee37507f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../lighttpd/0001-Fix-default-config-file.patch    |   32 ++++++++++---------
 package/lighttpd/lighttpd.hash                     |    2 +-
 package/lighttpd/lighttpd.mk                       |    2 +-
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/package/lighttpd/0001-Fix-default-config-file.patch b/package/lighttpd/0001-Fix-default-config-file.patch
index bffc2a8..ada1589 100644
--- a/package/lighttpd/0001-Fix-default-config-file.patch
+++ b/package/lighttpd/0001-Fix-default-config-file.patch
@@ -9,11 +9,13 @@ Modify the default lighttpd configuration file to have one a starting conf
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
+[Gustavo: update for 1.4.37]
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nurp a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.conf
---- a/doc/config/conf.d/access_log.conf	2010-07-11 18:01:32.000000000 +0100
-+++ b/doc/config/conf.d/access_log.conf	2012-07-21 19:37:58.453207990 +0100
-@@ -9,7 +9,7 @@ server.modules += ( "mod_accesslog" )
+diff -Nura lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf lighttpd-1.4.37/doc/config/conf.d/access_log.conf
+--- lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf	2015-09-01 14:38:48.684673663 -0300
++++ lighttpd-1.4.37/doc/config/conf.d/access_log.conf	2015-09-01 14:38:53.975855142 -0300
+@@ -9,7 +9,7 @@
  ##
  ## Default access log.
  ##
@@ -22,9 +24,9 @@ diff -Nurp a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.co
  
  ##
  ## The default format produces CLF compatible output.
-diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
---- a/doc/config/lighttpd.conf	2011-12-18 12:57:25.000000000 +0000
-+++ b/doc/config/lighttpd.conf	2012-07-21 19:40:45.281200552 +0100
+diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/config/lighttpd.conf
+--- lighttpd-1.4.37.orig/doc/config/lighttpd.conf	2015-09-01 14:38:48.684673663 -0300
++++ lighttpd-1.4.37/doc/config/lighttpd.conf	2015-09-01 14:39:40.256442492 -0300
 @@ -13,8 +13,8 @@
  ## if you add a variable here. Add the corresponding variable in the
  ## chroot example aswell.
@@ -36,7 +38,7 @@ diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
  var.state_dir   = "/var/run"
  var.home_dir    = "/var/lib/lighttpd"
  var.conf_dir    = "/etc/lighttpd"
-@@ -90,7 +90,7 @@ server.port = 80
+@@ -90,7 +90,7 @@
  ##
  ## Use IPv6?
  ##
@@ -45,7 +47,7 @@ diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
  
  ##
  ## bind to a specific IP
-@@ -101,8 +101,8 @@ server.use-ipv6 = "enable"
+@@ -101,8 +101,8 @@
  ## Run as a different username/groupname.
  ## This requires root permissions during startup. 
  ##
@@ -56,7 +58,7 @@ diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
  
  ## 
  ## enable core files.
-@@ -112,7 +112,7 @@ server.groupname = "lighttpd"
+@@ -112,7 +112,7 @@
  ##
  ## Document root
  ##
@@ -65,7 +67,7 @@ diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
  
  ##
  ## The value for the "Server:" response field.
-@@ -138,7 +138,7 @@ server.pid-file = state_dir + "/lighttpd
+@@ -138,7 +138,7 @@
  ##
  ## Path to the error log file
  ##
@@ -74,16 +76,16 @@ diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
  
  ##
  ## If you want to log to syslog you have to unset the 
-@@ -188,7 +188,7 @@ server.event-handler = "linux-sysepoll"
- ## linux-sendfile - is recommended for small files.
+@@ -188,7 +188,7 @@
+ ## sendfile       - is recommended for small files.
  ## writev         - is recommended for sending many large files
  ##
--server.network-backend = "linux-sendfile"
+-server.network-backend = "sendfile"
 +server.network-backend = "writev"
  
  ##
  ## As lighttpd is a single-threaded server, its main resource limit is
-@@ -311,9 +311,9 @@ url.access-deny             = ( "~", ".i
+@@ -311,9 +311,9 @@
  ## disable range requests for pdf files
  ## workaround for a bug in the Acrobat Reader plugin.
  ##
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index f74727c..b06e2ae 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256	897ab6b1cc7bd51671f8af759e7846245fbbca0685c30017e93a5882a9ac1a53	lighttpd-1.4.36.tar.xz
+sha256	804e6f60567ca1da2b3927f92b7e9332b93aca9560f282ca135b86b7558979bd	lighttpd-1.4.37.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index c75eeff..9ff8cfe 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).36
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).37
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
