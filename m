From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 13:34:12 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] package/pkg-kconfig: fix
 error string
Message-ID: <20210403110951.8449283E03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d0ed88caeda0716d21f6b0afbfe82af6d750ba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Current error string speaks only about "fragment" but here we also deal
with Kconfig files, so let's add "file or fragment" instead of "fragment".

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a7348f0f7de1021ea578cd81784e70b1832adb79)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
