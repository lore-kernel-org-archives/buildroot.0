From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 11:24:02 +0100
Subject: [Buildroot] [git commit] system cfg: update mkpasswd SHA option txt
Message-ID: <20181215103019.1F134814D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e104e22ea23478e3d7cd6113dba340533140e41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch drops the comment about checking the C libraries version as
they now all support it by default
    glibc 2.7+
    uclibc (bdd8362a88 package/uclibc: defconfig: enable sha-256...)
    musl 1.1.14+

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 9e34f11b6c..e33568f7ed 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -81,20 +81,12 @@ config BR2_TARGET_GENERIC_PASSWD_MD5
 config BR2_TARGET_GENERIC_PASSWD_SHA256
 	bool "sha-256"
 	help
-	  Use SHA256 to encode passwords.
-
-	  Very strong, but not ubiquitous, although available in glibc
-	  for some time now. Choose only if you are sure your C library
-	  understands SHA256 passwords.
+	  Use SHA256 to encode passwords which is stronger than MD5.
 
 config BR2_TARGET_GENERIC_PASSWD_SHA512
 	bool "sha-512"
 	help
-	  Use SHA512 to encode passwords.
-
-	  Extremely strong, but not ubiquitous, although available in
-	  glibc for some time now. Choose only if you are sure your C
-	  library understands SHA512 passwords.
+	  Use SHA512 to encode passwords which is stronger than SHA256
 
 endchoice # Passwd encoding
 
