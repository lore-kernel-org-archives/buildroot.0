From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 16:02:38 +0200
Subject: [Buildroot] [git commit] toolchain-external: improve help text of
	some options
Message-ID: <20131009143431.031FB9B970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=692a585d846c56d4cbf94f4a004a7e7f9f8768c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 89c799e..67f4fc7 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -876,15 +876,22 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	# For the time being, we assume that all custom external
 	# toolchains have shadow password support.
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	help
+	  Select this option if your external toolchain uses the
+	  uClibc C library (available from http://www.uclibc.org/).
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	bool "glibc/eglibc"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
-	  Note: eglibc is a variant of glibc that (among other things) can be
-	  configured to exclude some of its features. Using a toolchain with
-	  eglibc configured to exclude key features may cause build failures to
-	  some packages.
+	  Select this option if your external toolchain uses the GNU C
+	  library (available from https://www.gnu.org/software/libc/)
+	  or its variant the eglibc library (http://www.eglibc.org/).
+
+	  Note: eglibc is a variant of glibc that (among other things)
+	  can be configured to exclude some of its features. Using a
+	  toolchain with eglibc configured to exclude key features may
+	  cause build failures to some packages.
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
 	bool "musl"
