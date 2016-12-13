From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Dec 2016 22:21:08 -0600
Subject: [Buildroot] [PATCH 2/2] policycoreutils: restorecon libglib2
	dependency
In-Reply-To: <1481602868-46581-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1481602868-46581-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1481602868-46581-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated to match Config.in select of libglib2
package as dependency if restorecon is enabled.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/policycoreutils/policycoreutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index c9f9ebc..86639cc 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -48,6 +48,7 @@ POLICYCOREUTILS_MAKE_DIRS = \
 
 ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
 POLICYCOREUTILS_MAKE_DIRS += restorecond
+POLICYCOREUTILS_DEPENDENCIES += libglib2
 endif
 # We need to pass DESTDIR at build time because it's used by
 # policycoreutils build system to find headers and libraries.
-- 
1.9.1
