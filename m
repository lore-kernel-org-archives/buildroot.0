From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 29 Dec 2017 15:03:33 +0200
Subject: [Buildroot] [PATCH] libtirpc: fix compilation error
Message-ID: <20171229130333.13661-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

when compiling libtirpc, rpcgen will fail with file not found on
netconfig.h and rpc/types.h
adding the proper include path to the makefile fixes it.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
index 1cf861417c..f2b15fe2f1 100644
--- a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
+++ b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
@@ -83,7 +83,7 @@ index 0000000..2277b6f
 --- /dev/null
 +++ b/rpcgen/Makefile.am
 @@ -0,0 +1,22 @@
-+COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) -I../tirpc $(AM_CPPFLAGS) \
 +	$(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
 +LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
 +
-- 
2.15.1
