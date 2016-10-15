From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:13:45 +0200
Subject: [Buildroot] [git commit] toolchain: update comment about
	uClibc/uClibc-ng
Message-ID: <20161015092257.427C97FD65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f4483f7cefebc6a489c1eeab7f6468be5561f27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

External toolchains can use both, so mention it here.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2b17b7a..bcb42db 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -920,14 +920,16 @@ choice
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-	bool "uClibc"
+	bool "uClibc/uClibc-ng"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	# For the time being, we assume that all custom external
 	# toolchains have shadow password support.
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	help
 	  Select this option if your external toolchain uses the
-	  uClibc C library (available from http://www.uclibc.org/).
+	  uClibc (available from http://www.uclibc.org/)
+	  or uClibc-ng (available from http://www.uclibc-ng.org)
+	  C library.
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	bool "glibc/eglibc"
