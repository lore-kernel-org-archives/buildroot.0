From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Dec 2009 08:55:09 +0100
Subject: [Buildroot] [git commit master] Makefile: document configure cache
	handling
Message-ID: <20091212075530.B7F16777BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=97c996d6548b1d73bebedb25cee23c2137cb6348
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index f8303e1..bf04773 100644
--- a/Makefile
+++ b/Makefile
@@ -441,6 +441,7 @@ external-deps:
 		SPIDER=--spider source
 
 ifeq ($(BR2_CONFIG_CACHE),y)
+# drop configure cache if configuration is changed
 $(BUILD_DIR)/tgt-config.cache: .config
 	rm -f $@
 	touch $@
-- 
1.6.3.3
