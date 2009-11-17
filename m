From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Nov 2009 17:37:11 +0100
Subject: [Buildroot] [git commit master] toolchain/uClibc: install ldd to
	target
Message-ID: <20091117163850.5FF9D7777B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=09d62e89e761a238cc4c04108e74be3abdd391c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Julien Boibessot <julien.boibessot@free.fr>.

This somehow got disabled by cb815ae003d40cc971d (two years ago!).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 74b058d..62fc40b 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -581,8 +581,7 @@ uclibc-clean: uclibc-test-clean
 uclibc-dirclean: uclibc-test-dirclean
 	rm -rf $(UCLIBC_DIR)
 
-uclibc-target-utils:
-#$(TARGET_DIR)/usr/bin/ldd
+uclibc-target-utils: $(TARGET_DIR)/usr/bin/ldd
 
 uclibc-target-utils-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
-- 
1.6.3.3
