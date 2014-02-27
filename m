From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Feb 2014 17:57:32 -0300
Subject: [Buildroot] [PATCH] busbybox 1.22.1: add nc patch
Message-ID: <1393534652-7091-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/1.22.1/0005-busybox-1.22.1-nc.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/busybox/1.22.1/0005-busybox-1.22.1-nc.patch

diff --git a/package/busybox/1.22.1/0005-busybox-1.22.1-nc.patch b/package/busybox/1.22.1/0005-busybox-1.22.1-nc.patch
new file mode 100644
index 0000000..1ddb483
--- /dev/null
+++ b/package/busybox/1.22.1/0005-busybox-1.22.1-nc.patch
@@ -0,0 +1,15 @@
+--- busybox-1.22.1/networking/nc_bloaty.c
++++ busybox-1.22.1-nc/networking/nc_bloaty.c
+@@ -175,9 +175,9 @@ enum {
+ 	OPT_w = (1 << 5),
+ 	OPT_l = (1 << 6) * ENABLE_NC_SERVER,
+ 	OPT_k = (1 << 7) * ENABLE_NC_SERVER,
+-	OPT_i = (1 << (7+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
+-	OPT_o = (1 << (8+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
+-	OPT_z = (1 << (9+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
++	OPT_i = (1 << (6+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
++	OPT_o = (1 << (7+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
++	OPT_z = (1 << (8+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
+ };
+ 
+ #define o_nflag   (option_mask32 & OPT_n)
-- 
1.8.3.2
