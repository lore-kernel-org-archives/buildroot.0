From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 16:34:15 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: 1.17.3 iproute fix
Message-ID: <20101105153433.C81568DBA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ad0fac1b06833aa238afd555f38146cbda31a4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.17.3/busybox-1.17.3-iproute.patch    |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch

diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
new file mode 100644
index 0000000..03c749f
--- /dev/null
+++ b/package/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
@@ -0,0 +1,13 @@
+diff -urpN busybox-1.17.3/networking/libiproute/iproute.c busybox-1.17.3-iproute/networking/libiproute/iproute.c
+--- busybox-1.17.3/networking/libiproute/iproute.c	2010-10-09 21:57:14.000000000 +0200
++++ busybox-1.17.3-iproute/networking/libiproute/iproute.c	2010-11-04 09:13:06.307919550 +0100
+@@ -791,8 +791,8 @@ static int iproute_get(char **argv)
+ 				}
+ 				req.r.rtm_dst_len = addr.bitlen;
+ 			}
+-			argv++;
+ 		}
++		argv++;
+ 	}
+ 
+ 	if (req.r.rtm_dst_len == 0) {
-- 
1.7.1
