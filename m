From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 10:30:31 +0100
Subject: [Buildroot] [git commit] pkg-perl: prevents the interactive prompts
Message-ID: <20140329093252.A917D9C415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af156db8817efe27109b8cfc6933bc8ef6150fbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-perl.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index fdf1580..447f364 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -49,6 +49,7 @@ ifeq ($(4),target)
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL_MM_USE_DEFAULT=1 \
 		perl Build.PL \
 			--config ar="$(TARGET_AR)" \
 			--config full_ar="$(TARGET_AR)" \
@@ -68,6 +69,7 @@ define $(2)_CONFIGURE_CMDS
 			--install_path libdoc=/usr/share/man/man3 \
 			$$($(2)_CONF_OPT); \
 	else \
+		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
 		perl Makefile.PL \
 			AR="$(TARGET_AR)" \
@@ -93,11 +95,13 @@ else
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL_MM_USE_DEFAULT=1 \
 		perl Build.PL \
 			--install_base $$(HOST_DIR)/usr \
 			--installdirs vendor \
 			$$($(2)_CONF_OPT); \
 	else \
+		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
 		perl Makefile.PL \
 			INSTALL_BASE=$$(HOST_DIR)/usr \
