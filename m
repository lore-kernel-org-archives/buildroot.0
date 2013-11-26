From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Nov 2013 14:01:07 +0200
Subject: [Buildroot] [PATCH] uclibc-snapshot: enable option
	UCLIBC_SUSV2_LEGACY
Message-ID: <46fc98d21f475329842710a85d93130fd829a1f4.1385467267.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Chris Zankel <chris@zankel.net>

With uClibc commit e8065705, valloc is now optional in SUSv2 and removed
from SUSv3 and later. However, cdrkit currently requires valloc, so
enable it in the uClibc snapshot configuration file.

Fixes
http://autobuild.buildroot.net/results/5a5/5a51f3f06e04eed39d59477ea1178aef7d397754/

Signed-off-by: Chris Zankel <chris@zankel.net>
[baruch: fix summary line, add autobuild reference]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uclibc/uClibc-snapshot.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index 145f709..9ca3f9e 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -116,6 +116,7 @@ MALLOC_GLIBC_COMPAT=y
 UCLIBC_HAS_OBSTACK=y
 UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
+UCLIBC_SUSV2_LEGACY=y
 UCLIBC_SUSV3_LEGACY=y
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
 UCLIBC_SUSV4_LEGACY=y
-- 
1.8.4.3
