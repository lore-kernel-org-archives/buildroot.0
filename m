Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D90EC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F6DB436EE;
	Fri, 29 Dec 2023 21:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F6DB436EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dD1PlMMq_FB8; Fri, 29 Dec 2023 21:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE79B436C4;
	Fri, 29 Dec 2023 21:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE79B436C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 362901BF239
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D981340070
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D981340070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3150oKHvBf8a for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 734634008F
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734634008F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B76383911; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:14:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 030108ba132acab36e9cf06d28a4a5da33fd9a7d
X-Git-Newrev: 885cda7e0d67eff56bf803e85185f9f86f02120f
X-Patchwork-Hint: ignore
Message-Id: <20231229211749.6B76383911@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lldpd: bump to version 1.0.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=885cda7e0d67eff56bf803e85185f9f86f02120f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/lldpd/lldpd/blob/1.0.17/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-read-overflow-when-parsing-CDP-addresses.patch | 24 ----------------------
 package/lldpd/lldpd.hash                           |  4 ++--
 package/lldpd/lldpd.mk                             |  5 +----
 3 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch b/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
deleted file mode 100644
index 05d882a07a..0000000000
--- a/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From a9aeabdf879c25c584852a0bb5523837632f099b Mon Sep 17 00:00:00 2001
-From: Vincent Bernat <vincent@bernat.ch>
-Date: Wed, 12 Apr 2023 07:38:31 +0200
-Subject: [PATCH] daemon: fix read overflow when parsing CDP addresses
-
-Upstream: https://github.com/lldpd/lldpd/commit/a9aeabdf879c25c584852a0bb5523837632f099b
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- NEWS                       | 4 ++++
- src/daemon/protocols/cdp.c | 1 +
- 2 files changed, 5 insertions(+)
-
-diff --git a/src/daemon/protocols/cdp.c b/src/daemon/protocols/cdp.c
-index 8a1be863..42861c0e 100644
---- a/src/daemon/protocols/cdp.c
-+++ b/src/daemon/protocols/cdp.c
-@@ -466,6 +466,7 @@ cdp_decode(struct lldpd *cfg, char *frame, int s, struct lldpd_hardware *hardwar
- 					goto malformed;
- 				}
- 				PEEK_DISCARD(address_len);
-+				addresses_len -= address_len;
- 				(void)PEEK_SAVE(pos_next_address);
- 				/* Next, we go back and try to extract
- 				   IPv4 address */
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 6db5ca98f1..e798e2beb2 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.15.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.17.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-sha256  f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126  lldpd-1.0.15.tar.gz
+sha256  9343177f145d2bca66ef03d59528079d3f1663c624b1e2b9d08268efdc6127ce  lldpd-1.0.17.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index d4abfade81..75457a25e3 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.15
+LLDPD_VERSION = 1.0.17
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
@@ -16,9 +16,6 @@ LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = LICENSE
 LLDPD_CPE_ID_VENDOR = lldpd_project
 
-# 0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
-LLDPD_IGNORE_CVES += CVE-2023-41910
-
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at lldpd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
