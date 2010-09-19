From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:42 -0700
Subject: [Buildroot] [PATCH 20/21] BugFix - Bison - Fixed Missing stddef.h
	Include In wchar.h
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-21-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When uClibc is configured without wchar support, wchar_t define is missing.
When configure runs it includes stddef.h, but when the build runs it does not.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/bison/bison-2.4.3-01-no-wchar.patch |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 package/bison/bison-2.4.3-01-no-wchar.patch

diff --git a/package/bison/bison-2.4.3-01-no-wchar.patch b/package/bison/bison-2.4.3-01-no-wchar.patch
new file mode 100644
index 0000000..c22e0c5
--- /dev/null
+++ b/package/bison/bison-2.4.3-01-no-wchar.patch
@@ -0,0 +1,13 @@
+--- bison-2.4.3/lib/wchar.in.h	2010-09-09 23:14:49.000000000 -0700
++++ bison-2.4.3.no.wchar/lib/wchar.in.h	2010-09-09 22:07:49.000000000 -0700
+@@ -72,6 +72,10 @@
+ # @INCLUDE_NEXT@ @NEXT_WCHAR_H@
+ #endif
+ 
++#ifndef __UCLIBC_HAS_WCHAR__
++# include <stddef.h>
++#endif
++
+ #undef _GL_ALREADY_INCLUDING_WCHAR_H
+ 
+ #ifndef _GL_WCHAR_H
-- 
1.7.2.3
