From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Nov 2009 22:31:50 +0100
Subject: [Buildroot] [git commit master] package/microperl: fix build
Message-ID: <20091130213239.593917779D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=78f2cb70e2827df9b2b684e54234fc5520003624
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There seems to be some confusion about makefile/Makefile, so just fixup
both files for now to keep it safe.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/microperl/microperl.mk |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index d319525..5cc8771 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Additional fixes and cleanups.
 
-	Updated/fixed packages: alsamixergui, fltk, ncurses, vim
+	Updated/fixed packages: alsamixergui, fltk, microperl, ncurses, vim
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 63247e9..7985a65 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -34,6 +34,8 @@ $(MICROPERL_DIR)/.host_configured: $(MICROPERL_DIR)/.source
 $(MICROPERL_DIR)/.host_configured_and_fixed: $(MICROPERL_DIR)/.host_configured
 	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/Makefile
 	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/Makefile
+	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/makefile
+	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/makefile
 	touch $@
 
 $(MICROPERL_DIR)/.host_make: $(MICROPERL_DIR)/.host_configured_and_fixed
-- 
1.6.3.3
