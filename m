From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 22:21:06 +0100
Subject: [Buildroot] [git commit] libtirpc: fix compilation error of rpcgen
Message-ID: <20171229212221.C4146837B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1521836c4e0d173767d7417fcc2682cb19ca8aba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling libtirpc, without RPC support available on the host
machine, the build of the rpcgen host program because it cannot find
the netconfig.h and rpc/types.h headers. Instead of relying on the
system-provided ones, let's use the ones included in the libtirpc
source code by patching the rpcgen build logic.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
[Thomas: reword commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
index 1cf8614..f2b15fe 100644
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
