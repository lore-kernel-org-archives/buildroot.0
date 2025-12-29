Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C498FD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 762F040473;
	Mon, 29 Dec 2025 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLI_ruSsnKCb; Mon, 29 Dec 2025 13:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A259C404A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767016614;
	bh=u4r3TmMts6SNiqq38K4ybikNYvLSlutsb6Aqci0S4cE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FYz7GuXJfUXGCZ34QQ+LfjeQhJ6Rm6GKiPYDP8p7NSfjTqbvcHMW1DW+YijBB0dBo
	 FzBJATdrzmO2J4rKOM32KsG3OYvIIx6gng2c31ywcx3F+KgwTXmDAMvAMR2ezn5UIe
	 OIxqzunWLw1qOpnbD16hwpZhzC8QE+gpSI7o2fmb0m7hFqcZMeQsR9coB9bSfWgjMD
	 Q8iG1u1DpQmrEow0SsHt4ANMUdCUUklv3UuqearHMo83zHpCIl9P0/av79b+iXvQxx
	 seNQ803LnDKsF0XUVR3UocQOVjWvDV60Demv0QGcQLTdIzAqv5LwSTtSNV08wR26o0
	 NZyJCUlE/7dyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A259C404A8;
	Mon, 29 Dec 2025 13:56:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97FD2B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DECA60854
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBk7q4gEe8A1 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 13:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 793BA605A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 793BA605A8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 694DD87A78; Mon, 29 Dec 2025 13:56:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 14:48:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47ba1f6fb35131121d1d0840c9782d6b37788780
X-Git-Newrev: 121a740ea7e7e19135b41f24ac539d37cb37b0cc
X-Patchwork-Hint: ignore
Message-Id: <20251229135651.694DD87A78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.5.243
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

commit: https://git.buildroot.net/buildroot/commit/?id=121a740ea7e7e19135b41f24ac539d37cb37b0cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.243

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index fa691255ee..274cf8fad2 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  4eab6647c9e75e5900ee8981c80750b26493fe54d99708989c0e7ce08067484e  uuu_source-uuu_1.5.239.tar.gz
+sha256  dee3be0f337c631bf93232f5ea42440f07782ce005c9219a14731d66bbe83658  uuu_source-uuu_1.5.243.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 6ee06dab88..74e2448777 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.239
+UUU_VERSION = 1.5.243
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
