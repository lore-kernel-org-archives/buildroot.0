Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2B7D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1820413F7;
	Wed,  7 Jan 2026 18:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70W-2VoDBRho; Wed,  7 Jan 2026 18:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3166413DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808935;
	bh=AEyFpp9oEkMp9J7nAbdL+LC+ubenBmQcTh/wTNTV7HQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o0YjC7p9COSJhZCFwMVRZRgN9W+fmzoeInQahaIVQkU2Bac10PN9dTRuBIyeoyj/G
	 GjPlmKpjt2bXGPelsKRgnVPo3/bX6RaVORaOT+v3jGNw0Db2V/QfdLCo79/IR3gpMI
	 K08sSoXmXHVEN/9nF/zee4/OE/TQY0U7xp7cUsrTezvvONhxULeGmIIUj/GB2DVu8T
	 5D2USISsy++C1cPezGMwagAqxJT/pKjKXbTS1NfQsjRmWH5xzNgj5JA8bWaW5Xsddo
	 ZYadhJqqKEhr4qfH13geIuHb6yamn3d3v2dyMdlgmmprynloVkAF0S9UJsO9DRkV7u
	 +7MZASpv3GEUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3166413DF;
	Wed,  7 Jan 2026 18:02:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12B94A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 402A540B4E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqkyEoWW5FCp for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 277AF409EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 277AF409EA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2683A82200; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:41:16 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8ec8167d80a8c8daf0537bc4f3486da384667a0d
X-Git-Newrev: c3846436d5bb3a90217d13c039e5036bb3072ad8
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.2683A82200@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/trinity: bump
 version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0116362031761370714=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0116362031761370714==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c3846436d5bb3a90217d13c039e5036bb3072ad8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Switched _SITE to github, old project site is down.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: change _VERSION to use 'git describe --abbrev=40' format]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 652dbe71c38b38f31ead4ac6f3426ec826d6d40d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |   4 -
 package/trinity/0001-Fix-build-with-GCC-10.patch   |  38 ------
 ...proto-ip-raw.c-fix-build-with-kernel-5.13.patch |  37 ------
 .../0003-Use-fcntl-h-for-dev_t-mode_t.patch        |  46 --------
 package/trinity/0004-drop-decnet.patch             | 130 ---------------------
 ...check-i810-mga-r128-and-savage-support-44.patch | 113 ------------------
 .../0006-kvm-drop-KVM_SET_MEMORY_REGION-42.patch   |  30 -----
 package/trinity/Config.in                          |   2 +-
 package/trinity/trinity.hash                       |   2 +-
 package/trinity/trinity.mk                         |   5 +-
 10 files changed, 4 insertions(+), 403 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9ef65e8724..704f916ea0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1031,10 +1031,6 @@ package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstre
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/trinity/0001-Fix-build-with-GCC-10.patch lib_patch.Upstream
-package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch lib_patch.Upstream
-package/trinity/0003-Use-fcntl-h-for-dev_t-mode_t.patch lib_patch.Upstream
-package/trinity/0004-drop-decnet.patch lib_patch.Upstream
 package/trousers/0001-Check-if-the-compiler-understands-pie-and-relro-options.patch lib_patch.Upstream
 package/trousers/0002-Check-that-getpwent_r-is-available-before-using-it.patch lib_patch.Upstream
 package/trousers/0003-Fix-build-with-LibreSSL-2-7.patch lib_patch.Upstream
