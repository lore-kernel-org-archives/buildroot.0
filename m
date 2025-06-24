Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0398C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 20:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E4F40C79;
	Tue, 24 Jun 2025 20:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPFubwppFhAY; Tue, 24 Jun 2025 20:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD7DA409F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD7DA409F2;
	Tue, 24 Jun 2025 20:46:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BFF2154
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 20:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E22160768
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 20:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRxA5d6cmhcI for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 20:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.72;
 helo=smtpcmd0872.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CB9E60073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB9E60073
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CB9E60073
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 20:46:07 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UAWruVUScyJfSUAWrubSuC; Tue, 24 Jun 2025 22:46:05 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Jun 2025 22:46:04 +0200
Message-Id: <20250624204604.2199246-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCCdXGnkDIKiDe47QBJ4dNXkeA2LL8iLALUpjhPG0VPEy7WQ5gIpPI0uGStGVROKFQSdYFLjvIBGs+yzS/BWZby0EOL4UoNo41SYeyzlGO/7gOPyUfQb
 KxkVj+Q5IWc6shbs48GxZKhWVyeff4DJW04dPQk5frZpUEpTGGyqVHjv49gB9BQrGCe80h+VbhMWHLhhPA3ksm0VMqDSLndnDm0JwY3RIbwhB0dVNlBOklhy
 ylTSpGrjShKESlzi/pH06tFxjElSBx0QyS7Xw4QmF0Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1750797965; bh=qzYasvZcWtJ7PbtAWJE3uML5b02BSmPwwfxzIaOGXT4=;
 h=From:To:Subject:Date:MIME-Version;
 b=mPc8Y17yuegOoRCF/9sOCYP3O0X+vLrUod2ZiNRKdDWLUHBz49VWg9XVnaviEbAEk
 Cepjj5eWrtd5sdNST3mn4eQB+LzkT8SXAoJotXNZe0GMfWXSyjLzJpxScjeOzOpgzs
 7Uaqd4HRZ6ee9iFbVonDVXMCobN6f1gGOtUWiaiyGOM/HEqfWja9afoGCt6x8skyU9
 QLHHnx1xiKgFhNZmdxGAokJSVSieXsoBNTftXNAfvRFO+yNf6IpG5P/ycsA0jHS8kh
 Wfid3p0CCcB7qX0HHeXeqMi43+7cAOoY5T1wrmxZSmmglMb3kZLdyb9lNmgpWIuSSX
 UloOGxfruiJBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=mPc8Y17y
Subject: [Buildroot] [PATCH] board/freescale/mxs: fix Linux booting
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

Actually DTB_LIST accepts only file and not files with relative path
preprended. This leads to have vfat without .dtb files and so Linux
doesn't start. Let's fix this by including slash in sed command as done
for mxc.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/freescale/common/mxs/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/mxs/post-image.sh b/board/freescale/common/mxs/post-image.sh
index 0bfb835c6e..65154fa8e0 100755
--- a/board/freescale/common/mxs/post-image.sh
+++ b/board/freescale/common/mxs/post-image.sh
@@ -7,7 +7,7 @@
 #
 dtb_list()
 {
-	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
 
 	for dt in $DTB_LIST; do
 		echo -n "\"$dt.dtb\", "
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
