Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE640606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=adlBCxF4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC3D8116D;
	Wed, 18 Nov 2026 18:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tonDK1QU6iA; Wed, 18 Nov 2026 18:09:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF4718110A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795025376;
	b=ZtUZWqFH4FcDeq40P7+OP+9I9M/SFJ/CgZrksBsFzX3S2DjYikB7Sj+rd9Q3+LblkEvi
	 Trj80Q88mglfouukkdMRAGy75M/BavlYkl06bDi49Gi+jBto9x7OHbjzvsHm9ocuWCjxe
	 scAZVbNizKsk4GLsE2oI45wqddjIEiWkUV3VsWpwXAMBbBFvo00jWEvyn6mrdZ1RdsTSx
	 hytud6KaBeSPHH74G4fHU+MEid0Gr88B2cs4Pu60ILFhWAI9sAaLDh7YsrhMyrdsjnYhT
	 OCIU0Rzl/23MjOI8JZ7fSTQ6SWMeQpphFOGd1+Lnxx9rFg8zxXY1V3SxpgXUE/apvMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795025376;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4Po4N3Ufbi/ouxesmzCsoDHjPR/zD7dIzvLuc8qgDe8=;
	b=kIfK+zkfTv01Z5MfGP/+86bFLGdXHm296gXBppBVRzpWPO1W3O/rUYM6gqgFRGopKIA+
	 g9/MfKfwtFzbWDztVyN2OB7XEnNCLuqm8o0oKeJyJcKrjZ1+1zP6l9/cgkUByoVGLMrC2
	 O8OJ2poiG3qENDcW3sSmdzbVL1kTAbIGCPEBgn8Ip1Exl8stItZ/E7alnyzp3tgDuwfiG
	 xZrictm6MYVoKhIHvE2YFHGtRzMD16CRTNttxaVad0s4VwHH+rs+9/y09ku/vTFC4B/jL
	 y1OMXEl2NkBSuHOmQDP624UVptB8Qf5feEgeK1hwt/I2P1epUUIK+4SayKQxjGoKHYg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795025376;
	bh=4Po4N3Ufbi/ouxesmzCsoDHjPR/zD7dIzvLuc8qgDe8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=adlBCxF40j/VMjcZ/37DbEkc5krvgvA4M0QAKyc/eC1msUyfJdrUevmEnDeRl49CY
	 MZBsiiiA1CfrCar0bGBVNHNYzpmWxs3yt2wggosr2Vpoe8MqjWjaGia0DeAS7UNNx0
	 /Qgn/papnGX/JmtXmn0ujDY1LXM4C9QH2FVUSf9q61e3fKoN4o4KdE4yVB96juE3kL
	 L2OMCybHP1wgjgb/O/gKsGOUvDSg8IQFA8MyH3pd0oZ3xnexprWdrXdv+ZA0OLGEZf
	 Rju9xXZW1KOG/hZFc/3zF5cmVaGEMtfWi7/XEjC6CvPKo8mqQzs2SizKtdmPDAu2A4
	 8ROO+PKKEMtXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF4718110A;
	Wed, 18 Nov 2026 18:09:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5116761
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FEC4400A8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShMZapnucIa6 for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:09:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2257240095
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2257240095
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:09:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C234A5FFA3;
 Wed, 18 Nov 2026 19:09:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 19:09:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 19:09:27 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261117224459.3995109-1-fiona.klute@gmx.de>
References: <20261117224459.3995109-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.21
Message-ID: <f36b86fd5472d278255882159dc34dfa@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x,
 6.18.x, 6.12.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 23:44, Fiona Klute via buildroot wrote:
> Update the latest kernel releases to:
>  - 7.3.4 -> 7.3.5
>  - 6.18.63 -> 6.18.64
>  - 6.12.117 -> 6.12.118
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
