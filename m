From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 17:56:22 +0200
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
	2.4.1
Message-ID: <20151012155642.8425D817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6ed9adc18b9e2cdd2dfda6cadcbab3f9ad1f7f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove backported from upstream patch.
- Fix autoreconf comment that was wrong.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/shairport-sync.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 36d5b82..fa7100a 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.4
+SHAIRPORT_SYNC_VERSION = 2.4.1
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
 SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
-SHAIRPORT_SYNC_PATCH = https://github.com/mikebrady/shairport-sync/commit/6ae067af1f695e615415cde69a506ad330dbc45b.patch
 
-# Touching configure.ac with the patches
+# git clone, no configure
 SHAIRPORT_SYNC_AUTORECONF = YES
 
 SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
