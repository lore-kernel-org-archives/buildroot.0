Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9EBC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:41:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC28960555
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC28960555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0740400E5;
	Sat,  4 Sep 2021 18:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j__VsGJW37vQ; Sat,  4 Sep 2021 18:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B126240153;
	Sat,  4 Sep 2021 18:41:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 113751BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85DC8401AD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OUVRBU1mzMV for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC39401DF
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B62088834C; Sat,  4 Sep 2021 18:23:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:36:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab3b93bc9f2335388e00ab986ddf22eeb7a35ebd
X-Git-Newrev: daa90d691844c2fc3c853d5e45f81a5530bbbed2
X-Patchwork-Hint: ignore
Message-Id: <20210904182354.B62088834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipset: bump to version 7.15
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=daa90d691844c2fc3c853d5e45f81a5530bbbed2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
