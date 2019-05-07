From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 17:02:53 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-external-andes-nds32:
 disable static build
Message-ID: <20190507145846.376D58869D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=982a61b6adabbcd68a0eb9ad1e348a732915e9e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot does not support static build with glibc. Since this external
toolchain uses glibc, disable static build with this toolchain.

Fixes:
http://autobuild.buildroot.net/results/3c93cfac81f15f4c18eb7ad578ad86bb7bcf1c12/
http://autobuild.buildroot.net/results/63994f51a2b224b66acfafe5b236249d867a507d/
http://autobuild.buildroot.net/results/96c3be922a96c50fbd8e68059f9ced8a2a75f9ab/

Cc: Nylon Chen <nylon7@andestech.com>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
index e2fe63677d..2596fc3c8b 100644
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
 	bool "Andes nds32"
 	depends on BR2_nds32
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
