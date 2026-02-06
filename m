Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DC9EE6B66
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 21:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 688AB4059F;
	Fri,  6 Feb 2026 21:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPMZAHsIn2Lc; Fri,  6 Feb 2026 21:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7380E405B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770414988;
	bh=Z74TxRCqliajSLxOlT6lnIifaVoMCEx+e45DqX1g7fE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yyqv+03JjIQ9SRdbKGR/QkQm51cnNhyiBsOP3in7DGKG0G6sUv21uZZy+BXk77WTg
	 +mZR9RzX7cFLEi6h9Mevr7JtVxJvbGzICNH1c6oZHRv2eRjbKiS6kLVuyCv+pvrNcz
	 3wyZxbskhWE8mwDhQOmJxuwPyS1szaC1vzIl0nILw7nmbXtew6AURBiX0Qj83nP0XI
	 cTyE+Qx8NGnE+Ax+fvlVtqfhOzx2KY+NS6SqqN/K/dp09SwMzCgmMYiIXdd11xhkSK
	 kbc2Cd5P7ivlj64O2ASv581BfKLXVAzFD/xcxENG/bUbkIYyUmYCedNSFNs5NzHPRf
	 Gmf698p2xKeig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7380E405B6;
	Fri,  6 Feb 2026 21:56:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDE6173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D2864012B
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2OGT3j_NWqH for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 21:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF8B40084
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BF8B40084
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:56:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AE7386B03; Fri,  6 Feb 2026 21:56:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Feb 2026 22:55:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67b7da7d3d2f48d2d4ed252fbb42eeba10ccb492
X-Git-Newrev: d892c5afad921bc7c6a012b07c3e5c0eb9e94c84
X-Patchwork-Hint: ignore
Message-Id: <20260206215625.7AE7386B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: bump version to 10.5.1
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
Content-Type: multipart/mixed; boundary="===============0096804179911960816=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0096804179911960816==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d892c5afad921bc7c6a012b07c3e5c0eb9e94c84
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/FRRouting/frr/releases/tag/frr-10.5.1

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 3ba034606d..e89b5042a9 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a84b973e713349dca09e2009f33dc499564f2e9faba01c0d3cba9204802b0cd5  frr-10.5.0.tar.gz
+sha256  fcdd1d326b2ebd1cc4b607fe1681d476865371ac0028fc5595a75c00f370189e  frr-10.5.1.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index af94793bd1..4886837245 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.5.0
+FRR_VERSION = 10.5.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \

--===============0096804179911960816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0096804179911960816==--
