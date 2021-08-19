Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF38C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:37:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBBE60720
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DBBE60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C53401B3;
	Thu, 19 Aug 2021 20:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q85ngmM2JOri; Thu, 19 Aug 2021 20:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FC0540292;
	Thu, 19 Aug 2021 20:37:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98D2D1BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88C95613D2
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NNqu_jl4vT9 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B9F60642
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 45E638D53C; Thu, 19 Aug 2021 20:36:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:36:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ab3b93bc9f2335388e00ab986ddf22eeb7a35ebd
X-Git-Newrev: daa90d691844c2fc3c853d5e45f81a5530bbbed2
X-Patchwork-Hint: ignore
Message-Id: <20210819203633.45E638D53C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ipset: bump to version
 7.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=daa90d691844c2fc3c853d5e45f81a5530bbbed2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This includes the following changes:

7.15
    - Kernel part changes
        - netfilter: ipset: Fix maximal range check in hash_ipportnet4_uadt() (Nathan Chancellor)

7.14
    - Userspace changes
        - Add missing function to libipset.map and bump library version (reported by Jan Engelhardt)
    - Kernel part changes
        - 64bit division isn't allowed on 32bit, replace it with shift

7.13
    - Userspace changes
        - When parsing protocols by number, do not check it in /etc/protocols.
        - Add missing hunk to patch "Allow specifying protocols by number"
    - Kernel part changes
        - Limit the maximal range of consecutive elements to add/delete fix

7.12
    - Userspace changes
        - Allow specifying protocols by number (Haw Loeung)
        - Fix example in ipset.8 manpage discovered by Pablo Neira Ayuso.
        - tests: add tests ipset to nftables (Pablo Neira Ayuso)
        - add ipset to nftables translation infrastructure (Pablo Neira Ayuso)
        - lib: Detach restore routine from parser (Pablo Neira Ayuso)
        - lib: split parser from command execution (Pablo Neira Ayuso)
        - Fix patch "Parse port before trying by service name"
    - Kernel part changes
        - Limit the maximal range of consecutive elements to add/delete (reported by Brad Spengler)
        - Backport "netfilter: use nfnetlink_unicast()"
        - Backport "netfilter: nfnetlink: consolidate callback type"
        - Backport "netfilter: nfnetlink: add struct nfnl_info and pass it to callbacks"
        - Backport "netfilter: add helper function to set up the nfnetlink header and use it"

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipset/ipset.hash | 4 ++--
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index afe83f6dce..9c251be27e 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From https://ipset.netfilter.org/ipset-7.11.tar.bz2.sha512sum.txt
-sha512  20890de32c17c04d9d3ae42fff64acfe21a252974bee5843ae39bdda707fcef55fde11cffccab9f987bf7e18f5445443c46c50eb854fb6f93f172f7bad07f922  ipset-7.11.tar.bz2
+# From https://ipset.netfilter.org/ipset-7.15.tar.bz2.sha512sum.txt
+sha512  0fc936d971c30a0925c585d506c8840e782fdaeec09bc8fd249e874fe838fa55a4dbb697f6e1423a6769abf07a1ce2195abc37cb641e8e4ad70f1b4c7130916a  ipset-7.15.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 07f865d4ec..4eda65e81b 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.11
+IPSET_VERSION = 7.15
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
