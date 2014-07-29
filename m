From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:45 +0200
Subject: [Buildroot] [PATCH 18 of 20] packages: rename FOO_GETTEXTIZE_OPT
 into FOO_GETTEXTIZE_OPTS
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <3d344da68b41a9a06831.1406668365@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_GETTEXTIZE_OPT.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-autotools.txt |  2 +-
 package/pkg-autotools.mk                  |  4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff -r 9d23ec1bdf4c -r 3d344da68b41 docs/manual/adding-packages-autotools.txt
--- a/docs/manual/adding-packages-autotools.txt	Tue Jul 29 22:11:38 2014 +0200
+++ b/docs/manual/adding-packages-autotools.txt	Tue Jul 29 22:13:03 2014 +0200
@@ -136,7 +136,7 @@
   'gettextize'.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
   values are +YES+ and +NO+. The default is +NO+.
 
-* +LIBFOO_GETTEXTIZE_OPT+, to specify additional options passed to
+* +LIBFOO_GETTEXTIZE_OPTS+, to specify additional options passed to
   the 'gettextize' program, if +LIBFOO_GETTEXTIZE=YES+. You may
   use that if, for example, the +.po+ files are not located in the
   standard place (i.e. in +po/+ at the root of the package.) By
diff -r 9d23ec1bdf4c -r 3d344da68b41 package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Tue Jul 29 22:11:38 2014 +0200
+++ b/package/pkg-autotools.mk	Tue Jul 29 22:13:03 2014 +0200
@@ -96,7 +96,7 @@
 endif
 
 ifeq ($(4),host)
- $(2)_GETTEXTIZE_OPT ?= $$($(3)_GETTEXTIZE_OPT)
+ $(2)_GETTEXTIZE_OPTS ?= $$($(3)_GETTEXTIZE_OPTS)
 endif
 
 ifeq ($(4),host)
@@ -216,7 +216,7 @@
 #
 define GETTEXTIZE_HOOK
 	@$$(call MESSAGE,"Gettextizing")
-	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPT)
+	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPTS)
 endef
 
 #
