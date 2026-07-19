Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B95DC4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 19:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 451E54052E;
	Sun, 19 Jul 2026 19:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KChIq9WDmVQ; Sun, 19 Jul 2026 19:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63FBA40533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784489317;
	bh=y6uXrlrAq0oVCog9+xjYeTGZEBqVtfqYSIeXMoaeYhE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RuoeTitHyrCLH73zjcILdPMhFIQv3tW1PaaaWFnTQDfas0+m7hdO2eoGDXhYT29UB
	 pbOHPLs8auk4FppwpGNhVxBD3OIdx4g/4/kAfppRg33HxMamd+E2H00NEPyVHje7bQ
	 G/QCMKliVVSnjATf1o85B69HPVBoGRUo1TmbjU3QIXadEBBh5tnNqP5kwSAwmTK+ME
	 s3v/B/gsRBhI1fYq29V3HgaHNVBbh3GwMi9f+ELvw9VLd0w/k6ZJoqa1XgNJWTit+S
	 VNEyZfQQNYg5MN5T0/FNgODhW1GxPgt13iRjOp1esOw//oOUFogV+mkjsABk4FXi1Y
	 4jpJqKVnNPbGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63FBA40533;
	Sun, 19 Jul 2026 19:28:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63B43282
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55A8C40135
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPIBoFIduMxt for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 864494008E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 864494008E
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3824388FB5; Sun, 19 Jul 2026 19:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 16:49:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 078011efbb3b05cee9e30476bb84b82c8bbba428
X-Git-Newrev: 3d3df8a28dc9b233d233a340f57940bd7803ee1a
X-Patchwork-Hint: ignore
Message-Id: <20260719192757.3824388FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-ddr-phy-binary: bump version
 to lf-6.18.20-2.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d3df8a28dc9b233d233a340f57940bd7803ee1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/nxp-qoriq/ddr-phy-binary/compare/lf-6.12.34-2.1.0...lf-6.18.20-2.0.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: fix archive hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash | 2 +-
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
index 6ae08a3152..94f9c999c5 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d5a5a9b7f25295e9e41c8e7c18a1986d1b59ebe519113ed6b45ede51639da92f  qoriq-ddr-phy-binary-lf-6.12.34-2.1.0.tar.gz
+sha256  4faeb92a1c63d99cdc18994beddc5916f2ac5cd853466fbc2557693bc371bf2d  qoriq-ddr-phy-binary-lf-6.18.20-2.0.0.tar.gz
 sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
index 04cedbbe00..3c39b36362 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.34-2.1.0
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.18.20-2.0.0
 QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
 QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
 QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
