From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 23 Jan 2021 11:31:52 +0100
Subject: [Buildroot] [PATCH 3/6] package/mrouted: update description a bit,
 mention oper. requirement
In-Reply-To: <20210123103155.2599311-1-troglobit@gmail.com>
References: <20210123103155.2599311-1-troglobit@gmail.com>
Message-ID: <20210123103155.2599311-4-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index e5d9348d1b..95b4fb3825 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -3,5 +3,11 @@ config BR2_PACKAGE_MROUTED
 	depends on BR2_USE_MMU # fork()
 	help
 	  An implementation of the DVMRP multicast routing protocol.
+	  Unlike PIM a DVMRP router has a distance vector protocol (like
+	  RIP) built-in to figure out the reverse-path to the multicast
+	  source. This package comes with mrouted and mroutectl.  Where
+	  the latter is used to query status and control operation.
+
+	  Note: at least two interfaces with MULTICAST flag is requried.
 
 	  http://github.com/troglobit/mrouted
-- 
2.25.1
