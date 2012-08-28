From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Aug 2012 01:02:26 +0200
Subject: [Buildroot] [git commit] prboom,
	oprofile: Add explicit <foo>_SITE statements
Message-ID: <20120828230609.F408A97083@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd355e1125b5f3cbc0884c975f9972431639bfdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default <foo>_SITE value that pkg-generic sets when the .mk file
doesn't declare it is using BR2_SOURCEFORGE_MIRROR and therefore isn't
consistent with the usage of downloads.sourceforge.net we have
generalized for all drivers.

Since the downloads.sourceforge.net URLs are inherently specific to
each package, we can no longer provide a default in pkg-generic.mk,
and therefore each package *must* declare its own <foo>_SITE value.

This patch fixes the only two packages that were lacking a <foo>_SITE
value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/games/prboom/prboom.mk |    1 +
 package/oprofile/oprofile.mk   |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 4dbfd1d..1f5c3dd 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -4,6 +4,7 @@
 #
 #############################################################
 PRBOOM_VERSION = 2.5.0
+PRBOOM_SITE = http://downloads.sourceforge.net/project/prboom/prboom%20stable/$(PRBOOM_VERSION)
 PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
 PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
 
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 256ae9b..54c46dd 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -5,6 +5,7 @@
 #############################################################
 
 OPROFILE_VERSION = 0.9.7
+OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
 OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
