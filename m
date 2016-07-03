From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] perl: remove empty host dependencies
	definition
Message-ID: <20160703082409.CD801800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=557429713df500e3b0b5960f3798bc148e5d9ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 11b10ff..d66e448 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -90,10 +90,6 @@ define PERL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
 endef
 
-# We never want to have host-berkeleydb or host-gdbm as dependencies
-# of host-perl.
-HOST_PERL_DEPENDENCIES =
-
 HOST_PERL_CONF_OPTS = \
 	-des \
 	-Dprefix="$(HOST_DIR)/usr" \
