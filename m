From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 23:07:11 +0200
Subject: [Buildroot] [git commit] bfin: change default to bf532,
	internal toolchain !bf6xx
Message-ID: <20160827211825.C74D681D54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e732bd1f221309eebc2584addbc296313cb471bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default Blackfin processor in Buildroot isn't supported by
gcc 6.1.0, so use bf532 as default. Disable any bf6xx processors
for internal toolchain users.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.bfin | 2 +-
 toolchain/Config.in | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 415fc89..9f7056a 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -1,7 +1,7 @@
 choice
 	prompt "Target CPU"
 	depends on BR2_bfin
-	default BR2_bf609
+	default BR2_bf532
 	help
 	  Specify target CPU
 config BR2_bf606
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 0d9c39b..de01585 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -42,6 +42,10 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	depends on !BR2_bf606
+	depends on !BR2_bf607
+	depends on !BR2_bf608
+	depends on !BR2_bf609
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
