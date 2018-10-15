From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Oct 2018 10:14:34 -0500
Subject: [Buildroot] [PATCH v2] package/glibc: provide an upstream site link
Message-ID: <1539616474-34656-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Config.in for glibc is a blind option and not part of the menu for
a user to select (the pkg is used for the Buildroot toolchain build),
however this patch adds the link for completeness of the pkg-stats
report and for future scripting which will generate xml updates of the
package's Common Product Enumeration (used for vunerability checking).

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Thomas
 - Add a better description to the commit as a user will never use
   kconfig to view this help message.
---
 package/glibc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 57a2e83..63dd0f4 100644
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
-- 
1.9.1
