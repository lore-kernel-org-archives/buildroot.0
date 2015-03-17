From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 18:46:43 -0300
Subject: [Buildroot] [PATCH] glibc: disable 2.20 for sparc
Message-ID: <1426628803-17401-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable glibc 2.20 for sparc, it's broken, that leaves 2.21 as the
default in this case.
Fixes bug #7941.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 1dd22c9..53cd958 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -34,6 +34,8 @@ choice
 
 config BR2_GLIBC_VERSION_2_20
 	depends on !BR2_nios2
+	# Broken see https://bugs.busybox.net/show_bug.cgi?id=7941
+	depends on !BR2_sparc
 	bool "2.20"
 
 config BR2_GLIBC_VERSION_2_21
-- 
2.0.5
