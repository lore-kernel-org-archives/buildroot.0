From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jul 2013 09:52:08 -0300
Subject: [Buildroot] [PATCH 2/9] uclibc/bfin: only supports linuxthreads.old
In-Reply-To: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374324735-2286-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 90aae90..f9c4956 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -104,6 +104,7 @@ choice
 
 	config BR2_PTHREADS
 		bool "linuxthreads"
+		depends on !BR2_bfin
 		depends on !BR2_xtensa
 	        select BR2_TOOLCHAIN_HAS_THREADS
 
@@ -115,9 +116,10 @@ choice
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
 		depends on !BR2_x86_i386
+		depends on !BR2_arc
 		depends on !BR2_avr32
+		depends on !BR2_bfin
 		depends on !BR2_xtensa
-		depends on !BR2_arc
 endchoice
 
 config BR2_PTHREAD_DEBUG
-- 
1.8.1.5
