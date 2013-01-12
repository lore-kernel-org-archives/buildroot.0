From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 21:48:05 +0100
Subject: [Buildroot] [git commit] toolchain/crosstool-ng: be more explicit
	in the config file help
Message-ID: <20130112204825.327C6998CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83b716a23ad764a5571d7590ab6d38d64d8be13e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some users seem to interpret:
    make ctng-menuconfig

as being a value that can be fit for the ct-ng config file.

Clarify that it is a command to run, not a possible value.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/Config.in |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index d80f547..df4e9b1 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -43,10 +43,12 @@ config BR2_TOOLCHAIN_CTNG_CONFIG
 	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc" if BR2_TOOLCHAIN_CTNG_eglibc
 	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc"  if BR2_TOOLCHAIN_CTNG_glibc
 	help
-	  Enter here the crosstool-NG's .config file to use.
-	  To fine-tune your toolchain, you can also call:
-	    make ctng-menuconfig
-
+	  Enter here the path to the crosstool-NG .config file to use.
+	  
+	  Generally, the default crosstool-NG configuration files bundled with
+	  Buildroot work fine in most situations. Use 'make ctng-menuconfig'
+	  from the command line, for expert customization of your toolchain.
+	  
 	  If unsure, keep the default value.
 
 if BR2_TOOLCHAIN_CTNG_uClibc
