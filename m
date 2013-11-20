Message-Id: <8655e13dcefe9ee701ef0b5f5b1677d8e0a9c197.1384984956.git.chris@zankel.net>
In-Reply-To: <cover.1384984956.git.chris@zankel.net>
References: <cover.1384984956.git.chris@zankel.net>
From: Chris Zankel <chris@zankel.net>
Date: Wed, 20 Nov 2013 10:07:48 -0800
Subject: [PATCH 1/2] uclibc-snapshot: enable option UCLIBC_SUSV2_LEGACY
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot

With uClibc commit e8065705, valloc is now optional in SUSv2 and removed
from SUSv3 and later. However, cdrkit currently requires valloc, so
enable it in the uClibc snapshot configuration file.

Signed-off-by: Chris Zankel <chris@zankel.net>
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
1.8.1.2
