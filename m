From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:29:00 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: fix selection of
 bluez5_utils
Message-ID: <20200211223133.A78708DAAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a46a016b4db368dc5b5bb4f21247e6f018a674d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select BR2_PACKAGE_BLUEZ5_UTILS only if all its reverse dependencies
are selected

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 563f6d39e3..bf69b579e3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -207,7 +207,8 @@ config BR2_GCC_VERSION_OR1K
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils was removed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_BLUEZ5_UTILS if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 \
+		&& BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  The bluez-utils (BlueZ 4.x) package was removed as it is
 	  deprecated since a long time. As an alternative, the
