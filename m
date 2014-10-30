From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 19:07:05 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
	2.1.8
Message-ID: <20141030180711.4A26CB2247@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd0a51de452dc7f1cbfd02fb1ab9d6200d43ede4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2.1.8:
* remove comment about COPYING (fixed upstream)
* adapt ssl configure option for openssl and polarssl

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/shairport-sync.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 58343f4..8c345f2 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.1.5
+SHAIRPORT_SYNC_VERSION = 2.1.8
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
-# Note: the COPYING file contains the text of GPLv3, but none of the
-# code is under this license. Bug reported upstream at
-# https://github.com/mikebrady/shairport-sync/issues/13.
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
 SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libdaemon popt
@@ -27,10 +24,10 @@ endif
 # OpenSSL or PolarSSL
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SHAIRPORT_SYNC_DEPENDENCIES += openssl
-SHAIRPORT_SYNC_CONF_OPTS += --with-openssl
+SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
 else
 SHAIRPORT_SYNC_DEPENDENCIES += polarssl
-SHAIRPORT_SYNC_CONF_OPTS += --with-polarssl
+SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=polarssl
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
