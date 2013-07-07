From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Jul 2013 17:07:22 +0200
Subject: [Buildroot] [PATCH 1/3] efl: factorize version number as EFL_VERSION
Message-ID: <1373209644-18260-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the EFL components are released simultaneously, with an identical
version number, just like all Qt5 components for example. So it makes
sense to have a single EFL_VERSION variable in package/efl/efl.mk that
is used by all the packages in package/efl/*/*.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/efl.mk                                             | 2 ++
 package/efl/expedite/expedite.mk                               | 2 +-
 package/efl/libecore/libecore.mk                               | 2 +-
 package/efl/libedbus/libedbus.mk                               | 2 +-
 package/efl/libedje/libedje.mk                                 | 2 +-
 package/efl/libeet/libeet.mk                                   | 2 +-
 package/efl/libefreet/libefreet.mk                             | 2 +-
 package/efl/libeina/libeina.mk                                 | 2 +-
 package/efl/libeio/libeio.mk                                   | 2 +-
 package/efl/libelementary/libelementary.mk                     | 2 +-
 package/efl/libembryo/libembryo.mk                             | 2 +-
 package/efl/libethumb/libethumb.mk                             | 2 +-
 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk | 2 +-
 package/efl/libevas/libevas.mk                                 | 2 +-
 14 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index d8d53cf..b7462f1 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -1 +1,3 @@
+EFL_VERSION = 1.7.4
+
 include package/efl/*/*.mk
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index 68c7d34..dfd3a4a 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = 1.7.4
+EXPEDITE_VERSION = $(EFL_VERSION)
 EXPEDITE_SITE = http://download.enlightenment.org/releases/
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 0943a20..98496ac 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECORE_VERSION = 1.7.4
+LIBECORE_VERSION = $(EFL_VERSION)
 LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
 LIBECORE_SITE = http://download.enlightenment.org/releases/
 LIBECORE_LICENSE = BSD-2c
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index 0d34fc0..e6f9b08 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDBUS_VERSION = 1.7.4
+LIBEDBUS_VERSION = $(EFL_VERSION)
 LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
 LIBEDBUS_SITE = http://download.enlightenment.org/releases/
 LIBEDBUS_LICENSE = BSD-2c
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index c2f05f0..12d1999 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDJE_VERSION = 1.7.4
+LIBEDJE_VERSION = $(EFL_VERSION)
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
 LIBEDJE_SITE =  http://download.enlightenment.org/releases/
 LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index e7edd9e..ee33a0d 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEET_VERSION = 1.7.4
+LIBEET_VERSION = $(EFL_VERSION)
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 LIBEET_SITE = http://download.enlightenment.org/releases/
 LIBEET_LICENSE = BSD-2c
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index b23a5a5..27b8fa2 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEFREET_VERSION = 1.7.4
+LIBEFREET_VERSION = $(EFL_VERSION)
 LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
 LIBEFREET_SITE = http://download.enlightenment.org/releases/
 LIBEFREET_LICENSE = BSD-2c
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index ee40c14..1a11ae0 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEINA_VERSION = 1.7.4
+LIBEINA_VERSION = $(EFL_VERSION)
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
 LIBEINA_SITE = http://download.enlightenment.org/releases/
 LIBEINA_LICENSE = LGPLv2.1+
diff --git a/package/efl/libeio/libeio.mk b/package/efl/libeio/libeio.mk
index ba908ea..65d2a32 100644
--- a/package/efl/libeio/libeio.mk
+++ b/package/efl/libeio/libeio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEIO_VERSION = 1.7.4
+LIBEIO_VERSION = $(EFL_VERSION)
 LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
 LIBEIO_SITE = http://download.enlightenment.org/releases/
 LIBEIO_LICENSE = LGPLv2.1
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index f20a35d..82a8c1c 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = 1.7.4
+LIBELEMENTARY_VERSION = $(EFL_VERSION)
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
 LIBELEMENTARY_SITE = http://download.enlightenment.org/releases/
 LIBELEMENTARY_LICENSE = LGPLv2.1
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index 298b9f7..727c424 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEMBRYO_VERSION = 1.7.4
+LIBEMBRYO_VERSION = $(EFL_VERSION)
 LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
 LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
 LIBEMBRYO_LICENSE = BSD-2c, Embryo license
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index eb098ea..62ce752 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBETHUMB_VERSION = 1.7.4
+LIBETHUMB_VERSION = $(EFL_VERSION)
 LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
 LIBETHUMB_SITE = http://download.enlightenment.org/releases/
 LIBETHUMB_LICENSE = LGPLv2.1+
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
index c010348..6de7d64 100644
--- a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVAS_GENERIC_LOADERS_VERSION = 1.7.4
+LIBEVAS_GENERIC_LOADERS_VERSION = $(EFL_VERSION)
 LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
 LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases/
 LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 34a839a..41ceb49 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVAS_VERSION = 1.7.4
+LIBEVAS_VERSION = $(EFL_VERSION)
 LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
 LIBEVAS_SITE = http://download.enlightenment.org/releases/
 LIBEVAS_LICENSE = BSD-2c
-- 
1.8.1.2
