From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 19:36:56 +0200
Subject: [Buildroot] [git commit] package/squeezelite: faad2 is an optional
 dependency
Message-ID: <20190411173729.D98BB8E4F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4f57ece5920a0152d30e7217157afaed1b25ce5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squeezelite/Config.in      | 1 -
 package/squeezelite/squeezelite.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index b1820a146d..a034759143 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_SQUEEZELITE
 	select BR2_PACKAGE_FLAC
 	select BR2_PACKAGE_LIBMAD
 	select BR2_PACKAGE_LIBVORBIS
-	select BR2_PACKAGE_FAAD2
 	select BR2_PACKAGE_MPG123
 	help
 	  Logitech Media Server client
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index b4fb090f0f..2ed3d8b769 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -8,9 +8,15 @@ SQUEEZELITE_VERSION = 71c012ad9ba102feb95823b7b9dc17e5305689c7
 SQUEEZELITE_SITE = $(call github,ralph-irving,squeezelite,$(SQUEEZELITE_VERSION))
 SQUEEZELITE_LICENSE = GPL-3.0
 SQUEEZELITE_LICENSE_FILES = LICENSE.txt
-SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
+SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis mpg123
 SQUEEZELITE_MAKE_OPTS = -DLINKALL
 
+ifeq ($(BR2_PACKAGE_FAAD2),y)
+SQUEEZELITE_DEPENDENCIES += faad2
+else
+SQUEEZELITE_MAKE_OPTS += -DNO_FAAD
+endif
+
 ifeq ($(BR2_PACKAGE_SQUEEZELITE_FFMPEG),y)
 SQUEEZELITE_DEPENDENCIES += ffmpeg
 SQUEEZELITE_MAKE_OPTS += -DFFMPEG
