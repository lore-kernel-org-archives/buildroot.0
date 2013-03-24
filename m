From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 22:07:56 +0100
Subject: [Buildroot] [git commit] <pkg>-rsync: Reincluding core files and
	folders, which got kicked out by --cvs-exclude option.
Message-ID: <20130324210844.350499B2A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1539efc5d525641a9ac13a6c96bea7fdd45ed183
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --cvs-exclude option also excludes 'core', which when rsyncing
e.g. a linux tree is less than optimal..

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index afb90bf..901bcf7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -62,7 +62,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au --cvs-exclude $(SRCDIR)/ $(@D)
+	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
 	$(Q)touch $@
 
 # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
