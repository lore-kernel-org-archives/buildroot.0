From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 30 Mar 2021 00:41:54 +0200
Subject: [Buildroot] [PATCH] package/pkg-kconfig: fix error string
Message-ID: <20210329224154.3716438-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current error string speaks only about "fragment" but here we also deal
with Kconfig files, so let's add "file or fragment" instead of "fragment".

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 2aecf2e203..dd727b7200 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -117,7 +117,7 @@ $(2)_KCONFIG_STAMP_DOTCONFIG = .stamp_dotconfig
 $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 	for f in $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES); do \
 		if [ ! -f "$$$${f}" ]; then \
-			printf "Kconfig fragment '%s' for '%s' does not exist\n" "$$$${f}" "$(1)"; \
+			printf "Kconfig file or fragment '%s' for '%s' does not exist\n" "$$$${f}" "$(1)"; \
 			exit 1; \
 		fi; \
 	done
-- 
2.25.1
