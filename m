Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12219C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C23560187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C23560187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46B3283D62;
	Tue,  3 Aug 2021 23:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIyvgm27oaIR; Tue,  3 Aug 2021 23:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FD2083D5E;
	Tue,  3 Aug 2021 23:21:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD9F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DD5F40E74
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qduamoSjo2sX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24402406A4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 68D3B87B09; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 23:27:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 92d8b98c28921778ec73245c3558d91ec14bf5ad
X-Git-Newrev: 61f6d0a8abf98d3e2565e19575b1b3d462e3a7ac
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.68D3B87B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/slirp: security bump
 to version 4.6.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8537276406400803513=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============8537276406400803513==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=61f6d0a8abf98d3e2565e19575b1b3d462e3a7ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

mtod()-related buffer overflows (CVE-2021-3592 #44, CVE-2021-3593 #45,
CVE-2021-3594 #47, CVE-2021-3595 #46).

Drop patch (already in version)

https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.6.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ck-pkt_len-before-reading-protocol-header.patch | 60 ----------------------
 package/slirp/slirp.hash                           |  2 +-
 package/slirp/slirp.mk                             |  9 +---
 3 files changed, 3 insertions(+), 68 deletions(-)

diff --git a/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch b/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch
deleted file mode 100644
index 4046144712..0000000000
--- a/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 26 Nov 2020 19:27:06 +0530
-Subject: [PATCH] slirp: check pkt_len before reading protocol header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-While processing ARP/NCSI packets in 'arp_input' or 'ncsi_input'
-routines, ensure that pkt_len is large enough to accommodate the
-respective protocol headers, lest it should do an OOB access.
-Add check to avoid it.
-
-CVE-2020-29129 CVE-2020-29130
-  QEMU: slirp: out-of-bounds access while processing ARP/NCSI packets
- -> https://www.openwall.com/lists/oss-security/2020/11/27/1
-
-Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <20201126135706.273950-1-ppandit@redhat.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/ncsi.c  | 4 ++++
- src/slirp.c | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/src/ncsi.c b/src/ncsi.c
-index 3c1dfef..75dcc08 100644
---- a/src/ncsi.c
-+++ b/src/ncsi.c
-@@ -148,6 +148,10 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
-     uint32_t checksum;
-     uint32_t *pchecksum;
- 
-+    if (pkt_len < ETH_HLEN + sizeof(struct ncsi_pkt_hdr)) {
-+        return; /* packet too short */
-+    }
-+
-     memset(ncsi_reply, 0, sizeof(ncsi_reply));
- 
-     memset(reh->h_dest, 0xff, ETH_ALEN);
-diff --git a/src/slirp.c b/src/slirp.c
-index 9bead0c..abb6f9a 100644
---- a/src/slirp.c
-+++ b/src/slirp.c
-@@ -860,6 +860,10 @@ static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
-         return;
-     }
- 
-+    if (pkt_len < ETH_HLEN + sizeof(struct slirp_arphdr)) {
-+        return; /* packet too short */
-+    }
-+
-     ar_op = ntohs(ah->ar_op);
-     switch (ar_op) {
-     case ARPOP_REQUEST:
--- 
-2.20.1
-
diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index fe295b3bfb..326b2ad246 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  388b4b08a8cc0996cc5155cb027a097dc1a7f2cfe84b1121496608ab5366cc48  libslirp-4.3.1.tar.xz
+sha256  b8a22ac4d601ba16122a67827c0f4361785d4d283f21ff8ed48d4aa1e7693477  libslirp-4.6.1.tar.xz
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index ff92c60517..43d2c520e9 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-SLIRP_VERSION = 4.3.1
+SLIRP_VERSION = 4.6.1
 SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
-# Other "official" tarballs don't ship .tarball-version resulting in a build
-# failure: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/24
-SLIRP_SITE = https://elmarco.fedorapeople.org
+SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/uploads/83b199ea6fcdfc0c243dfde8546ee4c9
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_CPE_ID_VENDOR = libslirp_project
@@ -16,7 +14,4 @@ SLIRP_CPE_ID_PRODUCT = libslirp
 SLIRP_INSTALL_STAGING = YES
 SLIRP_DEPENDENCIES = libglib2
 
-# 0001-slirp-check-pkt_len-before-reading-protocol-header.patch
-SLIRP_IGNORE_CVES += CVE-2020-29129 CVE-2020-29130
-
 $(eval $(meson-package))

--===============8537276406400803513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8537276406400803513==--
