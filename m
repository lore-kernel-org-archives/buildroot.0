From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:07:49 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gupnp: security
 bump to version 1.0.5
Message-ID: <20200721200730.DF2DA8792B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=651af5f09c6c77dfd6d5c0897b5d527a50127f77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

- CVE-2020-12695: The Open Connectivity Foundation UPnP specification before
  2020-04-17 does not forbid the acceptance of a subscription request with a
  delivery URL on a different network segment than the fully qualified
  event-subscription URL, aka the CallStranger issue

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index c530eb7ef5..6997c8de55 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.4.sha256sum:
-sha256	8b0992650c6ef8566d2d0c9198c8a669106dc2c73aa908fcc4a4d043a8c0b544	gupnp-1.0.4.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.5.sha256sum:
+sha256 e9359fa8ed70c3c2b2b987869262ebb5c5ed1365726b7a9e8e59b3471e5c37f5  gupnp-1.0.5.tar.xz
 
 # Hash for license file:
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 29305f0b4b..e47506ed8f 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.0
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).5
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.0+
