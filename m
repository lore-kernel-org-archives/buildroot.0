Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EF8C48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 10:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F122383D5B;
	Sat, 10 Feb 2024 10:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vsrh0dZq3_bG; Sat, 10 Feb 2024 10:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 086C883D5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 086C883D5C;
	Sat, 10 Feb 2024 10:09:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 677471BF5F6
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 10:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5463B83D5B
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 10:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PfnPO4-J1xCP for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 10:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CC3583D54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC3583D54
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CC3583D54
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 10:09:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3272813F8BA;
 Sat, 10 Feb 2024 11:09:34 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 11:09:28 +0100
Message-ID: <20240210100928.172584-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707559777;
 bh=HeraaRgkJ9kYQVcr4HlGUQgtvLHsWVyKI7zE4prABzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=aY8VogqR+PIPShajMhDrqxim8ruZ7EXACDIPfxLPiOjqFBvlg3njocFVT7UlTlV3h
 PHiL1ab1ICwLoS3X9ETMEdvYc7BC0OjRKm+8V6ur0Z9bvU76HMAcPkz9BxyQjLTv4O
 N1X5x10auyFb5QhB/XdkkUH+OjvK719+PHUFV1JvBVN9ldIR/ZtiDmXkGdo8Cn3P51
 OSq0y+VTxXgLm50ym30z5HBkDTB6iwANHVQP5sxWbkIjEAi1qBg5+CVA4gO/Yldwrh
 rWNXzJ3VpSQRvkvaTPcpAcLWV6YG2Bx3oRrImDYblI8U4sNGkC1ktcZrOrbAq2NAtg
 zKzABV46NLY/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aY8VogqR
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.02.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://ghostscript.readthedocs.io/en/gs10.02.1/News.html

For detailed history, see:
https://git.ghostscript.com/?p=ghostpdl.git;a=shortlog;h=refs/tags/ghostpdl-10.02.1

Fixes:
- CVE-2023-46751:
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-46751

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 77c8faccbe..849f6c64ba 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10020/SHA512SUMS
-sha512  c49344151063e915add55a0a842c2a645d8362a5cbca663bd07638f4bd3699a08cade37a9efe905ad5a41e014353e5e1b1268b7925e43128ad30d5b031396b71  ghostscript-10.02.0.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10021/SHA512SUMS
+sha512  ee0f754c1bd8a18428ad14eaa3ead80ff8b96275af5012e7a8384f1f10490da056eec9ae3cc791a7a13a24e16e54df5bccdd109c7d53a14534bbd7360a300b11  ghostscript-10.02.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 161521f970..da23ebbadb 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.02.0
+GHOSTSCRIPT_VERSION = 10.02.1
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
