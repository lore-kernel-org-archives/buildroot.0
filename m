From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 May 2011 16:08:21 -0300
Subject: [Buildroot] [PATCH 1/3] toolchain: mark mklibs as broken
Message-ID: <1304363303-14984-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mklibs is a broken option, so mark it as so pending a proper fixup or
punting it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
