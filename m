Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40B606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 23:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lO+f3liI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E5140A47;
	Tue, 10 Nov 2026 23:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCS5degXg3E6; Tue, 10 Nov 2026 23:25:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4131F40A36
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794353105;
	b=tCxr2TD7GEqzHtJUw/vodBejWz4Z0n1V4akn66Yt6qtaHexAKLDbRfTX/06ohgUcUtP1
	 SFcpkixexOFjUYcBz8VPMMsmDltnV7RyZbknCj+pcMjK9lTvLMYSDLwgK709oMxDW5dVl
	 kbNoOG6YSQ24UFMq441JcZmhtK2Gs6R4YA+8Lh8wNGrxbMraJAOh4jxQjFKpP0cSUSCEC
	 CQXlCfTZCIoDHdcxzDaOTayFufkQj4hnFrjDZ0WZ23AKUEuVgU0pCc8ajbtr16Qxw3X/r
	 45y53agDgg7kpQNHbpZcxJilTd28wCO/Aon3ZAKdjGFd/Y3qYAvxE26IMNffgWnVl/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794353105;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=zu3dIFsAR1iN7imMA1BOjc9S9kWAw8p+zFdWZxYlSWc=;
	b=q8+Z9B3mHlCIAooQYQJlPJnZUy178SSWblmj5GyWKoUoiNifJ38lnjEaruK9ss/Ks8nw
	 wGzn5o2YGZWksxYXvNcT2WPih6ErV3JoZYhM+cO9a/DIrLzChrtbapB6bab2m09oRcdbE
	 1BC1QdQFOmBD0ekqsnKYn5c5Wk+f0YviLTU5XlcDqsADmSgYCM4DoVpcv1XkGpERuFy7I
	 ZMa4kJ1VQJhrmy+HclQxHM6KWL1RN07b7ZfEkAFA4NCgVCMiMpb4c5kE7Bey8/zNSerWO
	 VHHT+2UFowftQl5h0ppDUdlM5Za5rSuABS+kd4t5reVBRN3KOb5e9XTXyCrwwT+nk6A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794353105;
	bh=zu3dIFsAR1iN7imMA1BOjc9S9kWAw8p+zFdWZxYlSWc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lO+f3liI9JEWg95E3dez9eA/eYx8c5LmBOrF4wTjRuBLVBVjmKM8bCqip4mIMnX9L
	 4vlUHo4qTFKbVriwmAJbM/j2hjTaC9FMxSF9D9xXqTFidkDasMNfzT10/QY9IdTKzf
	 PNX7IAA7mthvBYPf4ppDZUNcEmM0SfsyO/SWR4iL8thkK/X9JCYe1gOfWCUkKQQtYH
	 q+u3xnSlD6FXmgzHYTpMIdhsI4aL7tIfpX9rwAqsM1YwvaNsxtzWrKd/0GgCM2GF4d
	 8nnPOesHWXxGDSFACkmreycW01tslOjJM4B/dnTuKFxOWRDPvigFQYhExMZ1h6crbJ
	 A+Up8qffSXW3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4131F40A36;
	Tue, 10 Nov 2026 23:25:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A92E92FE
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 23:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A6F84037C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 23:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFRSUVCIPfoy for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 23:25:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1FB0840336
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FB0840336
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 23:24:59 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2A12A2C83419;
 Wed, 11 Nov 2026 00:24:57 +0100 (CET)
Message-ID: <f2d16de9-d62f-4e7f-8536-2f873f8c4a35@bubu1.eu>
Date: Wed, 11 Nov 2026 00:24:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 arnout@rnout.be, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
References: <20261110170216.39432-1-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20261110170216.39432-1-neal.frager@amd.com>
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2026.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 18:02, Neal Frager via buildroot wrote:
> Bump bootgen to xilinx_v2026.2 release.
> 
> 0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch is no longer
> needed as it has been committed upstream:
> https://github.com/Xilinx/bootgen/commit/ce2819d3e15f5c3116629f6793d15a942a906eb6
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
