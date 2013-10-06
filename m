From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Sun,  6 Oct 2013 10:27:46 +0200
Subject: [Buildroot] [PATCH] Fix glibc dependency to gcc-intermediate
Message-ID: <1381048066-18510-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit ebc81933, we rerverted 2babed4a, but meanwhile eglibc/ was
renamed glibc/ so rules eglibc-build muste renmaed glibc-build to
correctly work.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/glibc/glibc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 998bd0f..48ff0f7 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -29,7 +29,7 @@ GLIBC_DEPENDENCIES += host-gawk
 endif
 
 # Before (e)glibc is built, we must have the second stage cross-compiler
-eglibc-build: host-gcc-intermediate
+glibc-build: host-gcc-intermediate
 
 GLIBC_SUBDIR = build
 
-- 
1.7.9.5
