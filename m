From: Tom Rini <trini@konsulko.com>
Date: Tue, 17 Nov 2015 14:04:04 -0500
Subject: [Buildroot] [PATCH] Makefile: Add RANLIB to the list of critical
	variables to unexport
Message-ID: <1447787044-4597-1-git-send-email-trini@konsulko.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If RANLIB is set and we're trying to build binutils, binutils will pick
this up and potentially fail to build.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 Makefile |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 80c264f..b2b4b3c 100644
--- a/Makefile
+++ b/Makefile
@@ -321,6 +321,7 @@ unexport ARCH
 unexport CC
 unexport CXX
 unexport CPP
+unexport RANLIB
 unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
-- 
1.7.9.5
