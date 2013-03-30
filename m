From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Mar 2013 20:46:56 +0100
Subject: [Buildroot] [git commit] orc: needs threads
Message-ID: <20130330194755.4B9B29B3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ec152a6f04c1a97f484bc2383564dba6cb12071
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b44c09c7ca81b16267ad653e65f52c4e5ec7b36f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/orc/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/orc/Config.in b/package/orc/Config.in
index 1de0f23..022c455 100644
--- a/package/orc/Config.in
+++ b/package/orc/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_ORC
 	bool "orc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Orc is a library and set of tools for compiling and executing
 	  very simple programs that operate on arrays of data.
 
 	  http://code.entropywave.com/projects/orc/
+
+comment "orc requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
