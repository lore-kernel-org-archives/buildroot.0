From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:53:13 +0200
Subject: [Buildroot] [git commit] lua-posix: bump to version 32
Message-ID: <20140721195331.6B6669D2A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6697a6eb31457b262b0dc9adfa43caf87aa605bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the patch was merged upstream,
see https://github.com/luaposix/luaposix/pull/117

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luaposix/luaposix-without-IPv6.patch |   55 --------------------------
 package/luaposix/luaposix.mk                 |    2 +-
 2 files changed, 1 insertions(+), 56 deletions(-)

diff --git a/package/luaposix/luaposix-without-IPv6.patch b/package/luaposix/luaposix-without-IPv6.patch
deleted file mode 100644
index f187882..0000000
--- a/package/luaposix/luaposix-without-IPv6.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-fix without IPv6
-
-see https://github.com/luaposix/luaposix/pull/117
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/ext/posix/posix.c
-===================================================================
---- a/ext/posix/posix.c
-+++ b/ext/posix/posix.c
-@@ -3637,6 +3637,7 @@
- 					break;
- 			}
- 			break;
-+#if defined(IPV6_JOIN_GROUP) && defined(IPV6_LEAVE_GROUP)
- 		case IPPROTO_IPV6:
- 			switch(optname) {
- 				case IPV6_JOIN_GROUP:
-@@ -3650,6 +3651,7 @@
- 					break;
- 			}
- 			break;
-+#endif
- 		case IPPROTO_TCP:
- 			switch(optname) {
- 				default:
-@@ -4697,13 +4699,27 @@
- 	MENTRY( AI_V4MAPPED	);
- 	MENTRY( AI_ALL		);
- 	MENTRY( AI_ADDRCONFIG	);
-+#endif
- 
-+#ifdef IPV6_JOIN_GROUP
- 	MENTRY( IPV6_JOIN_GROUP		);
-+#endif
-+#ifdef IPV6_LEAVE_GROUP
- 	MENTRY( IPV6_LEAVE_GROUP	);
-+#endif
-+#ifdef IPV6_MULTICAST_HOPS
- 	MENTRY( IPV6_MULTICAST_HOPS	);
-+#endif
-+#ifdef IPV6_MULTICAST_IF
- 	MENTRY( IPV6_MULTICAST_IF	);
-+#endif
-+#ifdef IPV6_MULTICAST_LOOP
- 	MENTRY( IPV6_MULTICAST_LOOP	);
-+#endif
-+#ifdef IPV6_UNICAST_HOPS
- 	MENTRY( IPV6_UNICAST_HOPS	);
-+#endif
-+#ifdef IPV6_V6ONLY
- 	MENTRY( IPV6_V6ONLY		);
- #endif
- #undef MENTRY
-
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 77f5e62..8fb63a3 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 31
+LUAPOSIX_VERSION = 32
 LUAPOSIX_SITE = https://github.com/luaposix/luaposix/archive
 LUAPOSIX_SOURCE = release-v$(LUAPOSIX_VERSION).tar.gz
 LUAPOSIX_LICENSE = MIT
