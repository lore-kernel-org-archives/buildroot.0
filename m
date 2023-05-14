Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C796CC77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 23:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FF61403A5;
	Sun, 14 May 2023 23:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FF61403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cz_1L4KpuF_4; Sun, 14 May 2023 23:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 780964015E;
	Sun, 14 May 2023 23:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 780964015E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80B471BF21A
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 23:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59E7E81ED4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 23:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E7E81ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kmi7xUurhe6 for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 23:59:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC3081ED0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DC3081ED0
 for <buildroot@buildroot.org>; Sun, 14 May 2023 23:59:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4C3361782;
 Sun, 14 May 2023 23:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFC9C433EF;
 Sun, 14 May 2023 23:59:15 +0000 (UTC)
From: Damien Le Moal <dlemoal@kernel.org>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 May 2023 08:59:14 +0900
Message-Id: <20230514235914.434681-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1684108756;
 bh=LbGhwZKVo+EFYr1ssqgvOEToeWSjSzwYxzEzvEC7f88=;
 h=From:To:Cc:Subject:Date:From;
 b=b9us1zSx3sdh8I/SyrXpiRmaismfNx0Ggxcc3FUX7k8Dny49R52IZH3kNjSf76KNe
 vZelQVn4NSIWEOXylWjabjintssmVUXsC4roumv4JTumeaeFfpB4cc6yqH5cGSrLMq
 hVlg3zLU4k4SkFaz1cDnatXzE14STgWU2qKJJ43+Ba+vZQmslyKQtGFZPsxyL/AG8p
 cQ+m/5zkzHkqAwky3KATFsUf8bqFTQnemBxx/sizV1bmbviqGZ+xtle7Ht8tXqnH6d
 NKZwIcoxpmYuwonNs3htYKqR/KQD1fp0VahAtyYLrsNpZdoXYtmjq6q+rg8iFe7rKT
 giCBoa6JOZt0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=b9us1zSx
Subject: [Buildroot] [PATCH] DEVELOPERS: Update email address
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change my email address to dlemoal@kernel.org.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fef008f84b..e76717e845 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -662,7 +662,7 @@ N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
 F:	package/log4cpp/
 
-N:	Damien Le Moal <damien.lemoal@wdc.com>
+N:	Damien Le Moal <dlemoal@kernel.org>
 F:	package/python-kflash/
 F:	board/canaan/
 F:	configs/canaan_kd233_defconfig
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
