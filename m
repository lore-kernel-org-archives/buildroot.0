Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59A606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BsYgHdnk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A71E4095A;
	Fri, 23 Oct 2026 13:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra8eoNrQiDWi; Fri, 23 Oct 2026 13:20:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 51F184099B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761632;
	b=czQDTQaxY/IDPeKfoXcbc2IVkW2GHMblPkqrejc4YOQrTRU2aSbu0bZux1GXdNjCXyOU
	 LaaANOTxFLTdng/b+FHB/QIDchPFhmhI/lWkS3t7431nYeIpZ8ar12Fl36oWht6E4egBz
	 7X8vLfkW227DUggUYqWQezU/SWFo3dPb4bR2FJX6EX/NEAPZwIvYRWmgOdZdx1Lj+bXHW
	 yMt16R0gF6isftWHbqd0BMD1lbPew9LqGDNcDMdAGpPx7XASyS/FTDprVygiQ+b5spt0Z
	 wIzOEnyTccc3LXar5aTVnsi+6of/PTtAiNGzrrtsTL8ij3vQ4jyn1wJK10eOwmozicQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761632;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gswE5rzaWPTuvTDmrtOTMgePL646vzT9oPDE/lx5MBA=;
	b=A7s0wye8k8BmC9sg586f9RPoTHgzoBFCOzGVtPmv3vAAWKyFP8NQP0eHT7Uhvi/vdAeK
	 6nOZrn74fHU4+hZG6moU7buww33BDFmIrs7AKE3YeZhlUVISpq542YHXsCMc3+qvMnJtc
	 bFF89NkHeh9yzzVSa2xjl/7gBMmBTkIQmEhN02MrZtqYvINwycF9IoC2YZPgxmiJxUbph
	 Dw5Gauber+p6VjIenywYwG+6N+4WoAkCwi6PxTJCNPjjlmDfVc0mtU8nHhEA/LNuAdgzt
	 41/A3wN8AQUC46vTzM/Jjd759Ra8EOEqV0X/JbqS2kXWwbAzwPEYmk10ndwddSV/93A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761632;
	bh=gswE5rzaWPTuvTDmrtOTMgePL646vzT9oPDE/lx5MBA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BsYgHdnkwXNHKD43aOh8Y26QXUC0bDeiVaILlzUGtp+I8W7EZKEnndd3/cSoDG465
	 fupqiNtSgYAOqYIx4Vyx+AvCnLrYxR46yFAXXjmZfAKr5QlIs5cp46hc8ajdkV85cn
	 1J+lyVHQp57vnMVaIHUveudvFO6nEnLJ8/wH0aiKQ0DSh1x7tIbflj7tkzbvxUQnHV
	 /N8y7BGAZbbwUskiPvrg8C8bm4wYN9icMCQSxDAg2J8LCbw+ZOoJpwo+dt1qbyvw23
	 TYlDhGu5+P4LpXKzF8tK9X7gzF1eowd2bYDCWoUFSepNMPWRVcydcV/3+dt0hBUH/c
	 YQ6PK1A0mTdLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F184099B;
	Fri, 23 Oct 2026 13:20:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2EA0356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E41B981496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qA34-KseICmr for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 194598148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761630;
 b=gM5aCqM0cSJ7aQvT3p37PHhqbV+EiEuD916g6/8CcGA8abIgG8cOU4I89scem/7oJeCH
 YZqkVOpHcq9gBwDbTtNvQEHtkodMyAHEjQZbElpC+/xvnC6w644pYoAog5Jz1LLqGVGEf
 D7xpZVMJQ0r8dIBSENy6PF1SAhxFBOLJar/ZD882aYM6KluaGCO6nUVOZnxe7FJPcSM5w
 MnM4xU6JkhjSL+mIkPff1NAHPnGdoCFlf1x9inMUYOTjaea5EMvjfKZaxm85Z8ae6cqfE
 w+AJdQg/D1n7Nl5uIt6SEFXsj5WLFq5oeaOj6QgLfHr/6/rnug46im9iF/gYgvcZHAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761630;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=gPnJXTW7inu3vR8gsF2MDOjoXT9xyphwVJ2iThqEjyw=;
 b=Uqf/wEkNlMF7a0AfaJ1G9O7oG01+TBXnRfLdHowrB7rfMm2p/U5tVVbNaDUYuZDy+JiR
 bIuTb++QBbduIEvNn1+xwWbm4XSCRWNfsdwQP9bz8fuB7h7ZAa4SYgRyg9P881am+NsAt
 MpDqx7gGi8gmJ+O56fXkUR/qldXQ1bbHtFUFuUFRrwrLV2EytJCtyLZ9Qp4Fd6ucUgGEi
 ioiGU++tSlOC2SAG/gAFoc1t529EYv2pq5cYYleX0EaYP1LY5W6pGbM18TUZctK7/mNRL
 tVTUWh/8ZG/WAmmcfC3l5oDDhSWxMJprP8Tg8G7IeWI9HX+oBc3tlDBrYAiGf+mOYDQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=G0nFBaWY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 194598148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso732767f8f.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761628; x=1793366428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gPnJXTW7inu3vR8gsF2MDOjoXT9xyphwVJ2iThqEjyw=;
 b=esSuseehCmkNbsoArTD1DlUzL4D0rV1HDBDS7QHu+UaaMh655ciloZsOcTxgzeIAUD
 VbRBapOSiyCPjWg3CR9YLak1uqA+TjIxc/dg31eNOLPkZORjGMxHjD+/c0IZUplIF07v
 okAhZe9HuRrKbfoWnM3b19TCoaOdij8rhD7lMcj9Lcz92GryVdh7SXky4lvl/WTCjyuW
 GODWDs9XVvv5AP6U6nQ2s83UMXI9OHWEfrWpROJoKJl996M0w87iW0AracpZlaPmttci
 wpFy53vo0+SzfK6Mg6Fl4gcF4huO+/+UqAtLPsdjcCGU3U1DQc+cJUTkZXPX5bH3BtXw
 1YAw==
