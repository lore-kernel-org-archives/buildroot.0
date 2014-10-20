From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 09:28:06 -0300
Subject: [Buildroot] [PATCH 2/2] glibc/nsswitch.conf: also lookup on dns for
	networks
In-Reply-To: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413808086-12177-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/nsswitch.conf | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/glibc/nsswitch.conf b/package/glibc/nsswitch.conf
index d81e2f0..5c38491 100644
--- a/package/glibc/nsswitch.conf
+++ b/package/glibc/nsswitch.conf
@@ -1,17 +1,13 @@
 # /etc/nsswitch.conf
-#
-# Example configuration of GNU Name Service Switch functionality.
-# If you have the `glibc-doc-reference' and `info' packages installed, try:
-# `info libc "Name Service Switch"' for information about this file.
 
 passwd:         files
 group:          files
 shadow:         files
+
 hosts:          files dns
-networks:       files
+networks:       files dns
 
 protocols:      files
 services:       files
 ethers:         files
 rpc:            files
-
-- 
2.0.4
