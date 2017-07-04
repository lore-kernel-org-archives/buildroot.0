From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:09:53 +0200
Subject: [Buildroot] [git commit] package: rename DISABLE_NLS to NLS_OPTS
Message-ID: <20170704170701.227EE8015E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d603626a8aae9cb1dc73cfaf923f29ecd1a9008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are going to use DISABLE_NLS not only for disabling NLS support,
but also to explicitly enable it. Therefore, this preparatory commit
renames it to NLS_OPTS, which is consistent with other foo_OPTS
variables defined in package/Makefile.in.

While at it, we replace the := assignments by regular = assignments.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in      | 4 ++--
 package/pkg-autotools.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8087bde..4a5b3af 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -360,9 +360,9 @@ TARGET_CONFIGURE_ARGS = \
 ################################################################################
 
 ifeq ($(BR2_ENABLE_LOCALE),y)
-DISABLE_NLS :=
+NLS_OPTS =
 else
-DISABLE_NLS :=--disable-nls
+NLS_OPTS = --disable-nls
 endif
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index e215382..ba1f4d9 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -201,7 +201,7 @@ define $(2)_CONFIGURE_CMDS
 		--with-fop=no \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		--enable-ipv6 \
-		$$(DISABLE_NLS) \
+		$$(NLS_OPTS) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
