Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340DA606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AetB5lnX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF196065A;
	Sat, 21 Nov 2026 16:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CHgemFFaga8; Sat, 21 Nov 2026 16:51:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1DD8C60642
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795279891;
	b=pvt3ofQCTqubzvvPFktlc6ksLHOqcugRpnVMw7NbUHAQxD9774yjPXo0CCKm7cBEjSZF
	 F1r1Di5ef/KYNxF8abxbmm2ZAu37rKxgFTihPY8WZqFeymKd1NQXgMZx3RH5l8nPQwTnH
	 sXlQq888+GENcZaE4jgjrpIJxE1aGboWmsZnT6FCT+69rrSsTxf258wA+GOe7YqIF/tzn
	 Uuuv88eqnCfpY/wGNZLe3VdRzyie1+62TfS/BjGXbCzxjTqPcooOpX66u/r4RZdmez6YM
	 hb69ngP8oauslA5DkERGq/kcc0DIKfVY0ipNftjpN3rPqYaCvA251oEwiyJZJB/1lDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795279891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XnvT2TmhmFKCvMhALSyjOOYxTuWvtH4l83hE0ZwpKbw=;
	b=CIhFHUJGpXm9926R3Me1ovmaAxsOO4pJ2e4UU+FazyMy5FHfE3/gzsbMgqVl6exgHzeM
	 4zhqQ0pZpVUw+7idPv+ITDanbak/+pyZqUTGByZwuExGRJEwNXWnZ5hMuntGEeOfuBZMN
	 iqAY6jKhir1PwUaWcpApfVkN+QZm+T2bTg5AwvK6U9INhG0BiNNPTwSqbnnxg3T/y7ob5
	 t5sKg9HngIa54Px387JC9x+/9IZ9rGXXVRcXN7pTgewlMBVuvrr9oT+I5xBsO5Fn02kKx
	 ok7kpczlzfKDk8snPlPQpit//gIFWmREehvI9N7msDrlj9DwyGYGQDGJS+oEQBL6n8Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795279891;
	bh=XnvT2TmhmFKCvMhALSyjOOYxTuWvtH4l83hE0ZwpKbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=AetB5lnXtOAcu/fwQdpbV8pyEIAuQtijj5FFExPri9sWCfeVb605bNf+i8WlXtuDn
	 FULUfnu8mfvR7RMbCl1HYs5u9s7XynCc0kEPC1G83T2hSc4ofrkB27aUDWAGrdelQF
	 w1cr+5brlWimLKj1lYrlGq33HcI17PUR7xNEQ2AN0spptzRwUb9krGAbBCqdxUs16s
	 NmAZW3ZK7C5yBuPrmPxurm87LAgocnnasE3poDGxLoNGRDfIfvgI9gCAs6G9MnfzD/
	 QZxc8pas2Va/3vPiyqdeuDW2juvdm1+dAkKK96HGy102IRA5R8OPZQOma4Yh8m1t3z
	 ncD7rgT96WCzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD8C60642;
	Sat, 21 Nov 2026 16:51:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 255D415D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 231EE4009D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egcuhJ4__v0O for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 16:51:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9C10340012
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C10340012
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:51:27 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795279885; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:IME9q5iPhk7SR4VCl3svPGNobLax
 yZF1kKvH6IgjAk1BtVM4qUcfxsc1djU+Xet6c21Yy4hA1LCNw5ZM7Y72pmDcRmyguDCeJNOGONB
 9ea57C//rceBu6n/9zCnNlp0FyoaHNE/u/UAHzVfkAegcrnORW/Wa38gCRYdUor6fPrLXlIBEPw
 NLuh8AoOU7r+2qjN3vQAWuxiWTLSN4GI1aBxqwmu1qgVuTIST5KWcCc/DYm8zhfaXEn95Y6WosA
 kRlgeg+OVylqqeY5i3wnG02nX3gXU2YwrEAyLaZlJTeXoy4UAzs3pzcrIlPY7bZW/lkVAHa1iIL
 /K16zwQ3HQkr8A==;
Message-Instance: m=1; h=sha256: yeWTKFYoefDZmHgOv5ylGr6efh8gn4ZJrgTJD06b1kU=:
 5wnvc/vX52zOBBPvwb2t884rAcX121yzYu8uQx7hlok=, sha512:
 nxpcMDjVRGwMJDscwAVyuA+zNdt99foRM14lduGpqijF798GZkIc6yNQ/s9ke6hmzbZp5cvCIRZoxID8Fn6QoA==:
 LNFPDLplfqrQNb4ubM4HS6aADMfhCweWcHX7LcRhpPww/EuwcKyYJlxABIVPC9tQ/yksY+mdaOHCzY26ICJbAQ==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1xrqyV2WvM-00Su39; Sat, 21
 Nov 2026 17:51:23 +0100
To: buildroot@buildroot.org
Date: Sat, 21 Nov 2026 17:51:14 +0100
Message-ID: <20261121165114.964464-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PagFDfwTzuhChmhqZc2wDDC48K3G1ZDcaHBwTbKDlW7JOwkqtqn
 hTZz7MXteJRXe3oWHVaURnRCoAxoSntNLB+KYfPxo37X+zAqlBc6dDGHRd7a/TRCKs6gGL/
 CpmfsPvbIdwCQsGtNfiE6QPpOzEy3ixd/2J2ja8yg5CMmL9gDPqcmi1wC/FpbarIpot99pd
 GkovmWPL/uf/cc3emBsHQ==
UI-OutboundReport: notjunk:1;M01:P0:NgsF0enZVj4=;UqTf8dw4PwHugNILcvZ+xW2zNr1
 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
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix documentation URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The official documentation domain is docs.u-boot-project.org, see
upstream commit 7c419d4b578492e9781d4d7e755809c78c2c3661 "global:
Update URL for U-Boot project" [1].

[1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/7c419d4b578492e9781d4d7e755809c78c2c3661

Fixes: 5ada3a14425e5c5b8ecf120924b7014f80fa9ef1 "package/uboot-tools: fix download URL"

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
There was some quarrel over u-boot.org, but I can't find details
publicly. There is a disclaimer on https://u-boot.org/ that it is
*not* the official domain, though.

 package/uboot-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index c765cb6ff7..c99ab9825e 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_UBOOT_TOOLS
 	help
 	  Companion tools for Das U-Boot bootloader.
 
-	  https://docs.u-boot.org/en/latest/
+	  https://docs.u-boot-project.org/en/latest/
 
 if BR2_PACKAGE_UBOOT_TOOLS
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
