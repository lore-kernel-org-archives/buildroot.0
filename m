From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Jun 2012 20:26:50 +0200
Subject: [Buildroot] [git commit] valgrind: unbreak arm support after
	REAL_GNU_TARGET_NAME removal
Message-ID: <20120626182731.AFAA28D1C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01d7b429d9a0709ce96f7af892b14398b62d5b22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/085aa258adc5eaaa6320f283868a185093480960

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/valgrind/valgrind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 004c1ac..22e5c96 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -16,7 +16,7 @@ VALGRIND_CONF_OPT = --disable-tls
 # only be selected on Cortex A8 and Cortex A9 platforms.
 ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
 VALGRIND_CONF_OPT += \
-	--host=$(patsubst arm-%,armv7-unknown-%,$(GNU_TARGET_NAME))
+	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
 endif
 
 define VALGRIND_INSTALL_UCLIBC_SUPP
