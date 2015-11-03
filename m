From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:48:58 +0100
Subject: [Buildroot] [git commit] libtirpc: rpcgen is only built for host,
	don't install to target
Message-ID: <20151103224939.79AAC7FC4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f7f86fb1de4a1e5f56adbb12bd4bff6861a2820
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpcgen is only used to generate headers needed for compilation.
Move it to noinst_PROGRAMS otherwise you may end up with a host-arch
binary in your target.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Add-rpcgen-program-from-nfs-utils-sources.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
