From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  5 Dec 2018 10:33:11 -0600
Subject: [Buildroot] [PATCH 1/2] system cfg: default mkpasswd to SHA
Message-ID: <1544027592-35204-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch drops the comment about checking the C libraries version as
they now all support it by default
    glibc 2.7+
    uclibc (bdd8362a88 package/uclibc: defconfig: enable sha-256...)
    musl 1.1.14+

This patch updates the help text and changes the default mkpasswd
method to SHA256 from MD5

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 system/Config.in | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 9e34f11..2123d33 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -61,7 +61,7 @@ endif
 
 choice
 	bool "Passwords encoding"
-	default BR2_TARGET_GENERIC_PASSWD_MD5
+	default BR2_TARGET_GENERIC_PASSWD_SHA256
 	help
 	  Choose the password encoding scheme to use when Buildroot
 	  needs to encode a password (eg. the root password, below).
@@ -81,20 +81,12 @@ config BR2_TARGET_GENERIC_PASSWD_MD5
 config BR2_TARGET_GENERIC_PASSWD_SHA256
 	bool "sha-256"
 	help
-	  Use SHA256 to encode passwords.
-
-	  Very strong, but not ubiquitous, although available in glibc
-	  for some time now. Choose only if you are sure your C library
-	  understands SHA256 passwords.
+	  Use SHA256 to encode passwords which is stronger then MD5.
 
 config BR2_TARGET_GENERIC_PASSWD_SHA512
 	bool "sha-512"
 	help
-	  Use SHA512 to encode passwords.
-
-	  Extremely strong, but not ubiquitous, although available in
-	  glibc for some time now. Choose only if you are sure your C
-	  library understands SHA512 passwords.
+	  Use SHA512 to encode passwords which is stronger then SHA256
 
 endchoice # Passwd encoding
 
-- 
1.9.1
