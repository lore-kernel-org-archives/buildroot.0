From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:27 +0200
Subject: [Buildroot] [PATCH 02/12] lmbench: needs BR2_INET_RPC
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a5eec2fe8ef5dde4e21f9eede6a88bf66b794dfa.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package uses several pmap_*() functions in the C library, that
are only available if the C library has RPC support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index 704b3ff..80d38f1 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
+	# Uses pmap_set, pmap__unset, pmap_getport, etc.
+	depends on BR2_INET_RPC
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
-- 
1.6.3.3
