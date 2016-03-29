From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:04:15 +0200
Subject: [Buildroot] [git commit] package/ortp: bump version to 0.25.0
Message-ID: <20160329011109.E58E47FB80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ebad1fb1e56fa3a48d6ceb40910560ea2a8534a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version bump is needed by mediastreamer 2.12.1, the mediastreamer
bump is needed to provide support for ffmpeg 3.0.

Removed srtp option after srtp support was removed from ortp:
https://github.com/BelledonneCommunications/ortp/commit/5e37fa55f1f15f5896d69156e64cdc95a1ff68bf

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ortp/ortp.hash | 4 ++--
 package/ortp/ortp.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
index 728a0d1..8b099a7 100644
--- a/package/ortp/ortp.hash
+++ b/package/ortp/ortp.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	6e37e29b3c3559bac1f2ae0c977f6ceb4d4ce8dc713b691dea8bae57bda92d0b	ortp-0.22.0.tar.gz
+# Locally calculated
+sha256	0deb826b79b1fd329f7638821d5439dc343bc55bb122daa6c90d19116cfe8d9a	ortp-0.25.0.tar.gz
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 89bfc06..ca4a90d 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-ORTP_VERSION = 0.22.0
+ORTP_VERSION = 0.25.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 
-# ortp is not happy with the libsrtp implementation packaged in
-# Buildroot
-ORTP_CONF_OPTS = --disable-strict --with-srtp=none
+ORTP_CONF_OPTS = --disable-strict
 ORTP_INSTALL_STAGING = YES
 ORTP_LICENSE = LGPLv2.1+
 ORTP_LICENSE_FILES = COPYING
