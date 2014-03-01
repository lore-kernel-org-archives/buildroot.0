From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:48:38 +0100
Subject: [Buildroot] [git commit] busybox 1.22.1: add nc patch
Message-ID: <20140301134853.670B99BAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa8327edc90eb0485ae049bbdebc9a62b9681c4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../busybox/1.22.1/0005-busybox-1.22.1-nc.patch    |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

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
