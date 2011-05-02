From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 May 2011 21:41:47 +0200
Subject: [Buildroot] [git commit] toolchain: mark mklibs as broken
Message-ID: <20110502195833.841BB82BD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=48a00cc2ce165e70acc5c327b3c6415dde5c794b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mklibs is a broken option, so mark it as so pending a proper fixup or
punting it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/mklibs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/mklibs/Config.in b/toolchain/mklibs/Config.in
index 2298a3e..c065866 100644
--- a/toolchain/mklibs/Config.in
+++ b/toolchain/mklibs/Config.in
@@ -1,5 +1,6 @@
 config BR2_MKLIBS
 	bool "Run mklibs on the built root filesystem"
+	depends on BROKEN
 	help
 	  Recompiles all the shared libraries to only include the
 	  symbols actually needed to run the binaries on the target
-- 
1.7.3.4
