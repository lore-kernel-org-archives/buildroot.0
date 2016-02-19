From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Feb 2016 10:32:33 -0300
Subject: [Buildroot] [PATCH 1/2] glibc: add version 2.23
Message-ID: <1455888754-10726-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clarify the reason it's not available for sparc < v9.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/Config.in  | 9 ++++++++-
 package/glibc/glibc.hash | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index aeb236c..d8f54b6 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -39,7 +39,13 @@ config BR2_GLIBC_VERSION_2_21
 
 config BR2_GLIBC_VERSION_2_22
 	bool "2.22"
-	depends on !BR2_sparc # broken
+	# No support for pthread barriers on < v9 ISA
+	depends on !BR2_sparc
+
+config BR2_GLIBC_VERSION_2_23
+	bool "2.23"
+	# No support for pthread barriers on < v9 ISA
+	depends on !BR2_sparc
 
 endchoice
 
@@ -51,3 +57,4 @@ config BR2_GLIBC_VERSION_STRING
 	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
 	default "2.21" if BR2_GLIBC_VERSION_2_21
 	default "2.22" if BR2_GLIBC_VERSION_2_22
+	default "2.23" if BR2_GLIBC_VERSION_2_23
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 979202e..c809735 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -6,3 +6,4 @@ md5	197836c2ba42fb146e971222647198dd	eglibc-2.19-svnr25243.tar.bz2
 sha1	8013c1935b46fd50d2d1fbfad3b0af362b75fb28	eglibc-2.19-svnr25243.tar.bz2
 sha256  aeeb362437965a5d3f40b151094ca79def04a115bd363fdd4a9a0c69482923b8  glibc-2.21.tar.xz
 sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
+sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
-- 
2.4.10
