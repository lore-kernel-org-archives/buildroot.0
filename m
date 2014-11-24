From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 24 Nov 2014 14:04:42 +0100
Subject: [Buildroot] [PATCH] sstrip: fix source svn repoisoty url
Message-ID: <1416834282-30246-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because the svn repository url was changed the command
"make sstrip-source" give this error:

svn: E000101: Unable to connect to a repository at URL 'svn://dev.openwrt.org/openwrt/trunk/tools/sstrip'
svn: E000101: Can't connect to host 'dev.openwrt.org': Network is unreachable

To fix this error use the correct url "svn://svn.openwrt.org/openwrt".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sstrip/sstrip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index deab010..fe57b3c 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
+SSTRIP_SITE = svn://svn.openwrt.org/openwrt/trunk/tools/sstrip
 SSTRIP_VERSION = 20154
 HOST_SSTRIP_BINARY = $(GNU_TARGET_NAME)-sstrip
 
-- 
2.1.3
