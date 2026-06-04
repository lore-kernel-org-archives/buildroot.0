Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD86CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4603240F47;
	Fri,  5 Jun 2026 12:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAsopVpgWrEH; Fri,  5 Jun 2026 12:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E64940F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663085;
	bh=Ne8ljhgjaVgZRqRauCrslmKkm3zYTDrnJ1AGh1XUaO4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rj5/0Fl4Hpiep2weO/Ur0hez7kL41FZKzh1Ml/oVnekPWuNHQ/lRoCYXKYn1AYMN9
	 vtdYqvNR30f9sKViLr4m9o+ezgwb4WT4ifuZlRVp3eAfcsYBYUGhm3PHot8DpZj1Ip
	 IdtSxc0a5Op4taBC+4hFZcE/3quAhzxjXyttaLi+j+S0e/bglrX91MUliMVwSFoeHZ
	 fslpCbX2fZ2G36CfjQjIez0jesCl4nRpDRsu95QmE7dTXSK8tZSuZ4w9kPwidD3O+/
	 MIBGEERGM/zjYcWJWHYN0LFwAmxLtnWszfeYnbuz5vRUsCJDGLL8WrJjjuGnxuuFGG
	 6L24qTGieHboA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E64940F28;
	Fri,  5 Jun 2026 12:38:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A5B388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00F0281EBF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4q6_-Jted_Eq for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A1281E76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97A1281E76
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C18E987B40; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:44:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c8f39dda82f833b95a3201a917de3c3c05838d3
X-Git-Newrev: 729efd317dcfa9efdb8c6f56c0ec00e7fc270d7b
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.C18E987B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/exim: security
 bump version to 4.99.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/729efd317dcfa9efdb8c6f56c0ec00e7fc270d7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.exim.org/lurker/message/20260529.143857.4c75d7df.en.html
https://www.exim.org/static/doc/security/EXIM-Security-2026-05-19.1/EXIM-Security-2026-05-19.1.txt

Fixes CVE-2026-48840.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 727c2981cb59ebf6a3ee4e3ef03829cc8ae48536)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index e95f7f5efe..cbf29c3f5d 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  663e76d2a0d9b8fc5b373d0008e44ae044f10feb22bc9dbae8c7f21345ebfb3b  exim-4.99.3.tar.xz
+sha256  87ff38815700dfb1ee4eb7e8dba7916df7a755905354d2d0faa1ae1790c4fd9d  exim-4.99.4.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  7c4109f499497e2432b71ad3f3f1cac358e63b1b693a352047e6990619d7fd619d3a966ba585482c58e0b23b3fa4f385d15720c455fda29633411e35db1d2e7f  exim-4.99.3.tar.xz
+sha512  30fa01a301f8f4fe0c069f3da9e5247f0e22b19f64119cb8cccaf10aada8280ce02061a4671d110ad29b08af9e23ba3c3e8c7483874c7b1c992d90b51681ca9a  exim-4.99.4.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index c72e25a2c4..60870474c4 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99.3
+EXIM_VERSION = 4.99.4
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
