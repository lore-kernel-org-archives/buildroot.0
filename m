From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 14:39:59 +0100
Subject: [Buildroot] [PATCH 2/3] uclibc: remove bogus comment about thread
	implementation selection
In-Reply-To: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1425735600-16762-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to warn the user about selecting an inappropriate
thread implementation, since we make sure only supported combinations
can be selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index c66373d..1839d65 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -133,10 +133,7 @@ choice
 	default BR2_PTHREADS if BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
 	help
 	  Use this option to select the thread library implementation
-	  that should be used in your toolchain. Not all thread
-	  variants work with all versions of uClibc, the "linuxthreads
-	  (stable/old)" may be a working fallback if you need
-	  threading at all.
+	  that should be used in your toolchain.
 
 	config BR2_PTHREADS_NONE
 		bool "none"
-- 
2.1.0
