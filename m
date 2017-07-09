From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 01:21:23 +0200
Subject: [Buildroot] [PATCH 7/7] toolchain-external: default
	BR2_TOOLCHAIN_EXTERNAL_PATH to empty
In-Reply-To: <20170709232123.30120-1-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
Message-ID: <20170709232123.30120-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It makes no sense to default to an arbitrary path. In addition, it in
fact works correctly when it is empty. In that case, the toolchain will
be searched in PATH.

Update the help text to explain the above, and also that the compiler
is supposed to be in the bin subdirectory.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4cd9ee4752..c4063b177b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -67,10 +67,14 @@ endchoice
 
 config BR2_TOOLCHAIN_EXTERNAL_PATH
 	string "Toolchain path"
-	default "/path/to/toolchain/usr"
+	default ""
 	depends on BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED
 	help
-	  Path to where the external toolchain is installed.
+	  Path to where the external toolchain is installed. The
+	  compiler itself is expected to be in the "bin" subdirectory
+	  of this path.
+
+	  If empty, the compiler will be searched in $PATH.
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
-- 
2.13.2
