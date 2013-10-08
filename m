From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:17:10 +0200
Subject: [Buildroot] [PATCHv3 13/20] toolchain-external: improve help text
	of some options
In-Reply-To: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381256237-27948-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

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
-- 
1.8.1.2
