From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Oct 2018 21:21:22 +0200
Subject: [Buildroot] [git commit] package/glibc: provide an upstream site
 link
Message-ID: <20181015192006.E2BA0838F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea5525e116c95310777351415b527a3b26078193
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Config.in for glibc is a blind option and not part of the menu for
a user to select (the pkg is used for the Buildroot toolchain build),
however this patch adds the link for completeness of the pkg-stats
report and for future scripting which will generate xml updates of the
package's Common Product Enumeration (used for vunerability checking).

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 57a2e833d2..63dd0f4dd7 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,5 +5,6 @@ config BR2_PACKAGE_GLIBC
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
 	select BR2_TOOLCHAIN_HAS_SSP
-
+	help
+	  https://www.gnu.org/software/libc/
 endif
