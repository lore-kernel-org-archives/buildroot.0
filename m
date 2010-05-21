From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 10:08:29 +0200
Subject: [Buildroot] [PATCH 09/19] lmbench: needs BR2_INET_RPC
In-Reply-To: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9923439841ffb0dc9fcf70b2ccc67a2998cd3713.1274428596.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
