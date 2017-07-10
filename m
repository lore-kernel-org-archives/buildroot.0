From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 18:03:13 +0200
Subject: [Buildroot] [git commit] toolchain-external: default
	BR2_TOOLCHAIN_EXTERNAL_PATH to empty
Message-ID: <20170710155907.657377FE51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=392b0a26f5fd8d3aedce7e0c15f9762a79312f01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It makes no sense to default to an arbitrary path. In addition, it in
fact works correctly when it is empty. In that case, the toolchain will
be searched in PATH.

Update the help text to explain the above, and also that the compiler
is supposed to be in the bin subdirectory.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4cd9ee4..c4063b1 100644
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
