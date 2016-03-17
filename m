From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 17 Mar 2016 18:27:04 +0300
Subject: [Buildroot] [PATCH 2/2] uclibc: enable linuxthreads for xtensa
In-Reply-To: <1458228424-10330-1-git-send-email-jcmvbkbc@gmail.com>
References: <1458228424-10330-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1458228424-10330-3-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linuxthreads is the only threading option for noMMU xtensa, enable it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 16bf89c..ae32f21 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -63,7 +63,7 @@ choice
 	config BR2_PTHREADS_OLD
 		bool "linuxthreads (stable/old)"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_m68k || BR2_arm || BR2_armeb
+		depends on BR2_m68k || BR2_arm || BR2_armeb || BR2_xtensa
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
-- 
2.1.4
