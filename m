From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue,  3 Nov 2015 22:09:43 +0100
Subject: [Buildroot] [PATCH 1/1] libtirpc: rpcgen is only built for host,
	don't install to target
Message-ID: <1446584983-29703-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpcgen is only used to generate headers needed for compilation.
Move it to noinst_PROGRAMS otherwise you may end up with a host-arch
binary in your target.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
index ad14312..1cf8614 100644
--- a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
+++ b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
@@ -87,7 +87,7 @@ index 0000000..2277b6f
 +	$(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
 +LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
 +
-+bin_PROGRAMS = rpcgen
++noinst_PROGRAMS = rpcgen
 +
 +rpcgen_SOURCES = \
 +	rpc_clntout.c \
-- 
2.1.4
