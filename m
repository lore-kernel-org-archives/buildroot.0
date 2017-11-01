From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  1 Nov 2017 21:11:34 +0100
Subject: [Buildroot] [PATCH 1/4] package/openobex: disable on Blackfin
Message-ID: <20171101201137.29939-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openobex uses accept4 syscall, which is not available on Blackfin flavored uclibc.
So, diasble openobex on blackfin (do not add extra checks on the c-library since
uclibc is the only choice for Blackfin).

Fixed:
  http://autobuild.buildroot.net/results/78e033fe9f43845581a5d87b21a8451f67520e44

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/openobex/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index e611b8d803..4a4dc214ef 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENOBEX
 	bool "openobex"
+	depends on !BR2_bfin
 	help
 	  Free open source implementation of the Object Exchange (OBEX)
 	  protocol.
-- 
2.15.0
