From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jun 2015 19:21:45 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc: use uClibc-ng by default
Message-ID: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the uClibc project is not making any release since about 3
years, and the uClibc-ng project is now alive and delivering regular
releases based on uClibc master plus a number of fixes, let's make
uClibc-ng the default uClibc version used by Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index dd23853..9b29ae5 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -18,7 +18,7 @@ config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_33
+	default BR2_UCLIBC_VERSION_NG
 	help
 	  Select the version of uClibc you wish to use.
 
-- 
2.1.0
