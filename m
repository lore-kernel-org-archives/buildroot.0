From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 13:36:59 +0100
Subject: [Buildroot] [git commit] uclibc-snapshot: enable option
	UCLIBC_SUSV2_LEGACY
Message-ID: <20131126150316.EC3DD9BDFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d893bde74e75db4ddc78a719f72d0446a8cc9cd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With uClibc commit e8065705, valloc is now optional in SUSv2 and removed
from SUSv3 and later. However, cdrkit currently requires valloc, so
enable it in the uClibc snapshot configuration file.

Fixes
http://autobuild.buildroot.net/results/5a5/5a51f3f06e04eed39d59477ea1178aef7d397754/

Signed-off-by: Chris Zankel <chris@zankel.net>
[baruch: fix summary line, add autobuild reference]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uClibc-snapshot.config |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
