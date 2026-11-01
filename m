Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CBE606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TfihpvBO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7ADC405ED;
	Sun,  1 Nov 2026 15:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcHtFITL3bHJ; Sun,  1 Nov 2026 15:06:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2BF384061B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793545564;
	b=RauhTnghvG12KcusKtOG2fuD8UE8IrFwpepqvSZl+NO14RHTXXdudvhUXorTBOBHlTXL
	 CNj2WuQjlf42nPr/6hY5hKa9l89vsENzMiMm4UifMO54DEoXIl6VK4Ja5r43yWeSosa3g
	 J7OtVkIni+ruvJx//OYH0pEh0qqLDjxMlc3tSMevC49WI6qcWLjBug16+lukdK7Pms0WR
	 0w2L+kKqJc4/53U/ZA6n9oDkRyjJ5SUJFpSSwpKd+jVS0vJ1tgCAwJaLlVsQ1YbRoEDgf
	 bbEHLNnJwkdTTe2XnXpIOquw62eWlumW34t/nv9UjoJ5M5OUYYS95jDcAVoKEj4usaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793545564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=II6VxOYPt8r+vETjg76syMnvM/A29/9I3mOBh4oklzo=;
	b=a/ReL9vw8Gw22FxSkJ8cqW2SJZ7W9fF4OLULuAJVihRwQrhtEwvC2A/YkCbkzEzOu83D
	 0bei2VQ1yYNoPSqgo//JDW5f9rbdO1x54IhlBKMP/f6W768niVuo1HRjzAkGxKrn/r5VS
	 T9DNPHRbA07I40Jc2ehps5QYQh7kWj3SNiDjCcvf0KtbV0ua/E7R6s14nv1oOH0jE1/Rc
	 od50MRpPR6AhFXt9pOPs+H5oCJbN9JP2zoUg3wsyYq1ZnozDF11039l6YijTsFyPbS7vd
	 irI+uSRp0pSEsMT/PMPl+XSYHoCWdeX5zv3j4UZwROHZr0i3f9iaBoXX56BLpRO4Ubg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793545564;
	bh=II6VxOYPt8r+vETjg76syMnvM/A29/9I3mOBh4oklzo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TfihpvBOIuxPYZOPw+DFqxhPczNaUwy1kfRlIv3qqpCLnqWj6ilZ5sHea05BHXrwC
	 XWqAY6uxYjevoKzie/NdxdoPntOOr4HRsW5zqxMjIRsRj50s5x19GUtYGyG8+ptLRn
	 c+J7ID2upszn6d+qMcMF/yy5aBOiCkMe8uydNe+bA3xETNFc8Ss8T/2DAqfbqiEKWR
	 cQjiAFR71mg2brmuthJoGtyR1gROtIW8WO491Mj1lciW/5YrjHYmM24J9Q/NX2sRvg
	 FJ4vzWFTxkffLjBrcPb70h24sZSNyUS0YbFMVPFeDgBkvucpoBfEMCcWptbwOY3wFh
	 VUk5k9qk80P7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BF384061B;
	Sun,  1 Nov 2026 15:06:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1C7F380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92FA380E0A
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttn-IStkCZ9J for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:06:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C146780E07
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793545563;
 b=X2BmDGFKnfIofcx/ZAf8gt9ZTkUVb73dZ3MNFwzO6PgScdN6BahW/Vjocom79zMU4Siw
 S95xmSVxPayAoKWZwU4VdEeaxxVMgcd5+JrDMbiwFnY7JwVbfe7vEe0XBJhnBuemKw6so
 0McdkKfz//ISTtDmycHlUsfET5oaZvKQPqge8zqF8qRAz9OzxMoK2yQWY3TyC1KpkDSpM
 /0buLi4nMUiyYLuQ2dhE/YfBosBzlwhKZLzAhR6zGXQnYorxWQbAwsFljsVvMhM6tycQs
 yZuNV5ipJZRSNrAbwwqucsovcaxdwqItmmCcRC59BD9RslRiWVB1eBbyjQ7nw8r1nRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793545563;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=kv4LU20RibOQDHNVkGS46MwIY3z5dB6D0nZsJiiZlyY=;
 b=qeiAL1WQ54Sebx+defHAP3RDyRlnHPUXlfvfD348y/eHc2fXVWGmUBCuxblF+GWSKt0f
 pkm/azKwTAK6FFU4Hd7OC30+D9m92tHS063MarYQdApd9DN+lAUXCNe6W7I1pbflMaAnf
 C6OQL3Yv2oRb15p2hmiOLYgNodFhZw0Vq60FncPdGkgTxAjZckfFIjhaec1y34tNbdqc3
 t4QqSA5LxhYTv5Eu9aYDry8jdGjgIfDPHRPsKS6lzfctBIZVQfT1ll/W022w2Z0Gf6ddA
 z2zc6zMzEZqPCdnhg1vdonKWMy6CoDiLuz3i2etVsJ9jUIgB/yYnGNPTXIxE4tjRHSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CO2xMSnU; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C146780E07
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:06:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5DADA19F57E;
 Sun,  1 Nov 2026 16:05:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 16:05:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 16:05:58 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Louis Aussedat <aussedat.louis@gmail.com>
In-Reply-To: <20261031201918.2850153-2-james.hilliard1@gmail.com>
References: <20261031201918.2850153-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <0f8aa1e491c604e5001f6b9c68b22fb3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-dnspython: security bump to
 version 2.9.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 21:19, James Hilliard wrote:
> Fix CVE-2026-114605: a crafted DNS message can cause excessive CPU use
> while decompressing DNS names.
> 
> https://github.com/rthalley/dnspython/security/advisories/GHSA-45c3-73f7-pv4m
> 
> Switch to the uv_build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
