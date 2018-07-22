From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Jul 2018 23:34:45 +0200
Subject: [Buildroot] [PATCH] Makefile: help: BR2_DEFCONFIG for defconfig
 must be on command line
Message-ID: <20180722213445.29358-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The help text says that BR2_DEFCONFIG will be used as input, but a
BR2_DEFCONFIG specified in the existing .config file will *not* be
used. So say explicitly that it must be specified on the command line.
Note that both "BR2_DEFCONFIG=... make defconfig" and
"make defconfig BR2_DEFCONFIG=..." will work.

While we're at it, add a semicolon to separate the two statements.

Note that this overflows the help text beyond 80 characters, but that
is already the case in many other lines.

Reported-by: "aissen" on IRC
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8d25c8a239..37c7072c7c 100644
--- a/Makefile
+++ b/Makefile
@@ -1020,8 +1020,8 @@ help:
 	@echo '  silentoldconfig        - Same as oldconfig, but quietly, additionally update deps'
 	@echo '  olddefconfig           - Same as silentoldconfig but sets new symbols to their default value'
 	@echo '  randconfig             - New config with random answer to all options'
-	@echo '  defconfig              - New config with default answer to all options'
-	@echo '                             BR2_DEFCONFIG, if set, is used as input'
+	@echo '  defconfig              - New config with default answer to all options;'
+	@echo '                             BR2_DEFCONFIG, if set on the command line, is used as input'
 	@echo '  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
-- 
2.18.0
