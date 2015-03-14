From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Mar 2015 13:49:09 +0100
Subject: [Buildroot] [git commit] uclibc: remove bogus comment about thread
	implementation selection
Message-ID: <20150314124926.860D77FAE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8f590fc7a3f12174a0f68474a21eadadb09198c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need to warn the user about selecting an inappropriate
thread implementation, since we make sure only supported combinations
can be selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 18e02c2..329e1f1 100644
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
