Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396D6D185D6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE86360DE3;
	Thu,  8 Jan 2026 11:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qifOsLOTHx0r; Thu,  8 Jan 2026 11:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22FE760DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870035;
	bh=DJ/Ze+BpXepilerqqfux4v5QkQRvO8NmBSSar6gkwOY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L5Wvbsfd4y6s4QomFJ9pu4uUs+M1yLQ13Oq8XO6I+SB/Sl6WFXyFxxs7j1bnWrKQU
	 VkYMyi94gXB3jS9GA3Fy5yP0ymkxt2dggrOonWF3+ZCfLuSdymKSaBb7Eb01tBYuyP
	 VC3F2qFxBi8lzfJz4TWSQqBZ5AWIAIbPADx3rvbGuSsGYxsixc/ddZRaPhW49zBV5a
	 adGjMtI2DL8bULoUr0Br7T7NAUqIe8WuPv6DKR06jO3nYmF/uD+/Ix69P3bcbBCcqd
	 WSMaGKxPudok0ze9dIjG9Es2qdL/Nv8KKZLVnjYEJB62NqZ9vVMTt6CzMEBArlSCdw
	 T/OdgNF+hyKtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22FE760DE5;
	Thu,  8 Jan 2026 11:00:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D683237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4B0408A5
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qd_BLJnXKctJ for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D451940A64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D451940A64
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D205288440; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:30:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 277edac62acdbf4d6035649929caa939b3675ae5
X-Git-Newrev: f8d61c86811cf6d88d9185be4966ad245ddbc0b5
X-Patchwork-Hint: ignore
Message-Id: <20260108110023.D205288440@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-path-tiny: bump to version
 0.150
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8d61c86811cf6d88d9185be4966ad245ddbc0b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index c0f1952c0b..8a99f87771 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  656d3556bb7f30c77d0881d564e200b2  Path-Tiny-0.146.tar.gz
-sha256  861ef09bca68254e9ab24337bb6ec9d58593a792e9d68a27ee6bec2150f06741  Path-Tiny-0.146.tar.gz
+md5  7126ad3d5c14a32a5f4bde0054f57449  Path-Tiny-0.150.tar.gz
+sha256  ff20713d1a14d257af9c78209001f40dc177e4b9d1496115cbd8726d577946c7  Path-Tiny-0.150.tar.gz
 
 # computed by scancpan
 sha256  c1a19c0d83f668a784640c0b41e024f37b182ad38011b170f9200123e57f6070  LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 5f10784251..5f83176982 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.146
+PERL_PATH_TINY_VERSION = 0.150
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
