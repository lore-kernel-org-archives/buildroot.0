From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:18:04 +0200
Subject: [Buildroot] [git commit] sg3-utils: disable for blackfin
Message-ID: <20160515192045.0C2A981DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10a0715dd549ef6e964f1508a6381b92a916d3c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suffers from the usual symbol prefixing problems for bfin, it's probably
easy to fix, however no bfin has/will be used for storage apps since
they lack the usual ports for it. Fixes:
http://autobuild.buildroot.net/results/314/31447787e70cd351ce01b7a49ba029758d0c68e5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
