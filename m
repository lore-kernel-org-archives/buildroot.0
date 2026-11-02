Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E675606A329
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d4wmRDi7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6vEMxCc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F4F60703;
	Mon,  2 Nov 2026 13:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spAhDWe7Lr0d; Mon,  2 Nov 2026 13:16:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3125960776
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793625382;
	b=d7FAbzCJmylx0lwmzunLmZWQo4Uzkuo/wmVixP4aLX7HUbHtMMF5H0WITy3VW2ZOMJ2t
	 Q7tH355er3HIhye7PfQp63t2QF1ckF1qVxvCuUTCfNrKCdqOO2uazwPKdfSfQHn0w4Yjf
	 lYyU6Vr/Jgjr4/WbKz8NQI4jT+lyBeT0P51tVvCI7Q7HNQLGHHwQBSSWv1q2/7S/l67Xy
	 +SIZRQYBZ2ZSAeXGQqzhNww/zfMXC28rUe0WF7fx80CRcJ6cBrBqe1MU41Nf755129rsy
	 YTd4oAhtgFI1LTWZVE1jVd9bTJbhbd+DtF1zJp4AC2xoTea0IPlI4LLjVu9D4wBQqPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793625382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=w9HEM6QDlQAjayj0gunKiTOvExbfDBJAu5HuD0MEByc=;
	b=GsurhgV1QhX0Tu0F+VP7Pte8vCO/oAfoH6nc4quhmjn55LfgyHcCEyVMH5QgtgQZqKyd
	 WsY/bPdEM8+dJiWry+3zHI9/ndWLnQJG1EBQjcl7exbwefZ/Naiy81ViHG7PnVVZXHLYO
	 EWUYgfis/vo1eU7t0rMCx8CHN2hCZiV7r+uMxe5+UY4FO5jflOpRZl5Z9T5Piqp0RWCmI
	 4fuNGSjCib+iAJtu/6ddRue+hzufdmgGvm0xHxwHwGaiGglSZ5vetqZgYC5RYbIQ5tYwG
	 HSir/QdnPpY8kX7O+dw2NfpnSq0QkfTdMxCMZqMhTcuHfzVi4Dx1BRsGO1/Gkq4QPzQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6vEMxCc;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793625382;
	bh=w9HEM6QDlQAjayj0gunKiTOvExbfDBJAu5HuD0MEByc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4wmRDi7ZlLjEGN212T6S9eSIKXQSHcBLquZoQvE5cF9mndr2tCUVFZUTSSJLnIof
	 hslqvInvKNs8Xh4TcaB6Tr1qvyp2uVU/xrwWdECkaLgE1u2+RfYal9W5UYAA1hBOVB
	 DyWpuCk8qDWgoi9JYTVAEjq9Q+5oQ5PdqPEgxXZknwAYfhjQ6idE1+AuujYr4/9v4x
	 6BfnoRDM6TNcSUdPkTSyHlaR7POS0HFuHn5ax97ON8htAyCdAZ6sA/DysMAcVLd0/S
	 1wIViX6uM7UsFsuiJBqVGMIJ5HZPFTkaDbWw47fahrDGOFBzwauTEhzGgXFAmD4aYA
	 LAC7KEsRna8dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3125960776;
	Mon,  2 Nov 2026 13:16:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A284B4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 942D0606D0
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSZS039bEIFN for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A1E8B60661
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793625378;
 b=USuCEjBCYB+XA7FbMMGVhr36WueWWM9B/p29AEZZ7zSDCR0jz3IyObBEcyt3b9HXLalY
 VK59B+uhs/9/7KI9KdKlyaD+Mvm3bgdD2AB3lvttt4PrQivPUTqJPlk1kIS4xwpI0Fnwz
 C0cUxJxn8Rw1ZHrCuIaN6/zQpTFqhVHGqVDhpjzfXrHhrzTqghrfkhJixzuSkd4qzuIim
 yR7/ceK1/5/HxNxk2TLFypWzkmbjc+26oOhQK6PgjdeBC7AU1tdW5T1dABu8LCesDniwn
 Abz00bKnT7Q8JrJKA2MO2BQ7jjCsGNFBU1dnNYStKtHefLJxjfBSBqTtP+U/9oc8d6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793625378;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=bO2x7jEn8q6tfeUdkihSMQ63TeW+lHCL4Ck5QsWNrhg=;
 b=JLoL9rCfthKS99o9cjVUJMqo6nrre+E2LOXkPAB98S+/x9d0jzG/u0P9YhobpVoq1x5e
 xsUJDtcNYv55OJqOPOlQ3VKlqOR4TiLlZGR7o8sHsTBSUUtCZLDgDeZqV264vEKTmEX5m
 v7h9rcAclF66pmbi8T6AFcP9o+ThOtGrmTthsoH2UjDqEn/b/kQmz3YW5I0S7Pqg22SfH
 fuy906DZeoftBqFVes23Ftj3HMIF0zNyw96V2psPrTwOXEkhCWBn7U6c6w4EoYDRAAX6i
 ou/0j/aeOFsyjTGvVhFYlVeOHIWJqYkFYii0La3aKELBjqXSmqFFpEmM8QlZLfKlLmw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=W6vEMxCc; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=W6vEMxCc
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1E8B60661
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so39217765e9.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 05:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793625374; x=1794230174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bO2x7jEn8q6tfeUdkihSMQ63TeW+lHCL4Ck5QsWNrhg=;
 b=W6vEMxCcsGc9IUrlHwcAuMdFkTOxxeTRLXSZ4T/+bgTYs+8kEfE8kKHdmNj1W1JYlv
 ABozPUFIaVHVuXPymq6DZtmbWdIaxInV7WdmaiPlsQ2GNCbmv8IBq+lsnKDUajxrNf/b
 OSKgLTn0u0t6KisZzsMrZ3eDaL79Tz6qcRNc1vS+W+S//xe5ILTuGosuvKPb38MXx5oA
 GeAXFnR4EFsK+DCG2+rKOzGAg/JglnPfWLX8hRa4hWqK6pgqHpKNEpkxAFKR16Cix+WS
 VdzpnIJ0rUuruNJftLB7mulOCm8zlelnRxiTyX9V8BnF3pnzYVogj1cZO05PgskgbaYo
 VYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793625374; x=1794230174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bO2x7jEn8q6tfeUdkihSMQ63TeW+lHCL4Ck5QsWNrhg=;
 b=R2DPTmV0YxpkOvr/FfxSZ/N26kVr1u9GvviCaMNnHl0BP4DQ/giJh/CfJbLbwriRxH
 awxLDPtn2Qds5lNPUZ3mceY5O2FV3TUUMyHlv3RcErctbPpfcjNcH2h7OGCtm2wChic4
 PjIgCt3HknuDxFSpNrCbUGddG3NC10FEZ1jhM8aaC1eDvwwe46mCGiso0Es9uVOfaPlq
 pYeffuGKW8tVbhJLZRumZGN+htAC4l/a+4+502zfk2x3rj9gpnfXh0bBe6uDt4pzRQF/
 EQPgaqRpbdipnmzEBCbDbfr8G9LRSXaDoIfH9XYYK9tZtaHyeg6ej9GGMkFWC72kTXZn
 rfCA==
