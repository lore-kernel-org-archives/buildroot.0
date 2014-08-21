From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:21:46 +0200
Subject: [Buildroot] [git commit] gstreamer{,
	1}: fix unaligned access detection for arc
Message-ID: <20140821132317.EA4F89D4CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=520e74f2b5cd70ff92da4e8c64fdaae144525232
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the same issue as reported for microblaze here
http://autobuild.buildroot.net/results/f49/f4914bb3999c8a7a0c0a2afdac5de40fb9058372/

Similar to the existing handling for avr32, microblaze and xtensa.
Also add it for gstreamer1 for good measure as it was missing there as well.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gstreamer/gstreamer.mk    |    2 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 4696876..3f8643d 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -12,7 +12,7 @@ GSTREAMER_INSTALL_STAGING = YES
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
+ifeq ($(BR2_arc)$(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index bf23582..338a722 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -14,7 +14,7 @@ GSTREAMER1_LICENSE = LGPLv2+ LGPLv2.1+
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
+ifeq ($(BR2_arc)$(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
 GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
