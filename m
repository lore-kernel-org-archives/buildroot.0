From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 22:33:43 +0100
Subject: [Buildroot] [git commit] perl: remove PERL_INSTALL_TARGET_GOALS
Message-ID: <20140228133416.4DD849BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7128d249c0227321f2588c09d184da436e45df84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

useless since previous commit (removal of BR2_HAVE_DOCUMENTATION)
see http://git.buildroot.net/buildroot/diff/package/perl/perl.mk?id=7164a32632d14cb83698ddec45e84ad2f3252e9e

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 5ede81b..51aeb14 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -90,10 +90,8 @@ define PERL_INSTALL_STAGING_CMDS
 	$(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
 endef
 
-PERL_INSTALL_TARGET_GOALS = install.perl
-
 define PERL_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
+	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
 endef
 
 $(eval $(generic-package))
