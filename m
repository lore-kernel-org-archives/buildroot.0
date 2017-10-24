From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Oct 2017 08:20:55 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Config.in: fix help
	comment for gcc optimization
Message-ID: <20171025073526.636C581106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=103facc2f24c77af7e6a39316caa5562f908d453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The default for is set to BR2_OPTIMIZE_S, the help comment designated
BR2_OPTIMIZE_0 as default.
Changed the help comment to show that BR2_OPTIMIZE_S is the default.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 4e09fd8bdef6ddea1097f91df07515abde389cd0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 434935b..345d5c5 100644
--- a/Config.in
+++ b/Config.in
@@ -467,7 +467,7 @@ choice
 config BR2_OPTIMIZE_0
 	bool "optimization level 0"
 	help
-	  Do not optimize. This is the default.
+	  Do not optimize.
 
 config BR2_OPTIMIZE_1
 	bool "optimization level 1"
@@ -534,6 +534,7 @@ config BR2_OPTIMIZE_S
 	  -falign-loops -falign-labels -freorder-blocks
 	  -freorder-blocks-and-partition -fprefetch-loop-arrays
 	  -ftree-vect-loop-version
+	  This is the default.
 
 endchoice
 
