From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:59 -0000
Subject: [Buildroot] [git commit branch/next] keyutils: add patch to fix
	musl build failure
Message-ID: <20150808105628.CABF07FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0dee07e9bdaab03db7281232b56100b380ad099
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

  http://autobuild.buildroot.org/results/253/2536b59735f33709f44fac94c81106e5ddd4fc40/

Patch has been submitted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0005-Add-missing-limits.h-include.patch        |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/keyutils/0005-Add-missing-limits.h-include.patch b/package/keyutils/0005-Add-missing-limits.h-include.patch
new file mode 100644
index 0000000..45c8439
--- /dev/null
+++ b/package/keyutils/0005-Add-missing-limits.h-include.patch
@@ -0,0 +1,32 @@
+From b2c6d3744dca029560d0d5e780f16561f8eeed53 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 12 Jul 2015 16:22:14 +0200
+Subject: [PATCH] Add missing <limits.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+key.dns_resolver.c uses ???UINT_MAX??? and ???ULONG_MAX???, but forgets to
+include <limits.h>, which causes build failure with certain C
+libraries (notably the musl C library).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ key.dns_resolver.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/key.dns_resolver.c b/key.dns_resolver.c
+index c2a9fe5..d41e219 100644
+--- a/key.dns_resolver.c
++++ b/key.dns_resolver.c
+@@ -56,6 +56,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <time.h>
++#include <limits.h>
+ 
+ static const char *DNS_PARSE_VERSION = "1.0";
+ static const char prog[] = "key.dns_resolver";
+-- 
+2.4.5
+
