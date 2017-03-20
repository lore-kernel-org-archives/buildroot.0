From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Mar 2017 21:57:26 +0200
Subject: [Buildroot] [PATCH 2/2] keepalived: bump to version 1.3.5
In-Reply-To: <f81b2b2f55f9f4294cf46af025e4a6108e5f413e.1490039846.git.baruch@tkos.co.il>
References: <f81b2b2f55f9f4294cf46af025e4a6108e5f413e.1490039846.git.baruch@tkos.co.il>
Message-ID: <f06b6c1a50e0f0bcff6d0dd7e893b918b939a926.1490039846.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script now supports --{enable,disable}-libnl, use them.

Cc: Ilias Apalodimas <apalos@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/keepalived/keepalived.hash | 5 +----
 package/keepalived/keepalived.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 543e60ad5616..5d33c5be006b 100644
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
index 95757ff68130..35e666af1cc9 100644
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
-- 
2.11.0
