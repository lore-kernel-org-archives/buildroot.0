From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 09:17:31 +0200
Subject: [Buildroot] [PATCH] Config.in.legacy: fallback to glibc when eglibc
	was selected
Message-ID: <1463469451-18931-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Peter Korsgaard, now that the eglibc support has been
removed, it is useful to automatically make the user's configuration
fall back to glibc (instead of uClibc, which would be the default C
library).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index a0a2059..461af69 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -155,11 +155,14 @@ config BR2_BINUTILS_VERSION_2_23_X
 config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	bool "eglibc support has been removed"
 	select BR2_LEGACY
+	select BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	help
 	  The eglibc project no longer exists, as it has been merged
 	  back into the glibc project. Therefore, support for eglibc
 	  has been removed, and glibc should be used instead.
 
+	  glibc has been automatically selected as a fallback.
+
 config BR2_GDB_VERSION_7_8
 	bool "gdb 7.8 has been removed"
 	select BR2_LEGACY
-- 
2.7.4