X-Gm-Message-State: AFq9FYLuHrItxQ0NOEASWdnKI8GqZSTOcdRyumkWxptucF+WmTXXe6rB
 rxbGh9LEO/0qvkGsK2IMJcLph6lD21du8QKJNxm8KqK9kx2TvhzCnY6dIgNkXQ==
X-Gm-Gg: AYBFou1LzCFE2H6+hTso14w0xwBjHpoGZJNc+kG8qFpyVH9zEi1VJlg+UPUESkVM6qJ
 U/8nHqi4SyCg4GmS4SrcqRr07+i/AgjxI/2lVYfyZWW+1gVX+7nIO9G7QUu9g63adEKG/PT0mIp
 qMzW2JhIvRDTMWnl/ngu2Hj6qIonDUh0JEwfVBa6qpC1MaiCH/htExvViYBtS1tY7iozBRoCtAq
 qwikOTAfNlKXVT0aBkMRMeUUCHH0aq8s3EtJ+zpTilJAjTjmbK9Je1/ev4lWMr4+jiXP1pgJs6Q
 /gO+fj9/l17iLkb4mE5FannTqmIL5zQ1m/qEvxR7U6K702ycDjxhhIELFvDq8WLiVeAF1CbKt15
 MJYOXNFH7EbGGBjz7q5af1cpmTkeDKL4qqi+JetW+t0BkGYI0j7KwtxkN3EcPNR5xlZJXeC+e5y
 ry4RnbiES6zdEm95SJCw0A1vnczc0kQENBX2frGzXuxlLQn0senZGo/J9ZceYOS2t1v4F2+CkRd
 b7R4LHRSsUK4+JIE5n7tsvTaLHCD+Ks5eGGB70QuaSwq4nRAxRHUAmFMMG5e5jjYEPH3Zyrs6hK
 PNBn5lXdfS1CXeVbJ0NXOhsA4d1THv4oMsWehnNB5fjAAKxlNhkrTg==
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4ac1793e81cmr245382055e9.13.1793625374117; 
 Mon, 02 Nov 2026 05:16:14 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa81a896ecsm361313165e9.9.2026.11.02.05.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 05:16:13 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 14:16:07 +0100
Message-Id: <20261102131610.141568-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
References: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] configs/sipeed_lichee_rv*: use OpenSBI 1.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 configs/sipeed_lichee_rv_defconfig      | 2 +-
 configs/sipeed_lichee_rv_dock_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 5bddd0360e..27cc2e7dc3 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.8.1"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 4d1ec159d1..12072d790d 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.8.1"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
