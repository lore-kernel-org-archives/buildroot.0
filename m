From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 May 2016 11:54:55 -0300
Subject: [Buildroot] [PATCH] sg3-utils: disable for blackfin
Message-ID: <1463237695-28471-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suffers from the usual symbol prefixing problems for bfin, it's probably
easy to fix, however no bfin has/will be used for storage apps since
they lack the usual ports for it. Fixes:
http://autobuild.buildroot.net/results/314/31447787e70cd351ce01b7a49ba029758d0c68e5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sg3_utils/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
index f4db4b9..4b74eda 100644
--- a/package/sg3_utils/Config.in
+++ b/package/sg3_utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SG3_UTILS
 	bool "sg3-utils"
+	depends on !BR2_bfin # symbol prefixing problems
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Low level utilities for devices that use a SCSI command set.
@@ -15,4 +16,5 @@ config BR2_PACKAGE_SG3_UTILS_PROGS
 endif
 
 comment "sg3-utils needs a toolchain w/ threads"
+	depends on !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.3
