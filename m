From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Nov 2010 00:03:52 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: fix release target
	with make 3.81
Message-ID: <20101103230450.DF9C78A5A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0dca70656855c1a343f0351e4e69ac6a2c112472
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems that target-specific variables don't mix with target rules.

Thanks to Yann for helping debugging the issue.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index dda78fe..3664c96 100644
--- a/Makefile
+++ b/Makefile
@@ -638,6 +638,8 @@ help:
 	@echo
 
 release: OUT=buildroot-$(BR2_VERSION)
+
+release:
 	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
 
 .PHONY: $(noconfig_targets)
-- 
1.7.1
