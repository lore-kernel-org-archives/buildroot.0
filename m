From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 19 Feb 2016 08:48:56 +0100
Subject: [Buildroot] [PATCH] package/avahi: bump to version 0.6.32
Message-ID: <1455868136-8911-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
 * switch download site to github as the previous download page is not
   maintained anymore
 * drop 0004-no-gtk-deprecations.patch as it is applied upstream

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Note: Does anyone knows if we still need to set AVAHI_CONF_ENV? Unfortunatly,
      there is no comment about this.

---
 package/avahi/0004-no-gtk-deprecations.patch | 30 ----------------------------
 package/avahi/avahi.hash                     |  2 +-
 package/avahi/avahi.mk                       |  4 ++--
 3 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/avahi/0004-no-gtk-deprecations.patch

diff --git a/package/avahi/0004-no-gtk-deprecations.patch b/package/avahi/0004-no-gtk-deprecations.patch
deleted file mode 100644
index d187053..0000000
--- a/package/avahi/0004-no-gtk-deprecations.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Patch from http://pkgs.fedoraproject.org/cgit/avahi.git/plain/avahi-0.6.31-no-deprecations.patch?id=b3f4de05e331258c5123e3acc144e452595c2112
-
-Don't disable deprecated GTK support, as that breaks builds with modern GTK3
-versions.
-
-For more details, see the Fedora bugzilla:
-https://bugzilla.redhat.com/show_bug.cgi?id=1001676
-
-[Peter: patch Makefile.in so we don't need autoreconf]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- avahi-ui/Makefile.am |    2 +-
- avahi-ui/Makefile.in |    3 +--
- configure.ac         |    2 +-
- 3 files changed, 3 insertions(+), 4 deletions(-)
-
-Index: avahi-0.6.31/avahi-ui/Makefile.in
-===================================================================
---- avahi-0.6.31.orig/avahi-ui/Makefile.in
-+++ avahi-0.6.31/avahi-ui/Makefile.in
-@@ -464,8 +464,7 @@
- top_srcdir = @top_srcdir@
- 
- # This cool debug trap works on i386/gcc only
--AM_CFLAGS = -I$(top_srcdir) -DG_DISABLE_DEPRECATED=1 \
--	-DGDK_DISABLE_DEPRECATED=1 -DGTK_DISABLE_DEPRECATED=1 \
-+AM_CFLAGS = -I$(top_srcdir) \
- 	'-DDEBUG_TRAP=__asm__("int $$3")' $(am__append_1)
- pkglibdatadir = $(libdir)/avahi
- desktopdir = $(datadir)/applications
diff --git a/package/avahi/avahi.hash b/package/avahi/avahi.hash
index 99bbd51..09c5d42 100644
--- a/package/avahi/avahi.hash
+++ b/package/avahi/avahi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48	avahi-0.6.31.tar.gz
+sha256  d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454	avahi-0.6.32.tar.gz
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 5d6e6a8..cad7acd 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -11,8 +11,8 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION = 0.6.31
-AVAHI_SITE = http://www.avahi.org/download
+AVAHI_VERSION = 0.6.32
+AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
 AVAHI_LICENSE = LGPLv2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
-- 
2.7.1
