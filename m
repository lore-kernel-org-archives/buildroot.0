From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Oct 2011 17:29:01 -0300
Subject: [Buildroot] [PATCH 1/2] busybox: add 1.19.2 tftp fix
Message-ID: <1318019342-32624-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox-1.19.2/busybox-1.19.2-tftp.patch       |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-tftp.patch

diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-tftp.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-tftp.patch
new file mode 100644
index 0000000..15dc9e1
--- /dev/null
+++ b/package/busybox/busybox-1.19.2/busybox-1.19.2-tftp.patch
@@ -0,0 +1,12 @@
+--- busybox-1.19.2/networking/tftp.c
++++ busybox-1.19.2-tftp/networking/tftp.c
+@@ -813,7 +813,8 @@ int tftpd_main(int argc UNUSED_PARAM, ch
+ 		goto err;
+ 	}
+ 	mode = local_file + strlen(local_file) + 1;
+-	if (mode >= block_buf + result || strcmp(mode, "octet") != 0) {
++	/* RFC 1350 says mode string is case independent */
++	if (mode >= block_buf + result || strcasecmp(mode, "octet") != 0) {
+ 		goto err;
+ 	}
+ # if ENABLE_FEATURE_TFTP_BLOCKSIZE
-- 
1.7.3.4
