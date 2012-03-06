From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Mar 2012 22:21:39 +0100
Subject: [Buildroot] [git commit] microperl: fix host build
Message-ID: <20120306215605.26E0490D15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb9a5877b88787f176215c5addb8c1be225a39d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It misses -lm when compiling miniperl

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/microperl/microperl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index b68e825..de5ecd6 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -32,7 +32,7 @@ $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 
 $(MICROPERL_DIR)/.host_configured: $(MICROPERL_DIR)/.source
 	# we need to build a perl for the host just for Errno.pm
-	(cd $(MICROPERL_DIR); ./Configure -Dcc="$(HOSTCC)" -de  )
+	(cd $(MICROPERL_DIR); ./Configure -Dcc="$(HOSTCC)" -de -A libs='-lm' )
 	touch $@
 
 
