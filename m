Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C476C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 15:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49ABE41ABF;
	Fri, 27 Jun 2025 15:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGMAym-gb3jU; Fri, 27 Jun 2025 15:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A76041B2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A76041B2F;
	Fri, 27 Jun 2025 15:36:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E071B11A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C69DD61232
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziOX1kLgWKWo for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 15:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 509DD60BEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 509DD60BEF
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 509DD60BEF
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:36:30 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id VB7ruBRvCzKH1VB7suON7K; Fri, 27 Jun 2025 17:36:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Jun 2025 17:36:27 +0200
Message-Id: <20250627153627.1461751-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <e588cb906285e712ff53b179c01b3621@free.fr>
References: <e588cb906285e712ff53b179c01b3621@free.fr>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAmWODapfPNTWI152AH69uVwwZ007842qZ3nKCxCyFmZ2SDXK891kbLoLyPb9R3GdIOU/rn6DVFvvTIe/cVHqa7i2JWNDg7E6z9diy6A0gaWHW/oWYhi
 /txFqGPLbON8ZNg6M0aPiNCNV/HLbc7GORnUumvW9okQQB1m3Z4SCwBiqJ8tB8ppvKVM2rk+1BWNnjt0Jjenvr3NxtboyxP0P212wsYuvKYsj1MhwgLdeSuy
 E8Nj/ov3HFdWWPQmCn2GhWFwDG7nwQno3fkZgGXhKLYwrp0WwtK+8pTCDPx9iPK3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751038588; bh=KHKCB7haPo7ZvTeT12WuYZdI0rfoY4VTdkHrb9pSe68=;
 h=From:To:Subject:Date:MIME-Version;
 b=kkxfwTgBqGowL03f2l40PVY2THB3tvWVc/NNNTPDeim0ZZe8pzeo7AOcwjwdklSmm
 Bges/ZqigmtICKYP3aAjkYnJGztfxK+/CnOACZ8Y5Ee46Vj+XehU72L9Lzq4YwqpXB
 6XGTRCypH6g6yzoUdycJZYQ5yG1ycMJ0w9oYxL98WeUQCnEvYzvRdz+agIue8SGyX0
 SVoSUf7LDlK/LqebsMIQp4jhYVGWwKp+NWFXUKGavvJG4SG/007cuGFEeE3lHlsETQ
 Vl7Rt1JxyDrNz6CvFXWRolVwHiKO9ph/pcwM8I2+qUeey8l+O2wCNd/27/TO68cT/J
 3sGM5A3m2XkhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kkxfwTgB
Subject: [Buildroot] [PATCH v2] board/freescale/mxs: fix Linux booting
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
for mxc as well as basename in front of $dt.dtb to remove possible
useless folders present in the dts path. Let's also add set -e at the
top of the script to make it more verbose on error and modify this
section according to spellcheck as done for mxc.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* rework by following mxc version for error 'sed: -e expression #1, char 17: unknown option to `s''
  and wrong additional .dtb path as pointed by Julien Olivain
---
 board/freescale/common/mxs/post-image.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/board/freescale/common/mxs/post-image.sh b/board/freescale/common/mxs/post-image.sh
index 0bfb835c6e..56960eb634 100755
--- a/board/freescale/common/mxs/post-image.sh
+++ b/board/freescale/common/mxs/post-image.sh
@@ -1,5 +1,7 @@
 #!/usr/bin/env bash
 
+set -e
+
 #
 # dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
 # in ${BR_CONFIG}, then prints the corresponding list of file names for the
@@ -7,11 +9,13 @@
 #
 dtb_list()
 {
-	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+        local DTB_LIST
+
+        DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' "${BR2_CONFIG}")"
 
-	for dt in $DTB_LIST; do
-		echo -n "\"$dt.dtb\", "
-	done
+        for dt in $DTB_LIST; do
+                echo -n "\"$(basename "${dt}").dtb\", "
+        done
 }
 
 #
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
