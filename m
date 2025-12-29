Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949EAE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA648177C;
	Mon, 29 Dec 2025 10:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQAALpeo8ym9; Mon, 29 Dec 2025 10:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A6B28174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767003934;
	bh=mLnDmZsKVoIdfkiupawjulvYQwIj0ny0nEwCt6ilFcA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pNSViQycyKA7oZiIN28MovG6t+AfAUTWkwGBW7MDuGO4ZC4S1moWeZEU0MFmvPjba
	 EtZJrkcfJ+PonsMBPkVrmhAxKjkjuMa2wszd5olt72ae43PlygjmWA41rtCE44VOfi
	 Y9qsvUEsMOnDF1atlY73mrad0PpCLsKFceL/CFnIAyzH2aJ6hRz1uKol3ksYgnD23s
	 +pckJLKKz7woLTGQCSFdrNTuGk8eir/gPL038sZIznJ5XWoOYkV3nPRI2q+viHxuAf
	 Kzwrw5WKFt/McFDhQ+YTZkpQsRejVV7oy3nCkOWHqNUWBSaN/mkq1mFRtjLSQex/Td
	 VKZYnSy1hQExQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6B28174D;
	Mon, 29 Dec 2025 10:25:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C347D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DBF640764
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWjU9dkz2ako for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5932840754
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5932840754
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:25:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A30487A32; Mon, 29 Dec 2025 10:25:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 11:24:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8b9a50a0e6579abacdacdb920cfbde26347f5f9
X-Git-Newrev: 6aa2e0e655ac765493f454d305f41e2161134bd9
X-Patchwork-Hint: ignore
Message-Id: <20251229102532.4A30487A32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectl: bump to version 4.3.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6aa2e0e655ac765493f454d305f41e2161134bd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/sharkcz/collectl/releases

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/collectl/collectl.hash | 2 +-
 package/collectl/collectl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
index 6714e2afcc..dbeee28af3 100644
--- a/package/collectl/collectl.hash
+++ b/package/collectl/collectl.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  552bdbe9e97071767bf0871789e19ede7d2827b68824e75da9cd7664218ea440  collectl-4.3.2.tar.gz
+sha256  f28eb87c21518801cd6cb3cd95cd2948a7dff80f9cb2216a1122cfc535f03639  collectl-4.3.20.1.tar.gz
 sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
 sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
index 358f8e3cb6..429bb694ae 100644
--- a/package/collectl/collectl.mk
+++ b/package/collectl/collectl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTL_VERSION = 4.3.2
+COLLECTL_VERSION = 4.3.20.1
 COLLECTL_SITE = $(call github,sharkcz,collectl,$(COLLECTL_VERSION))
 COLLECTL_LICENSE = Artistic or GPL-2.0
 COLLECTL_LICENSE_FILES = COPYING ARTISTIC GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
