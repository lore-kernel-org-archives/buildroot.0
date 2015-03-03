From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 17:53:11 -0300
Subject: [Buildroot] [PATCH] uclibc: mask uclibc-ng for xtensa
Message-ID: <1425415991-20530-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is broken like plain uClibc, fixes:
http://autobuild.buildroot.net/results/77f/77fe89d358a90f5167e58bedb73495d7ee9a7f5d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 3a65752..11a4ba2 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -23,6 +23,7 @@ choice
 
 	config BR2_UCLIBC_NG_VERSION_1_0_0
 		bool "uClibc-ng 1.0.0"
+		depends on !BR2_xtensa
 
 	config BR2_UCLIBC_VERSION_XTENSA_GIT
 		bool "uClibc Git Xtensa"
-- 
2.0.5
