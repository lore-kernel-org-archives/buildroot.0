From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 10:29:25 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "acpid: unavailable for external
	uClibc toolchains"
Message-ID: <1398414566-20286-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit ec6aaa4706d6826aca4e48ea65bbebbd893f76d6.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acpid/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index 205a6ae..5aec7f1 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_ACPID
 	bool "acpid"
 	depends on BR2_x86_64 || BR2_i386
-	# Usually lacks MSG_CMSG_CLOEXEC
-	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC && \
-		!BR2_UCLIBC_VERSION_0_9_32
 	help
 	  Advanced Configuration and Power Interface event daemon.
 
-- 
1.9.2
