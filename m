From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Jan 2013 23:22:50 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-ng: be more explicit in the
	config file help
Message-ID: <1357770170-30858-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some users seem to interpret:
    make ctng-menuconfig

as being a value that can be fit for the ct-ng config file.

Clarify that it is a command to run, not a possible value.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-crosstool-ng/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index d80f547..68061f0 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -44,7 +44,8 @@ config BR2_TOOLCHAIN_CTNG_CONFIG
 	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc"  if BR2_TOOLCHAIN_CTNG_glibc
 	help
 	  Enter here the crosstool-NG's .config file to use.
-	  To fine-tune your toolchain, you can also call:
+	  To fine-tune your toolchain, you may also run (from the
+	  command line) this command:
 	    make ctng-menuconfig
 
 	  If unsure, keep the default value.
-- 
1.7.2.5
