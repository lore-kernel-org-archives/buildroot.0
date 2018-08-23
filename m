From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:02:41 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Makefile: help:
 BR2_DEFCONFIG for defconfig must be on command line
Message-ID: <20180823195507.868C88E439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24b78f0de9726d73ef832c3d5b8cf89e410b7395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The help text says that BR2_DEFCONFIG will be used as input, but a
BR2_DEFCONFIG specified in the existing .config file will *not* be
used. So say explicitly that it must be specified on the command line.
Note that both "BR2_DEFCONFIG=... make defconfig" and
"make defconfig BR2_DEFCONFIG=..." will work.

While we're at it, add a semicolon to separate the two statements.

Note that this overflows the help text beyond 80 characters, but that
is already the case in many other lines.

Reported-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 27aa7ae6182b2c6f8246c46b827a48fc80ffdd62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 45194abf99..293ddd5468 100644
--- a/Makefile
+++ b/Makefile
@@ -1019,8 +1019,8 @@ help:
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
