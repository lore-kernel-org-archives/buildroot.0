From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Sep 2013 08:31:39 -0300
Subject: [Buildroot] [PATCH] ola: needs host-bison and host-flex
Message-ID: <1379503899-26048-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/385/385f05b5e1b023b6c4ca220aab897e400b5aeccb/
and a future failure (host-bison).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ola/ola.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 55386b1..d7ddab7 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -12,7 +12,7 @@ OLA_LICENSE_FILES = LICENCE GPL LGPL
 OLA_INSTALL_STAGING = YES
 
 # util-linux provides uuid lib
-OLA_DEPENDENCIES = protobuf util-linux
+OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex
 
 OLA_CONF_OPT = \
 	--disable-gcov \
-- 
1.8.1.5
