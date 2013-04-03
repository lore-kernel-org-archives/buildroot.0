From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 07:27:58 -0300
Subject: [Buildroot] [PATCH] linknx: forcilbly disable smtp support
Message-ID: <1364984878-829-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linknx has support for SMTP via libesmtp, however there's no clean way
to specify where libesmtp-config lives.
So when libesmtp is built it finds it via the headers and is
automatically enabled, but it fails to get the appropiate link line from
libesmtp-config because it's not found.
Fix it by forcibly disabling it. If someone is interested in working
with upstream about this an option like --with-libcurl should be
implemented in configure.
Solves:
http://autobuild.buildroot.net/results/90ebb383d7a2d7bdf09ffac65e2504da7b6d19f5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linknx/linknx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 42700a7..54e0426 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -9,7 +9,7 @@ LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LI
 LINKNX_LICENSE = GPLv2+
 LINKNX_INSTALL_STAGING = YES
 LINKNX_CONF_OPT = --without-lua --without-log4cpp --without-pth-test \
-		  --with-pth=$(STAGING_DIR)/usr
+		  --with-pth=$(STAGING_DIR)/usr --disable-smtp
 
 LINKNX_DEPENDENCIES = libpthsem
 
-- 
1.8.1.5
