From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:55:32 +0100
Subject: [Buildroot] [git commit] keepalived: bump to version 1.3.5
Message-ID: <20170320205548.5A968825F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a429a3803de4010dac32c5e61fa1513608fddf8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script now supports --{enable,disable}-libnl, use them.

Cc: Ilias Apalodimas <apalos@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/keepalived/keepalived.hash | 5 +----
 package/keepalived/keepalived.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 543e60a..5d33c5b 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,5 +1,2 @@
-# From http://www.keepalived.org/download.html
-md5 744025d57c7f065c42fe925b0283897e	keepalived-1.3.2.tar.gz
-sha1	449f06dfce07e05c1ebd516d0545182e1416f264  keepalived-1.3.2.tar.gz
 # Locally calculated
-sha256	0f261e6810b3eced68dc9858a1f28694e4a91116035fe76c4400ec4ac208feda	5d98b7b69fcbba84fa69e5b5e9a019bfbcb76e8b.patch
+sha256	c0114d86ea4c896557beb0d9367819a423ffba772bc5d7c548dc455e6b3bd048  keepalived-1.3.5.tar.gz
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 95757ff..35e666a 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 1.3.2
+KEEPALIVED_VERSION = 1.3.5
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
 KEEPALIVED_LICENSE = GPLv2+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS += --disable-dbus
 
-KEEPALIVED_PATCH = https://github.com/acassen/keepalived/commit/5d98b7b69fcbba84fa69e5b5e9a019bfbcb76e8b.patch
-
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_PACKAGE_LIBNFNETLINK),yy)
 KEEPALIVED_DEPENDENCIES += libnl libnfnetlink
+KEEPALIVED_CONF_OPTS += --enable-libnl
+else
+KEEPALIVED_CONF_OPTS += --disable-libnl
 endif
 
 ifeq ($(BR2_PACKAGE_IPSET),y)
