From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 22:10:43 +0100
Subject: [Buildroot] [git commit] Makefile: change order of dirs and
	dependencies
Message-ID: <20120209213031.B2CED90A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee7f92e19f3568a740ee7874112cbd1217ffab05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If during the dependencies step, a package needs to be downloaded, the
download directory already has to be present. If not, the file will be
downloaded under the name 'dl' instead of in the directory 'dl'.

This patch changes the order of dirs and dependencies in the world target to
fix this.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 2b228f7..d3e8610 100644
--- a/Makefile
+++ b/Makefile
@@ -375,7 +375,7 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
+world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 
 $(O)/toolchainfile.cmake:
 	@echo -en "\
