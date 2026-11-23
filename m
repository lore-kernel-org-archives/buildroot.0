Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0713A606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kngw6FOL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3CCB4067C;
	Mon, 23 Nov 2026 09:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBhdTRDkKsVg; Mon, 23 Nov 2026 09:16:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E7EED40674
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795425405;
	b=g1FpjLHC9s8Ld7SwRPHPxki7lE4Zk8j3SS/P+gTjnHppfNFrpFKcZa3srUhBrjQjN1p8
	 9qOdOkKAJ66/ITAfobk0LB6LPqqSPpQsNtF4OCxY9icG4E19xFbah0QbmwSdZG+sbueyN
	 6oU8yQ+r46vizw9rV0Kf5eMciYU4ydYD9wooFlMKkBXKvr6XsenylGQ/Vmu0CiPJ3MKUm
	 iIWir3BVJ1rzDBJ7xwonK0HB1eiIo/g+U4s+OAfU2TjkwwjhSims1Pd9hLaQQGzy0BWQL
	 rjYIpsj7cMYIVL2dLyzmvo9YGua2LgC+XFjpgEq7sUUGqKE+FQHIPkh67JZ0NJ9DypQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795425405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A5JRG5cJqPu1NxpoUwgtXNHc8kDFE23ob2lP84QmihU=;
	b=NoCpZ3Fdb8oQtmnKZ/UO5rNX+5xLtAOTm0ss4ylgagMLGdTn3bFCIXZK6yROu1SfkkUo
	 r+pqeTQdDufBAcSoZNZ9uZoVD6ih+5r2tW+h6hE5Ggwn36KyA0jF0l1l8OoTftSdJZAYO
	 GbujR3XpAMVbO2Ym3tbig4zjsdeqFfn+YPTHbNsAyT7arOm3KX1Ok3ZlNFdJt+MVOOljL
	 iTCPWmnZF3QIxtz3FdIXww4V64uBd+xz/wtPoaVm6jtMTz6tdRxHE2U+TSC69sWgZKFTY
	 XCmEiMUrI6flUHdC0Q9uXDyQyAM2FsaqYoFdilBnF0xtSOu4RtFQx66Kb1vMlNs9olg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795425405;
	bh=A5JRG5cJqPu1NxpoUwgtXNHc8kDFE23ob2lP84QmihU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Kngw6FOLZyPRYrUnr+B+S1XJLrcr7OLWCpCWZUgwD93iR5YLVDbPFrPYDX6JN18k3
	 l2fjxTOE3NR4FGSne6uEna3mYJpSmSeFpfzXT9FuBJyf5jTy6xGVdNLkU4MjDa244p
	 tx5TXjEACSzjXGYwozy8JkglMIwY5oedFZAxPsO31idoxsmO9J41crN7VMlh1Tl2z9
	 2rCwpVuPbwB2NpPEMiTHKKyUT/amf78uVRdRqZy+GlggBrJRh3+UeihukyyaislFk5
	 /oCGDyhtwwyFLbPoRgbCDkblzjAPkZAYF6JfYprJBSsL3lzizqpTalwrP+lLMitXe2
	 RrewpYATgwKpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7EED40674;
	Mon, 23 Nov 2026 09:16:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58E9D260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D81580D8A
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cs0n70qBCtN5 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:16:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F249A80D8F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F249A80D8F
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:16:40 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795425397; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:qCuYHR71/euDUalvEb0nMcgiNJli
 3RqM6lwy5HibRKtqNgemqoZ04CpYXdfAP10CISuEdQQFmYPjWkNVr/ue+ymQqVwPXs9rF6xOeLo
 ASG6c5i79YiCOTrfXMAfGqfoAKBdBb7Sf1iN2SyHeXD/31EfI38rWVg2KTzkM0G8mQ9V2mJBzpz
 5ZNK731WZgwwslN+Q/FALriF0YQ9/lW+jj1skJa2MEBBufpLGZWEGT/aMZ16iguon7XuaCeqtuX
 rFLTzqI5kBfV3+G/He0X40a/MecnTRO8TYmZbIw/62V6k/hiIZWWxQi1XWznsaVxnEjGLXAYhtQ
 1qIKaYMjEStALg==;
Message-Instance: m=1; h=sha256: sW19Pq+4RyL+HXstV1oCzHMePdmO0NVOeQrFaKFBjzI=:
 1UsKAMhVRYq7jBVEo8mzhA3DNTUIL6pE51EFrm88JKE=, sha512:
 gQ1QhtAJXXts/HEuhTXAtHHNH00FqzNWcIeMr6UBUAYawbtwp8CTzFIIEJ98w9pYYiuR2X4pcTwkRQxoSGl9vw==:
 h0QLlOcUvRIdEZsnEKCdfQmQ3/1VdO5H4Kb326aNSbSuZpMalPNLAt1ULv1xfMs/WjjsmI+meDA7nI/lLyuOvg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1xUrvp1PZm-007CtX; Mon, 23
 Nov 2026 10:16:35 +0100
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 10:16:24 +0100
Message-ID: <20261123091624.1331936-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123091624.1331936-1-fiona.klute@gmx.de>
References: <20261123091624.1331936-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0SCVXnfOzTvjUfNP92cM9ietBFRyyQPSiwHmsH5ZPsQtSswuI3D
 7CBseJJjYkftcf81okRvu94HLBXw4+Js2A9Rbeh5soukQhqAbBbR+D2RRjUUIWXzJ10K4mZ
 wfefNJCpPeTdZoV43lKFmy6S5fLoFdn53iBL1jBz5mVzVS5fpeln3M7Hw5+rxINHGcQKcQ0
 jWfoX/XcpPD+HO5ykzjgg==
UI-OutboundReport: notjunk:1;M01:P0:SApjZOzrcWk=;fz3Yk04iPZSlo+HU7qoTF87ibdP
 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
 sr280ylXyNhCOvzTtCw==
Subject: [Buildroot] [PATCH 2/2] board/visionfive2: point at official U-Boot
 documentation
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The official U-Boot domain is u-boot-project.org, not u-boot.org.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 board/visionfive2/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
index 718494e33e..947ba8af53 100644
--- a/board/visionfive2/readme.txt
+++ b/board/visionfive2/readme.txt
@@ -56,4 +56,4 @@ SD card is no longer supported on this board. In this configuration, the
 bootloader is loaded from SPI NOR flash, while the SD card contains the
 Linux kernel, device trees and root filesystem.
 
-https://docs.u-boot.org/en/v2026.07/board/starfive/visionfive2.html#zero-stage-program-loader
+https://docs.u-boot-project.org/en/v2026.07/board/starfive/visionfive2.html#zero-stage-program-loader
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
