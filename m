Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E98C982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C592B40422;
	Fri, 16 Jan 2026 21:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCQXvBoQH3y7; Fri, 16 Jan 2026 21:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08C0402B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768598771;
	bh=ZBaebdXtcPqXYR5qxE/Moaeg1+9tXN/NCD9R9JxQwzY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KRQKiJeNnLWy/PA6SM5EEOPydGRkeHrXGichW0HkYuTF5wFKaVE9y2daXItjVtzTS
	 k80x9kAi2VdWr28wtkNmYLZ5LG1hirsGQcvS7yglxWqsU+GKSNzN9KEP1ILTaNoFQC
	 raGgNVFngXY76iJ72XSKJwvJiFeMmn4TO3cHQAGyiPKYwGWZezfUsAm6BvvSb3XQ7h
	 vq4pZhafkrBODXxBktWfsP2mNSouYC/lei5b3qpKUoE17LkOlt7WEKTq7xonaEpKf2
	 DIU+W5xRuiuNEZIG1sfhEhfUnNpHWx5Lzh/DVr2zZPlaxJuBaPh+weaSdkwdTXv6tl
	 KcmEFDPT9+kLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08C0402B5;
	Fri, 16 Jan 2026 21:26:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B8BA223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2081E401CB
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6-E9BpFivKW for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FFE2400FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FFE2400FF
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:26:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E26E886B8; Fri, 16 Jan 2026 21:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 22:25:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 796dfc2c927695b5e9a01f1df295627d4c955949
X-Git-Newrev: 4768a26047d31fbf0dde3a282513707f81aed52f
X-Patchwork-Hint: ignore
Message-Id: <20260116212609.5E26E886B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rp-pppoe: update tarball URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4768a26047d31fbf0dde3a282513707f81aed52f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project moved its repo to codeberg.org:
https://dianne.skoll.ca/pipermail/rp-pppoe/2025q3/000663.html

Updated tarball hash after verifying that no files changed, only the
directory name changed from rp-pppoe-4.0/ to rp-pppoe/

Fixes:
https://autobuild.buildroot.net/results/5ff/5fff21a4150a5f668d43830591e21b660299ed9d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rp-pppoe/rp-pppoe.hash | 2 +-
 package/rp-pppoe/rp-pppoe.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index 97bb61eaf8..89f9f5c33f 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  17d45712778f2bf6b0859ff610a3dacd24bc4462e9f53bb1466d47af391701d3  rp-pppoe-4.0.tar.gz
+sha256  459904065fd4a70c927757d84cc7b4ef70946a707fa1b83f16246f925158b13e  4.0.tar.gz
 sha256  d2767e7ffc6dc9477812f6238551fe4b29a889df6f23c3922e7b9cec92bc278d  doc/LICENSE
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 98325e7d49..562e0311f0 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RP_PPPOE_VERSION = 4.0
-RP_PPPOE_SITE = $(call github,dfskoll,rp-pppoe,$(RP_PPPOE_VERSION))
+RP_PPPOE_SITE = https://codeberg.org/dskoll/rp-pppoe/archive
+RP_PPPOE_SOURCE = $(RP_PPPOE_VERSION).tar.gz
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
