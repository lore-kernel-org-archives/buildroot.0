From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:32:56 +0200
Subject: [Buildroot] [git commit] mutt: bump version to 1.8.2
Message-ID: <20170420203259.D2D8682753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f94bcfe724f988bec14e7e63699fa76afbdcd3f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0001-nodoc.patch is no longer necessary since a new --disable-doc
configure option has been added by this commit:
  https://dev.mutt.org/hg/mutt/rev/b45bfce1bb0e

Use that option and remove the patch. Since we are not patching
Makefile.am we also don't need to autoreconf.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mutt/0001-nodoc.patch | 21 ---------------------
 package/mutt/mutt.hash        |  2 +-
 package/mutt/mutt.mk          |  5 ++---
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/package/mutt/0001-nodoc.patch b/package/mutt/0001-nodoc.patch
deleted file mode 100644
index 6fd556d..0000000
--- a/package/mutt/0001-nodoc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Disable the documentation build
-
-The documentation tool is compiled for the target, but executed on the
-host. We don't bother fixing this, as we don't care of the
-documentation in Buildroot.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: mutt-1.5.17+20080114/Makefile.am
-===================================================================
---- mutt-1.5.17+20080114.orig/Makefile.am	2010-05-15 18:15:08.000000000 +0200
-+++ mutt-1.5.17+20080114/Makefile.am	2010-05-15 18:15:17.000000000 +0200
-@@ -9,7 +9,7 @@
- IMAP_INCLUDES = -I$(top_srcdir)/imap
- endif
- 
--SUBDIRS = m4 po intl doc contrib $(IMAP_SUBDIR)
-+SUBDIRS = m4 po intl contrib $(IMAP_SUBDIR)
- 
- bin_SCRIPTS = muttbug flea @SMIMEAUX_TARGET@
- 
diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 460cd5f..6df2638 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 e9c6f88e83d48690033f0d862a70293ac746286b77241554f5448bc23bd0d6df  mutt-1.7.1.tar.gz
+sha256 1d057bf1b565f2c38ee50c9a661654cbbe4165f98e25bfa361ebbd707d96f235  mutt-1.8.2.tar.gz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 8c3be5e..8ff6649 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.7.1
+MUTT_VERSION = 1.8.2
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
-MUTT_CONF_OPTS = --disable-smtp
-MUTT_AUTORECONF = YES
+MUTT_CONF_OPTS = --disable-doc --disable-smtp
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