diff --git a/package/trinity/0001-Fix-build-with-GCC-10.patch b/package/trinity/0001-Fix-build-with-GCC-10.patch
deleted file mode 100644
index 5ae3735db2..0000000000
--- a/package/trinity/0001-Fix-build-with-GCC-10.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e53e25cc8dd5bdb5f7d9b4247de9e9921eec81d8 Mon Sep 17 00:00:00 2001
-From: Vinson Lee <vlee@freedesktop.org>
-Date: Thu, 30 Jan 2020 22:09:45 -0800
-Subject: [PATCH] Fix build with GCC 10.
-
-  CC	trinity
-/usr/bin/ld: debug.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
-/usr/bin/ld: log-files.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
-/usr/bin/ld: log.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
-/usr/bin/ld: main.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
-/usr/bin/ld: output.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
-/usr/bin/ld: params.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
-/usr/bin/ld: shm.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
-/usr/bin/ld: trinity.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
-
-Fixes: 13856316c259 ("reinstate the log-to-file code for now.")
-Signed-off-by: Vinson Lee <vlee@freedesktop.org>
-
-[Retrieved from:
-https://github.com/kernelslacker/trinity/commit/e53e25cc8dd5bdb5f7d9b4247de9e9921eec81d8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/logfile.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/logfile.h b/include/logfile.h
-index 90ea8b23..2305ac15 100644
---- a/include/logfile.h
-+++ b/include/logfile.h
-@@ -5,7 +5,7 @@
- FILE *find_logfile_handle(void);
- void synclogs(void);
- 
--FILE *mainlogfile;
-+extern FILE *mainlogfile;
- void open_main_logfile(void);
- void close_logfile(FILE **handle);
- 
diff --git a/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch b/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch
deleted file mode 100644
index 4c747f41c9..0000000000
--- a/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From da65f0aa2bfcb4a2d9a77abfaa2955c6be3d37c9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 17 Jul 2021 08:02:31 +0200
-Subject: [PATCH] net/proto-ip-raw.c: fix build with kernel >= 5.13
-
-Fix the following build failure with kernel >= 5.13:
-
-In file included from /home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/linux/icmp.h:23,
-                 from net/proto-ip-raw.c:1:
-/home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/netinet/in.h:33:5: error: redeclaration of enumerator 'IPPROTO_IP'
-   33 |     IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
-      |     ^~~~~~~~~~
-/home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/linux/in.h:29:3: note: previous definition of 'IPPROTO_IP' was here
-   29 |   IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
-      |   ^~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/c58119baed8d7711da799e34a5ee1117f46b96f4
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/kernelslacker/trinity/pull/35]
----
- net/proto-ip-raw.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/net/proto-ip-raw.c b/net/proto-ip-raw.c
-index 95f2cb13..b407bb68 100644
---- a/net/proto-ip-raw.c
-+++ b/net/proto-ip-raw.c
-@@ -1,3 +1,4 @@
-+#include <netinet/in.h>
- #include <linux/icmp.h>
- #include "net.h"
- #include "trinity.h"
--- 
-2.30.2
-
diff --git a/package/trinity/0003-Use-fcntl-h-for-dev_t-mode_t.patch b/package/trinity/0003-Use-fcntl-h-for-dev_t-mode_t.patch
deleted file mode 100644
index c4d9811b8a..0000000000
--- a/package/trinity/0003-Use-fcntl-h-for-dev_t-mode_t.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b1a0aef9978d4a41e7e601c277d4fb1b0cfbed89 Mon Sep 17 00:00:00 2001
-From: Dave Jones <davej@codemonkey.org.uk>
-Date: Thu, 26 Aug 2021 11:17:34 -0400
-Subject: [PATCH] Use fcntl.h for dev_t & mode_t
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Should fix:
-
-In file included from /usr/include/bits/statx.h:31,
-                 from /usr/include/sys/stat.h:446,
-                 from include/files.h:3,
-                 from include/shm.h:6,
-                 from syscalls/x86/modify_ldt.c:12:
-/usr/include/linux/stat.h:57:2: error: unknown type name ‘__s64’
-  __s64 tv_sec;
-  ^~~~~
-/usr/include/linux/stat.h:58:2: error: unknown type name ‘__u32’
-  __u32 tv_nsec;
-  ^~~~~
-/usr/include/linux/stat.h:59:2: error: unknown type name ‘__s32’
-  __s32 __reserved;
-  ^~~~~
-/usr/include/linux/stat.h:101:2: error: unknown type name ‘__u32’
-  __u32 stx_mask; /* What results were written [uncond] */
-
-[Retrieved from:
-https://github.com/kernelslacker/trinity/commit/b1a0aef9978d4a41e7e601c277d4fb1b0cfbed89]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/files.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/files.h b/include/files.h
-index 2a8e0e2d..ba3cc98f 100644
---- a/include/files.h
-+++ b/include/files.h
-@@ -1,6 +1,6 @@
- #pragma once
- 
--#include <sys/stat.h>
-+#include <fcntl.h>
- #include "fd.h"
- 
- unsigned long get_o_flags(void);
diff --git a/package/trinity/0004-drop-decnet.patch b/package/trinity/0004-drop-decnet.patch
deleted file mode 100644
index 15ba7f8e82..0000000000
--- a/package/trinity/0004-drop-decnet.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From ec8dcc7faf13c57f5f6d785e4429818f1239a058 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 Jan 2023 20:50:18 +0100
-Subject: [PATCH] drop decnet
-
-Drop decnet as it has been removed since kernel 6.1 and
-https://github.com/torvalds/linux/commit/1202cdd665315c525b5237e96e0bedc76d7e754f
-resulting in the following build failure:
-
-net/proto-decnet.c:5:10: fatal error: linux/dn.h: No such file or directory
-    5 | #include <linux/dn.h>
-      |          ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/47e0a5e0b6fcf33ab4f9848d5d8c2be9e5283950
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/kernelslacker/trinity/pull/41]
----
- include/net.h      |  1 -
- net/proto-decnet.c | 59 ----------------------------------------------
- net/proto-unix.c   |  1 -
- net/protocols.c    |  1 -
- 4 files changed, 62 deletions(-)
- delete mode 100644 net/proto-decnet.c
-
-diff --git a/include/net.h b/include/net.h
-index 99d55363..791e8090 100644
---- a/include/net.h
-+++ b/include/net.h
-@@ -80,7 +80,6 @@ extern const struct netproto proto_atmpvc;
- extern const struct netproto proto_atmsvc;
- extern const struct netproto proto_x25;
- extern const struct netproto proto_rose;
--extern const struct netproto proto_decnet;
- extern const struct netproto proto_llc;
- extern const struct netproto proto_netlink;
- extern const struct netproto proto_packet;
-diff --git a/net/proto-decnet.c b/net/proto-decnet.c
-deleted file mode 100644
-index 7711cf00..00000000
---- a/net/proto-decnet.c
-+++ /dev/null
-@@ -1,59 +0,0 @@
--#include <sys/types.h>
--#include <sys/socket.h>
--#include <sys/un.h>
--#include <netinet/in.h>
--#include <linux/dn.h>
--#include <stdlib.h>
--#include "net.h"
--#include "random.h"
--#include "utils.h"	// RAND_ARRAY
--#include "compat.h"
--
--static void decnet_gen_sockaddr(struct sockaddr **addr, socklen_t *addrlen)
--{
--	struct sockaddr_dn *dn;
--	unsigned int i;
--
--	dn = zmalloc(sizeof(struct sockaddr_dn));
--
--	dn->sdn_family = PF_DECnet;
--	dn->sdn_flags = rnd();
--	dn->sdn_objnum = rnd();
--	dn->sdn_objnamel = rnd() % 16;
--	for (i = 0; i < dn->sdn_objnamel; i++)
--		dn->sdn_objname[i] = rnd();
--	dn->sdn_add.a_len = RAND_BOOL();
--	dn->sdn_add.a_addr[0] = rnd();
--	dn->sdn_add.a_addr[1] = rnd();
--	*addr = (struct sockaddr *) dn;
--	*addrlen = sizeof(struct sockaddr_dn);
--}
--
--static const unsigned int decnet_opts[] = {
--	SO_CONDATA, SO_CONACCESS, SO_PROXYUSR, SO_LINKINFO,
--	DSO_CONDATA, DSO_DISDATA, DSO_CONACCESS, DSO_ACCEPTMODE,
--	DSO_CONACCEPT, DSO_CONREJECT, DSO_LINKINFO, DSO_STREAM,
--	DSO_SEQPACKET, DSO_MAXWINDOW, DSO_NODELAY, DSO_CORK,
--	DSO_SERVICES, DSO_INFO
--};
--
--static void decnet_setsockopt(struct sockopt *so, __unused__ struct socket_triplet *triplet)
--{
--	so->level = SOL_DECNET;
--	so->optname = RAND_ARRAY(decnet_opts);
--
--	// TODO: set optlen correctly
--}
--
--static struct socket_triplet decnet_triplets[] = {
--	{ .family = PF_DECnet, .protocol = DNPROTO_NSP, .type = SOCK_SEQPACKET },
--	{ .family = PF_DECnet, .protocol = DNPROTO_NSP, .type = SOCK_STREAM },
--};
--
--const struct netproto proto_decnet = {
--	.name = "decnet",
--	.setsockopt = decnet_setsockopt,
--	.gen_sockaddr = decnet_gen_sockaddr,
--	.valid_triplets = decnet_triplets,
--	.nr_triplets = ARRAY_SIZE(decnet_triplets),
--};
-diff --git a/net/proto-unix.c b/net/proto-unix.c
-index f7427a22..119c1429 100644
---- a/net/proto-unix.c
-+++ b/net/proto-unix.c
-@@ -2,7 +2,6 @@
- #include <sys/socket.h>
- #include <sys/un.h>
- #include <netinet/in.h>
--#include <linux/dn.h>
- #include <stdlib.h>
- #include "net.h"
- #include "random.h"
-diff --git a/net/protocols.c b/net/protocols.c
-index ea64d5f5..278f08b5 100644
---- a/net/protocols.c
-+++ b/net/protocols.c
-@@ -18,7 +18,6 @@ const struct protoptr net_protocols[TRINITY_PF_MAX] = {
- #ifdef USE_IPV6
- 	[PF_INET6] = { .proto = &proto_inet6 },
- #endif
--	[PF_DECnet] = { .proto = &proto_decnet },
- 	[PF_PACKET] = { .proto = &proto_packet },
- #ifdef USE_NETECONET
- 	[PF_ECONET] = { .proto = &proto_econet },
--- 
-2.39.0
-
diff --git a/package/trinity/0005-ioctls-drm-check-i810-mga-r128-and-savage-support-44.patch b/package/trinity/0005-ioctls-drm-check-i810-mga-r128-and-savage-support-44.patch
deleted file mode 100644
index b91fddb20b..0000000000
--- a/package/trinity/0005-ioctls-drm-check-i810-mga-r128-and-savage-support-44.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 6823bacb3c2564bff5da3175c574fd6a6af4d8b2 Mon Sep 17 00:00:00 2001
-From: chuhu <chuhu@redhat.com>
-Date: Sat, 1 Jul 2023 01:02:37 +0800
-Subject: [PATCH] ioctls/drm: check i810,mga,r128 and savage support (#44)
-
-kernel v6.3-rc1 removed some drm drivers, so add the extra check to make
-the compile succeed.
-
-7872bc2cb13e drm: Remove the obsolete driver-savage
-28483b8666bf drm: Remove the obsolete driver-r128
-96ed7db55bef drm: Remove the obsolete driver-mga
-cab18866fead drm: Remove the obsolete driver-i810
-
-Signed-off-by: Chunyu Hu <chuhu@redhat.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/kernelslacker/trinity/commit/6823bacb3c2564bff5da3175c574fd6a6af4d8b2
----
- configure    |  4 ++++
- ioctls/drm.c | 14 ++++++++++++++
- 2 files changed, 18 insertions(+)
-
-diff --git a/configure b/configure
-index 944c8cf7..bbaf9afc 100755
---- a/configure
-+++ b/configure
-@@ -320,6 +320,10 @@ check_header linux/irda.h USE_IRDA
- check_header linux/rds.h USE_RDS
- check_header linux/vfio.h USE_VFIO
- check_header drm/drm.h USE_DRM
-+check_header drm/i810_drm.h USE_DRM_I810
-+check_header drm/mga_drm.h USE_DRM_MGA
-+check_header drm/r128_drm.h USE_DRM_R128
-+check_header drm/savage_drm.h USE_DRM_SAVAGE
- check_header drm/exynos_drm.h USE_DRM_EXYNOS
- check_header sound/compress_offload.h USE_SNDDRV_COMPRESS_OFFLOAD
- check_header linux/kvm.h USE_KVM
-diff --git a/ioctls/drm.c b/ioctls/drm.c
-index 81ed3682..a07a8436 100644
---- a/ioctls/drm.c
-+++ b/ioctls/drm.c
-@@ -8,13 +8,21 @@
- #ifdef USE_DRM_EXYNOS
- #include <drm/exynos_drm.h>
- #endif
-+#ifdef USE_DRM_I810
- #include <drm/i810_drm.h>
-+#endif
- #include <drm/i915_drm.h>
-+#ifdef USE_DRM_MGA
- #include <drm/mga_drm.h>
-+#endif
- #include <drm/nouveau_drm.h>
-+#ifdef USE_DRM_R128
- #include <drm/r128_drm.h>
-+#endif
- #include <drm/radeon_drm.h>
-+#ifdef USE_DRM_SAVAGE
- #include <drm/savage_drm.h>
-+#endif
- 
- #include "ioctls.h"
- #include "utils.h"
-@@ -293,6 +301,7 @@ static const struct ioctl drm_ioctls[] = {
- #endif
- #endif
- 
-+#ifdef USE_DRM_I810
- 	/* i810_drm.h */
- 	IOCTL(DRM_IOCTL_I810_INIT),
- 	IOCTL(DRM_IOCTL_I810_VERTEX),
-@@ -309,6 +318,7 @@ static const struct ioctl drm_ioctls[] = {
- 	IOCTL(DRM_IOCTL_I810_MC),
- 	IOCTL(DRM_IOCTL_I810_RSTATUS),
- 	IOCTL(DRM_IOCTL_I810_FLIP),
-+#endif
- 
- 	/* i915_drm.h */
- 	IOCTL(DRM_IOCTL_I915_INIT),
-@@ -378,6 +388,7 @@ static const struct ioctl drm_ioctls[] = {
- 	IOCTL(DRM_IOCTL_I915_REG_READ),
- #endif
- 
-+#ifdef USE_DRM_MGA
- 	/* mga_drm.h */
- 	IOCTL(DRM_IOCTL_MGA_INIT),
- 	IOCTL(DRM_IOCTL_MGA_FLUSH),
-@@ -401,6 +412,7 @@ static const struct ioctl drm_ioctls[] = {
- 	IOCTL(DRM_IOCTL_NOUVEAU_GROBJ_ALLOC),
- 	IOCTL(DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC),
- 	IOCTL(DRM_IOCTL_NOUVEAU_GPUOBJ_FREE),
-+#endif
- #ifdef DRM_IOCTL_NOUVEAU_GEM_NEW
- 	IOCTL(DRM_IOCTL_NOUVEAU_GEM_NEW),
- #endif
-@@ -417,6 +429,7 @@ static const struct ioctl drm_ioctls[] = {
- 	IOCTL(DRM_IOCTL_NOUVEAU_GEM_INFO),
- #endif
- 
-+#ifdef USE_DRM_R128
- 	/* r128_drm.h */
- 	IOCTL(DRM_IOCTL_R128_INIT),
- 	IOCTL(DRM_IOCTL_R128_CCE_START),
-@@ -435,6 +448,7 @@ static const struct ioctl drm_ioctls[] = {
- 	IOCTL(DRM_IOCTL_R128_FULLSCREEN),
- 	IOCTL(DRM_IOCTL_R128_GETPARAM),
- 	IOCTL(DRM_IOCTL_R128_FLIP),
-+#endif
- 
- 	/* radeon_drm.h */
- 	IOCTL(DRM_IOCTL_RADEON_CP_INIT),
--- 
-2.39.2
-
diff --git a/package/trinity/0006-kvm-drop-KVM_SET_MEMORY_REGION-42.patch b/package/trinity/0006-kvm-drop-KVM_SET_MEMORY_REGION-42.patch
deleted file mode 100644
index 4277983694..0000000000
--- a/package/trinity/0006-kvm-drop-KVM_SET_MEMORY_REGION-42.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ca07c86b2aeeb91213922eaf481c9e224679a7fd Mon Sep 17 00:00:00 2001
-From: Jiri Slaby <jirislaby@gmail.com>
-Date: Fri, 17 Mar 2023 20:28:24 +0100
-Subject: [PATCH] kvm: drop KVM_SET_MEMORY_REGION (#42)
-
-It was dropped in upstream in commit 61e15f871241 (KVM: Delete all
-references to removed KVM_SET_MEMORY_REGION ioctl).
-
-Co-authored-by: Jiri Slaby <jslaby@suse.cz>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/kernelslacker/trinity/commit/ca07c86b2aeeb91213922eaf481c9e224679a7fd
----
- ioctls/kvm.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/ioctls/kvm.c b/ioctls/kvm.c
-index 14c55ef1..30aeed7a 100644
---- a/ioctls/kvm.c
-+++ b/ioctls/kvm.c
-@@ -8,7 +8,6 @@
- #include "utils.h"
- 
- static const struct ioctl kvm_ioctls[] = {
--	IOCTL(KVM_SET_MEMORY_REGION),
- 	IOCTL(KVM_CREATE_VCPU),
- 	IOCTL(KVM_GET_DIRTY_LOG),
- 	IOCTL(KVM_SET_NR_MMU_PAGES),
--- 
-2.39.2
-
diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 31a930570a..cf71a64b4e 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_TRINITY
 	help
 	  A Linux System call fuzz tester
 
-	  http://codemonkey.org.uk/projects/trinity/
+	  https://github.com/kernelslacker/trinity
 
 comment "trinity needs a toolchain w/ headers >= 3.4"
 	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index 24da8ea684..94b73479cc 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e0da953c2cc6fb3907d1f37d35f61836433fb50e97117a72eef113abb783dc6  trinity-1.9.tar.xz
+sha256  df32531560a63cf9b5b7714152aa5e82aaed0a58a1dafc6baf9ca67ea8ad3ec2  trinity-v1.9-82-g294c46522620afffd7b57af7ef743131ff55a488.tar.gz
 sha256  35e3fc68c89fd7b8f72fd910b521cb3292f859e9181f3c26bd0df84d144bc1d4  COPYING
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index f6b56f6241..d236c188ea 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-TRINITY_VERSION = 1.9
-TRINITY_SITE = http://codemonkey.org.uk/projects/trinity
-TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
+TRINITY_VERSION = v1.9-82-g294c46522620afffd7b57af7ef743131ff55a488
+TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 TRINITY_CPE_ID_VALID = YES

--===============0116362031761370714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0116362031761370714==--
