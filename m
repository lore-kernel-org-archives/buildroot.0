From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 22:29:34 +0200
Subject: [Buildroot] [git commit] nfs-utils: fix build with ipv6 after
	2a10c9 (pass --enable-ipv6 to autotargets configure)
Message-ID: <20120425203046.8E63F96BB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e23be36ab3a110787917db59618d9f5280457938
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

IPv6 support needs the TIRPC library, which we don't have in Buildroot, so
forcibly disable IPv6 support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nfs-utils/nfs-utils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index bbe25fe..557e7e8 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -14,6 +14,7 @@ NFS_UTILS_CONF_OPT = \
 		--disable-gss \
 		--disable-tirpc \
 		--disable-uuid \
+		--disable-ipv6 \
 		--without-tcp-wrappers \
 		--with-rpcgen=internal
 
