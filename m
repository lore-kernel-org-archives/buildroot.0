From: Andreas Naumann <dev@andin.de>
Date: Fri, 22 Mar 2013 16:56:54 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: Reincluding core files and folders,
 which got kicked out by --cvs-exclude option.
Message-ID: <514C7F46.8070806@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --cvs-exclude option also excludes 'core', which when rsyncing e.g. 
a linux tree is less than optimal..


Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
  package/pkg-generic.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8d964a1..595ad1b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -62,7 +62,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
  $(BUILD_DIR)/%/.stamp_rsynced:
         @$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
         @test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; 
exit 1)
-       rsync -au --cvs-exclude $(SRCDIR)/ $(@D)
+       rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
         $(Q)touch $@

  # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
-- 
1.8.1.1
