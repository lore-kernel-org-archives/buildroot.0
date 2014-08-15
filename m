From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Aug 2014 00:22:55 +0200
Subject: [Buildroot] [PATCH] package/infozip: Rename HOST_CC to HOSTCC
Message-ID: <1408141375-3893-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wrong variable name is used which can lead to build errors for the host variant:

[...] -I. -DUNIX" AS=" -c" -f unix/Makefile generic

c _match.s
make[1]: c: command not found

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/infozip/infozip.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 42cd1db..229299c 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -29,7 +29,7 @@ endef
 define HOST_INFOZIP_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) -I. -DUNIX" \
-		AS="$(HOST_CC) -c" \
+		AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
 
-- 
1.7.10.4
