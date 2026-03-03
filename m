Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BACEDA6B2
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E176D40D12;
	Tue,  3 Mar 2026 17:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1Aurlj9SnWY; Tue,  3 Mar 2026 17:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CAEE40A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772558814;
	bh=NOR8d3cicAjrFZHg3gU9KZ+Bm+/Pmd0JINIEBONS4j8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XVEDLVRupadvSnAKduL4Rej64bK2zogiZ6NP31KSgUrHstyC0iQBQqu7Isd8SkgBX
	 0s6fHXO+qFboMFd7UNu5VwuXTqkK/gasvZZzrWwU9owRgwkwcW+c+j+LXcmbPJJnLj
	 pm3c+P6CPPP3DjHGJeDZg4p9q5BRJ/NNvuS3mH7f7dushf7nyhmC8w24l972T2AuGy
	 0Gap6hzlBht02Fub9cE0R4AsjFORn1YuRThXvd+ATl+dCEL9gu7woD3L/LHPoibCcw
	 1nvdR/rChkUesvs7la3smH+dOxk9+RKSmzjJhRLOpUAlt/UuH54xEpV2k+ZI6qtY3S
	 ZSCwR247sOjQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CAEE40A93;
	Tue,  3 Mar 2026 17:26:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12DF425B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04B16812DC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkpEYC05mOjj for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A66D8068A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A66D8068A
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2123E85FB8; Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 18:25:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8918f1c2c86844a5b4110cc71865838365324cfc
X-Git-Newrev: 73861bb720a82316cb56e644fc75d3a7ce95980e
X-Patchwork-Hint: ignore
Message-Id: <20260303172652.2123E85FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: bump to v2.11.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/73861bb720a82316cb56e644fc75d3a7ce95980e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For more information on the release, see:

- https://github.com/FreeRDP/FreeRDP/commit/9b678b6d5a40ce01607d8c3b1b1416437c8416c4
- https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8
- https://github.com/FreeRDP/FreeRDP/compare/2.11.7...2.11.8

Note: the previous freerdp version 2.11.7-18-g0ee17e2f in Buildroot
is only 5 commits prior the 2.11.8 tag. This is a very minimal bump.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freerdp/freerdp.hash | 2 +-
 package/freerdp/freerdp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 83b83db121..5ae222e2ec 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7cc2bf43b9778e9079cd229ea8e37fc1843eb1c11a8e4e003034af71858ce6a  freerdp-2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0-git4.tar.gz
+sha256  8a7c953ece217aa4fa22c4a21ab2bc4c9093fc79aa67d3e1273c140d140203f7  freerdp-2.11.8-git4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index eb17c80e4f..6929c73683 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# Latest, and probably last, commit on the stable-2.0 branch
-FREERDP_VERSION = 2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0
+# Latest, and probably last, release on the stable-2.0 branch
+FREERDP_VERSION = 2.11.8
 FREERDP_SITE = https://github.com/FreeRDP/FreeRDP
 FREERDP_SITE_METHOD = git
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
