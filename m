Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35E2C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 15:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A813E419DA;
	Fri, 27 Jun 2025 15:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1a4MG24c1tX; Fri, 27 Jun 2025 15:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A27419DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A27419DF;
	Fri, 27 Jun 2025 15:35:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BF7311A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5965780D92
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-6RJJw2WW6O for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 15:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56E5280CCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E5280CCF
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56E5280CCF
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:35:48 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id VB7BuBRBizKH1VB7CuOMjo; Fri, 27 Jun 2025 17:35:46 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Jun 2025 17:35:45 +0200
Message-Id: <20250627153545.1461396-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKMYw96+05YcBNM/IT0JwN68prEmBSynr+BFp/OvaXV+I67nv36S7goXl7OY3niMSkG0jAXjT9NJa0JWSSPzkSv5nkkzYq6LxZMcoM6+nRFoXXgj8F5K
 l5A+r6GOkk9IjHl8/fN7F9vZEhqdBwpFAXB92YOPq+P5FYSiIgqTpIcIcmbBLjqiRuXD8xBKCObU4d3p/akDL9yO4ETZOScPf/5F+3dkT8BHVqTeI8jM3P0f
 x99goikZQSaG1EEmG3m2YVYblsVaeLsNi4G7l1+PHxE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751038546; bh=ZK7TkHCuDR8dBx8S0YEfjnm5jUjwjAqsvMWtql2+A+M=;
 h=From:To:Subject:Date:MIME-Version;
 b=aa/o6e/NUJe9lGS2zgOB9wQO9bRTw6RcF/ACfzLMHDRlSWJRqpq9T9oV2+AQnz1Sc
 9h8OD5GaQD3JPWaUprWvuxvK6fJvSu/MDR1C431Fx1R7QaTkBMCnPKLzysEQ4vGcSY
 cYX4BDCQ+G2WmnQeTsoMuPGhpTFpKhAaPrrbBsT0hS61+U6HsdWkadYzCS5WXTIPi8
 L6aDmLer3otOlr18ABpnnSkBtAnbza40nN13No7VTz27rXXT4XgXtL8QaqIbuWDb38
 dOPz96DbuYHxWytebwqAXHKaRmjRs/N3kd95aRmeXb6ZpK1Zbr9NH/1gC+xBKAGA4e
 cnvRg8VYgRWqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aa/o6e/N
Subject: [Buildroot] [PATCH] board/freescale/common/imx/post-image.sh: make
 it verbose on error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add set -e at the top of the script to make it verbose on error.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/freescale/common/imx/post-image.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index a440bfb75c..8d9bce5328 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -1,5 +1,7 @@
 #!/usr/bin/env bash
 
+set -e
+
 #
 # dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
 # in ${BR_CONFIG}, then prints the corresponding list of file names for the
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
