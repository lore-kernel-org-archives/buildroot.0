From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 22:09:05 +0100
Subject: [Buildroot] [PATCH] Fix microperl
Message-ID: <1330895345-16705-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It misses -lm when compiling miniperl

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This is actually a quite old perl version, and it's not even converted
to GENTARGETS.  Should we deprecate it?

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
 
 
-- 
tg: (dca6e03..) t/fix-microperl (depends on: master)