X-Gm-Message-State: AFq9FYKDlKQQx2lLIK58zYjvLbCuY9uwTfjOenZqq9Jz36GyoUZ7zXe1
 HO7SoLP6s/IGZ2LaMyj4MoaOs33MRgglZ9bpP1R3U8hIV0UVf0ptJX3eqlQDS9Qt8jym8b6FviL
 qYsqz/vg=
X-Gm-Gg: AYBFou24CSZd7FLm1ADuXEmuw5EMgmlihyRP8bCfjL6H2rcooahjLvn4gpmx4E4rpae
 PzAW4M8eEzCPlGOR+QEtQsHpd2d5iXHOmMWQhfI/jCQ9e5F8AkuX4NqKijTjxwcg5nTHNQTEGr+
 XBs8239bq4aNIfASV82ZCD5p0lK6srRqH6urofMK+qlwUMShzfuRsTFBO/m2w5x4roLT8edPx2q
 YK+oAPx3+y5QwmbI2X9YLUJMu2Rspt29Q3VjV3vh7ksicm7vFidoET7qDag69K0NEZNOxRdmr8v
 O+NCDBcljI70u90YxoDs3AmcPSNBnfML3g73qpqNM8+PknWP6WCaipuf4xPAguZz1mapCovQ51F
 hLWwgnbUZsPel8kBfgs+iuZI/XR/Q7is+YjWJ9leM7UTRplFHwIXAi1Ta5V8f5XusSR95r8wE51
 vknRZa/sQzDR7tlO+wES+LzhtLFc1VhMsyHOah+HWCgrAbPMUYFd3ujWqGBNKCOCF7bEKA26W1+
 RAcNpS34pL30EcnnAkNpB6yl+0L5vACkbLj8S3d1x+z0WTSx6DBNWg2Zw==
X-Received: by 2002:a05:6000:2c0b:b0:487:f37:7ec4 with SMTP id
 ffacd0b85a97d-48e385a74c5mr3940317f8f.24.1792761627075; 
 Fri, 23 Oct 2026 06:20:27 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3805c2c8sm4707919f8f.48.2026.10.23.06.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:25 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:22 +0200
Message-ID: <20261023132024.1606843-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016152811.2817446-2-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4]
 support/testing/tests/package/test_uboot_tools.py: fix typos
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
>  support/testing/tests/package/test_uboot_tools.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
> index 8cff6fda21..13f77c3379 100644
> --- a/support/testing/tests/package/test_uboot_tools.py
> +++ b/support/testing/tests/package/test_uboot_tools.py
> @@ -96,7 +96,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
>          keydir = Path(self.builddir) / "keys"
>          keydir.mkdir(exist_ok=True)
>  
> -        # We generate a prublic/private key pair to sign the image.
> +        # We generate a public/private key pair to sign the image.
>          cmd = [
>              "host/bin/openssl", "req", "-batch", "-new", "-x509", "-nodes",
>              "-newkey", "rsa:2048", "-keyout", str(keydir / "dev.key"),
> @@ -150,7 +150,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
>          ]
>          infra.run_cmd_on_host(self.builddir, cmd)
>  
> -        # We check again the siganute, and expect a failure.
> +        # We check again the signature, and expect a failure.
>          cmd = [
>              "host/bin/fit_check_sign", "-f", "signed.fit",
>              "-k", "test-key.dtb",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
