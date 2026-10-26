Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B1606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VN8sOZnD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6468180AEA;
	Mon, 26 Oct 2026 20:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NatCVxknt9wb; Mon, 26 Oct 2026 20:41:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8877B80BA6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793047286;
	b=PNIDEPuXvNphHah9U2YWwbV1ZnKkG7LEYG/WAfLJ2zlioYEF8vwTYxAIg5KcZuB7GrBz
	 L9T/xhpQ6hHu2xj+q8eaOIZf5i+EV9Gyyi8c/yKWyC8v7i1hdR0IJR4hrR0q45zC13fyL
	 MxCNx3KxCq+/HcaseoMVvN/u6TgoOWEEIUKgQhiHSpALst/QpcrLlzF216DNXGbiP/Vu9
	 +OGE5FIVBHJl7RKgecNbcTWYhwQTcLCyLwaA5VSPBITUCxQKS5UL4SRZiaSemF9fnbR8d
	 87Ar6DHd8RYVFjmpXIR+JQiTNyRLLuhKUaFUwXEf5wwRNcaiJ+l/B2FVMBftM+CoeAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793047286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aUo4903IiKTaoe3YANUMZnvKOD0UpBmTUko6OIhNuJM=;
	b=bgtJvnlySzI0VOe9sEhcFEhpLesY1DXv9dbYeTO77mEQs5hR+bLAS+zX9+Ue6pXIxYwv
	 j662nVzSKUe/gpfZStHhJbV2BZQWMZP+WQ2Xw0M38J06av2/h0XmrwQ2nEOld7hExLvSm
	 jmAll7BFQ+FHPNRHn5vvt8EUsebmqzqOCKSouJRbHE7I4DMHZ9L00HpmPceClay5sPjaV
	 c56ZljkVCIttZPXbyawuRLpLmnezXXnwew3D7DdWqez05St8q2Wmhzj3YByStvAEvEZJr
	 BW5RRf4P7WDRbhCEXwGULTc9GHuRqfmQBLIvCyaXKsZjXD1ZxNDe2WgOFsVj31h1nqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793047286;
	bh=aUo4903IiKTaoe3YANUMZnvKOD0UpBmTUko6OIhNuJM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VN8sOZnDM0vcp5Y1x9UqWwP5xfO8UJW+UC4n8jKo1RJmGZH6XT/2xaoBmMO/rM7oh
	 xhPgvNQ5jq0absey30PRZcBOfxZg3BAALeToZUomA2UtewKwe5+CXgK+P8ht7uwFNe
	 56Y4q2iEk18H7ON8hp+YCHUBSmBfnHaO0/RlCdV12qo21yE17rk9yuuL+aZS3sopDX
	 UAAhCECFXnghgTdyJsiyxT0Bq4jEWyEcfZSopOzvG7h16pksY/VJVECZ04VPOWMNEf
	 nOSdEw0J+uXlo0BRDkja1zTUfpuZjtrP+04AZUkrtwCSebhdEX0+z4uikoCapIssAT
	 1JYGhGh81DMWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8877B80BA6;
	Mon, 26 Oct 2026 20:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 181A42F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F279040112
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr29uQfngKxm for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:41:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0BD6740062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793047284;
 b=TRF5eBCUfnh3AvZmC/CxB8jeh3s0NARHY9BqKEt7LNbZIkDp8mORP2xuhwlms7IdrObK
 LX7pI/WGR7fvKgw2Y54pZzFVNGFR4gK0tSZE0FZopIlonRIIunWJLqrVHhvx20EZx+y7b
 ojmLxQY38ebMqdW3szPEyFxYYTRqF51867Smf25q1PheUweFu055d6VDScgchMrpE4SNi
 122AwL1yUhEk2/mDKcz/zzBxP4hHYEQXLWL+1oidq4Hzs9k+MfpyQGTiI/Vw9a2T/wjUO
 Js1bgcKR6FbnFII860kM4iutQuDDHSLPwTqY2/j9rwEVDtQxHXNFcv3UK5ufEnudSpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793047284;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Xn06jghOOUH93RJtNJ46iTIp6+MwW6SL6wV8eh6bUTk=;
 b=C0ATFznDfAPzKFOvCdMfEFlsIMXoMwzbQ9yeqzVWDWGeYfgxFddXQWuA6sPWgJiJy4W0
 7CiQgneTBFnLZEitqzXVkmhzWubfCKaRMohJEjUEPz5y5eTztNEixhqZ+nUfGYOOqlp6g
 SG9B+/NPR/WFQlsxFmo2kCn125q5077wtIP+PaZW/yo2o24xL9xPFdKDTHFp7ehxF5UAZ
 OBSNO66vpS4DXPftj6krNdvN9lW7aThAlg4zMVPjoIVPffrCKkmNv/Vl+3DTWkZ0VGqAY
 UOxg7VYgqgOPrv1NvX4dP22EBsYniW/N77tczpDSzT0YIVPZLYEuZ0DZJlSw19qaHNA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cWdJrmXU; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BD6740062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5CDB119F5A5;
 Mon, 26 Oct 2026 21:41:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 21:41:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 21:41:19 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Jarkko Sakkinen <jarkko@kernel.org>
In-Reply-To: <20261026190956.376568-1-fiona.klute@gmx.de>
References: <20261026190956.376568-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.20
Message-ID: <c87837c5a7af8bd9b462721b842744fe@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/swtpm: security bump version to
 0.10.2
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 20:09, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> CVE-2026-75900: Fix length check in SWTPM_NVRAM_CheckHeader()
> https://github.com/advisories/GHSA-gqrg-h59c-j4wj
> 
> Upstream changelog:
> https://github.com/stefanberger/swtpm/releases/tag/v0.10.2
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
