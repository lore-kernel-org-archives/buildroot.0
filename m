From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 13:31:41 +0200
Subject: [Buildroot] [git commit] gst1-validate: bump version to 1.12.0
Message-ID: <20170704113143.59A377FCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47f79e2947b2442177b11f4d94df597fb6ec67e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove non-existant configure options:

  --disable-sphinx-doc:
  Even if it looks like there is some code for that in configure.ac, it
  seems that is not taken into account and that configure option is not
  even recognized.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 10c6667..edb5ccd 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.4.tar.xz.sha256sum
-sha256 e59c00bf64cca9c477cdb44eb8dd0b3aac5499b17d77bf28ee054fd211e8d73c  gst-validate-1.10.4.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.0.tar.xz.sha256sum
+sha256 73efaf123638b97159c1ff6575dd05ea0cf7dc6d71b07806b5a5f25188a67fbb  gst-validate-1.12.0.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index f108e5d..d6a5a55 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.10.4
+GST1_VALIDATE_VERSION = 1.12.0
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
 GST1_VALIDATE_LICENSE_FILES = COPYING
 
-GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
-
 GST1_VALIDATE_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
