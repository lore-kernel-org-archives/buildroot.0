From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Feb 2011 22:23:58 +0100
Subject: [Buildroot] [git commit master 1/1] microperl compile fix with
	ccache enabled
Message-ID: <20110208213552.DCAED8F434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=43987641d3325a24f6db2785c17c3485c06a0719
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just a simple quote problem with $(HOSTCC)

Signed-off-by: Martin Hicks <mort@bork.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/microperl/microperl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index bf76fa7..b68e825 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -32,7 +32,7 @@ $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 
 $(MICROPERL_DIR)/.host_configured: $(MICROPERL_DIR)/.source
 	# we need to build a perl for the host just for Errno.pm
-	(cd $(MICROPERL_DIR); ./Configure -Dcc=$(HOSTCC) -de  )
+	(cd $(MICROPERL_DIR); ./Configure -Dcc="$(HOSTCC)" -de  )
 	touch $@
 
 
-- 
1.7.3.4
