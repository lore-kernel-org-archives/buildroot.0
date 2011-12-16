From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 16 Dec 2011 09:52:27 +0100
Subject: [Buildroot] [PATCH 4 of 5 v5] Makefile: change order of dirs and
	dependencies
In-Reply-To: <patchbomb.1324025231@devws108>
References: <patchbomb.1324025231@devws108>
Message-ID: <a3e1a7072b72ef13ac55.1324025235@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If during the dependencies step, a package needs to be downloaded, the
download directory already has to be present. If not, the file will be
downloaded under the name 'dl' instead of in the directory 'dl'.

This patch changes the order of dirs and dependencies in the world target to
fix this.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -376,7 +376,7 @@ dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
+world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 
 $(O)/toolchainfile.cmake:
 	@echo -en "\
