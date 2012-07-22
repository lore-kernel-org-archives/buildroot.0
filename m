From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 20:57:26 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: make
	preinstall the default for custom toolchains
Message-ID: <20120802195259.A3D4596CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=701940770b658e25cfe7219e35e808ba62052843
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

All the defconfig files used by the autobuilders that use
pre-installed external toolchains are making the assumption that the
default for a custom external toolchain is "pre-installed". We keep
this default for now, since changing it breaks the autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5c29ecd..e34802d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -573,6 +573,10 @@ endchoice
 
 choice
 	prompt "Toolchain origin"
+	# Keep compatibility with old defconfig files that are using
+	# custom toolchains, and which are therefore assuming that
+	# "preinstalled" in the default choice.
+	default BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 config BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
 	bool "Toolchain to be downloaded and installed"
