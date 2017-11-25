From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 25 Nov 2017 15:54:38 +0200
Subject: [Buildroot] [RPC] package/libtirpc: fix compilation error
Message-ID: <20171125135438.22385-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix rpc_parse.c's compilation failure

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
index 1cf861417c..fee91d4adc 100644
--- a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
+++ b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
@@ -83,8 +83,8 @@ index 0000000..2277b6f
 --- /dev/null
 +++ b/rpcgen/Makefile.am
 @@ -0,0 +1,22 @@
-+COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+	$(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) -I$(top_builddir)/tirpc \
++	$(AM_CPPFLAGS) $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
 +LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
 +
 +noinst_PROGRAMS = rpcgen
-- 
2.15.0
