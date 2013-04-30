From: Nathan Lynch <ntl@pobox.com>
Date: Tue, 30 Apr 2013 13:38:29 -0500
Subject: [Buildroot] [PATCH] libnl: enable parallel make
Message-ID: <1367347109-27608-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current versions of libnl (since 3.2.4, at least) do not appear to
require MAKE1.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 package/libnl/libnl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 2a9f5a9..681d364 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -10,7 +10,6 @@ LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex
-LIBNL_MAKE = $(MAKE1)
 LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
 	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
 	qdisc-list
-- 
1.8.1.4
