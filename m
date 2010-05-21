From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] lmbench: needs BR2_INET_RPC
Message-ID: <20100521184448.13E5E9C148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9923439841ffb0dc9fcf70b2ccc67a2998cd3713
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package uses several pmap_*() functions in the C library, that
are only available if the C library has RPC support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index 704b3ff..d09a333 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
+	# Uses pmap_set, pmap__unset, pmap_getport, etc.
+	depends on BR2_INET_RPC
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
 
 	  http://sourceforge.net/projects/lmbench/
+
+comment "lmbench requires a toolchain with RPC support"
+        depends on !BR2_INET_RPC
-- 
1.6.3.3
