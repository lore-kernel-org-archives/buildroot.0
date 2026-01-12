Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47B1CF45BD
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C3CD60BD6;
	Mon, 12 Jan 2026 17:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3V4OKro_KDd; Mon, 12 Jan 2026 17:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C0D860BB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240331;
	bh=a4vtP+O7k5jTib1pSwuBDf1fD5MAS29JlyeW1SL4P/0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lTooBHbY1Aq/1fWwIKskONWQ/4uDNhStN17W5xoYjXq0qjoS//jndI/dPbIQwL2hE
	 dbHhq2g6wzAnw9tsAP819noHGDvuB5Z96L5dTandy/ROguw8I+G270eTTVjKvNgyuQ
	 3UMCIod7qWLA/M5nII8mSLK40c6qm+uCL4zZyx/XnCl3+MZ4cHvZ6q7CCqmdpTzX5t
	 3No65qoPN5xs5oFT8S79JY2wt3qbT/c8mfXnJCTeIz8ptbHFQTXI7CdjA/Ny4FEXWt
	 7WQKpTT6HGhSFeURp/7tN+6Xs6/5qQEf1E0oUNhA9Sg/xNYP6mpX1D2gXD1HUcrx4n
	 Ty/ZoWmXI7TPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C0D860BB5;
	Mon, 12 Jan 2026 17:52:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12BC1231
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA47340D90
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wj0w2mhwrM8N for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27E6040D8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E6040D8E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:52:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16C8988512; Mon, 12 Jan 2026 17:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 18:51:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17f7cd9c5529e3f7876c16b5abc7b0c07b594daf
X-Git-Newrev: ae81440dd0114a39bfb768ce6ff32349934f16e3
X-Patchwork-Hint: ignore
Message-Id: <20260112175208.16C8988512@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: bump to version 3.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae81440dd0114a39bfb768ce6ff32349934f16e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/postgis/postgis/blob/3.6.1/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Julien: fix change log url]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 2d205ff5b4..e70d0e43eb 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8caffef4b457ed70d5328bf4e5a21f9306b06c271662e03e1a65d30090e5f25f  postgis-3.6.0.tar.gz
+sha256  ec0cfaab475630106211d180d71df46782e41e10b6dffe91d79ca818ecd2cbb4  postgis-3.6.1.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index a3a2756593..d5c8fc80be 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.6.0
+POSTGIS_VERSION = 3.6.1
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
