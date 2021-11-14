Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365DDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:12:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0F961167
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE0F961167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8B344022B;
	Sun, 14 Nov 2021 14:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEif1Kv0WKj8; Sun, 14 Nov 2021 14:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A07940248;
	Sun, 14 Nov 2021 14:12:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28E171BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 198E880D24
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hL7-hS-PC1E for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:11:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02D7980E50
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:11:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 978538D1F5; Sun, 14 Nov 2021 14:06:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:10:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ab4e346c52b804949c9e2da2e4374654e0abe54d
X-Git-Newrev: ff0d53405157ce82f6b56c74654c75c07b9ce92d
X-Patchwork-Hint: ignore
Message-Id: <20211114140655.978538D1F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iwd: bump version to
 1.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ff0d53405157ce82f6b56c74654c75c07b9ce92d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- removed 0001-build-Add-reallocarray-to-missing-h.patch
  (from upstream [1])

- removed 0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
  (from upstream [2])

- Changelog (since 1.18, from [3]):

  ver 1.19:
    Fix issue with handling OCV if offloading is supported.
    Fix issue with handling SA Query on channel switch event.
    Fix issue with starting FT-over-DS actions after roaming.
    Add support for OWE transition networks.
    Add support for extended key IDs.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971
[2] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7
[3] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-build-Add-reallocarray-to-missing-h.patch | 55 ----------------------
 ...netconfig-Remove-usage-of-in6_addr__in6_u.patch | 32 -------------
 package/iwd/iwd.hash                               |  2 +-
 package/iwd/iwd.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 89 deletions(-)

diff --git a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
deleted file mode 100644
index ef6114f1af..0000000000
--- a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From ec1c348b4fd67619fa0c2f55ae644f6a8014d971 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Sep 2021 21:17:44 +0200
-Subject: build: Add reallocarray to missing.h
-
-reallocarray has been added to glibc relatively recently (version 2.26,
-from 2017) and apparently not all users run new enough glibc. Moreover,
-reallocarray is not available with uclibc-ng. So use realloc if
-reallocarray is not available to avoid the following build failure
-raised since commit 891b78e9e892a3bcd800eb3a298e6380e9a15dd1:
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
-sae.c:(.text+0xd74): undefined reference to `reallocarray'
-
-Fixes:
- - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac  | 1 +
- src/missing.h | 7 +++++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index c6250401..51d9da93 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,6 +129,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
- 
- AC_CHECK_FUNCS(explicit_bzero)
- AC_CHECK_FUNCS(rawmemchr)
-+AC_CHECK_FUNCS(reallocarray)
- 
- AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
- 
-diff --git a/src/missing.h b/src/missing.h
-index 2cc80aee..a5b92952 100644
---- a/src/missing.h
-+++ b/src/missing.h
-@@ -37,3 +37,10 @@ _Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
- _Pragma("GCC diagnostic pop")
- }
- #endif
-+
-+#ifndef HAVE_REALLOCARRAY
-+static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
-+{
-+	return realloc(ptr, nmemb * size);
-+}
-+#endif
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
deleted file mode 100644
index f6b3d24516..0000000000
--- a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7 Mon Sep 17 00:00:00 2001
-From: Andrew Zaborowski <andrew.zaborowski@intel.com>
-Date: Thu, 16 Sep 2021 01:58:29 +0200
-Subject: netconfig: Remove usage of in6_addr.__in6_u
-
-in6_addr.__in6_u.__u6_addr8 is glibc-specific and named differently in
-the headers shipped with musl libc for example.  The POSIX compliant and
-universal way of accessing it is in6_addr.s6_addr.
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/netconfig.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/netconfig.c b/src/netconfig.c
-index ce95db0b..421270c9 100644
---- a/src/netconfig.c
-+++ b/src/netconfig.c
-@@ -171,7 +171,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
- 	struct in6_addr in6_addr;
- 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
- 
--	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
-+	memcpy(in6_addr.s6_addr, addr, 16);
- 
- 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
- 						INET6_ADDRSTRLEN)))) {
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 7c010ed891..008a2db011 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55  iwd-1.18.tar.xz
+sha256  dd65a8795f6127fb1b9e29f2092686b0590a0d3738c2b90c792ccd320deaf966  iwd-1.19.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 96bdc56e93..afa6e3bdeb 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.18
+IWD_VERSION = 1.19
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
