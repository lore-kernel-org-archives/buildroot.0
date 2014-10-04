From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 18:54:42 +0200
Subject: [Buildroot] [git commit] packages: rename FOO_GETTEXTIZE_OPT into
	FOO_GETTEXTIZE_OPTS
Message-ID: <20141004170454.210A49D584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35886e5c90a4b8487f2d0c95978f0ce57c48ba61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_GETTEXTIZE_OPT.

Sed command used:
   find * -type f | xargs sed -i 's#_GETTEXTIZE_OPT\>#&S#g'

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-autotools.txt |    2 +-
 package/pkg-autotools.mk                  |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 1a59de3..ece6c49 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -136,7 +136,7 @@ cases, typical packages will therefore only use a few of them.
   'gettextize'.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
   values are +YES+ and +NO+. The default is +NO+.
 
-* +LIBFOO_GETTEXTIZE_OPT+, to specify additional options passed to
+* +LIBFOO_GETTEXTIZE_OPTS+, to specify additional options passed to
   the 'gettextize' program, if +LIBFOO_GETTEXTIZE=YES+. You may
   use that if, for example, the +.po+ files are not located in the
   standard place (i.e. in +po/+ at the root of the package.) By
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 3bfa140..2c93dd9 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -96,7 +96,7 @@ ifndef $(2)_GETTEXTIZE
 endif
 
 ifeq ($(4),host)
- $(2)_GETTEXTIZE_OPT ?= $$($(3)_GETTEXTIZE_OPT)
+ $(2)_GETTEXTIZE_OPTS ?= $$($(3)_GETTEXTIZE_OPTS)
 endif
 
 ifeq ($(4),host)
@@ -220,7 +220,7 @@ endif
 #
 define GETTEXTIZE_HOOK
 	@$$(call MESSAGE,"Gettextizing")
-	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPT)
+	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPTS)
 endef
 
 #
