From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:34 -0000
Subject: [Buildroot] [git commit branch/next] gnuchess: needs threads
Message-ID: <20120802195233.9CB9D96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c52c9e1fb630a7f44eb8244072eb1aa28c08dff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.org/results/63a7cf35ecef02f30641a37d602f7cc55d59f543/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/gnuchess/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/games/gnuchess/Config.in b/package/games/gnuchess/Config.in
index cae05cb..c79c52d 100644
--- a/package/games/gnuchess/Config.in
+++ b/package/games/gnuchess/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_GNUCHESS
 	bool "gnuchess"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  GNU Chess lets most modern computers play a full game of chess.
 
 	  http://ftp.gnu.org/pub/gnu/chess
+
+comment "gnuchess requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
