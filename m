Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A663606A69B
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nVMl1wJG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE02940E65;
	Fri, 20 Nov 2026 20:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-9BkExV3qd7; Fri, 20 Nov 2026 20:49:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D697140A23
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795207769;
	b=jhkQt3Vr0it4+JpoyhmdHDtHBlLCuVfutbPNIB6JSZgKxP8pCfkru7q+qHlqH5KY09MO
	 3zZGWmncc7kdP4PFFFq90Mzgq0ydLnwpAHg8qkpUFOHQ6Jpqp6lDup00yHTiR/DeOMTg3
	 Bym+00Oc32ZaIyMQ1ApenOpIgd0jd8YBYapBeEgx3R1rO3fP5jBk0d24nnGk5Iod0fKMc
	 VVhz8top+mXLfVL9dosy4PzmzgLp3aIaIKgklAKNKZCM/xK3Uxq39Pt/UTqOItmFSlaZw
	 sZN5i5d1VhebVCOw0kQ/yWUWstZX13VHmY2FDHfeI2cDl6ekcfyeAdFQ2XVJqMrIBVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795207769;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=18kxS3++NARpNPxwXmcmg1Nrdh0npX1LTSK0U6xn0aM=;
	b=PnisjuIP82lIPvRK0Vi7mLgEW/ujpH0Apd2Qocf20OCOyZz0xT5xstK2eTvYase2ARmi
	 wfzj/BBZZRjBmcuTbazy1ymR/lQblzfoRg4Ey95CbV4f3S3ObMLSUY8KXYguq2VzLQmKM
	 Kpxe8dMY/+P+VBgRHJhUag8oHUJ77+9R1jlxpDrcZ3Tyhumy2NRBptqKimP7kva9YtYHm
	 w00z7hkYrRuAaxSGa58t+OE5MEZK7RuSesHRtjdN/eHZtuhrWkzLxyZ9YeqeBh5SWdomr
	 wHKRv5sDOJ8t/wBOCirwZk7BfUNkiVchtXBCbOMYQb8zqhaRlhQ0h28yKUdMRiL9qLA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795207768;
	bh=18kxS3++NARpNPxwXmcmg1Nrdh0npX1LTSK0U6xn0aM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nVMl1wJGe4reGV6AizCsmhqzXSIvfjrZyUCPZM7+bYCE0M6OgosJ0WABFs/HghdFO
	 oCw1d9/l+oWuMoPNRwW2nklWCfIkdcCYf0vMfFYbiLN+awVxNY3RrXkhh32Pv0mT8R
	 L4YlZlBGI29ieVOdtn0V4JTms/fpjb3CsGO92cU5ZohDawfQDUjwLkRa1XyGS32IYN
	 XGE9hZZ4SJQmesaBMrxDt/Jcs+uyYJagV8LYjvzJ4ntJXxKrmUJXIUlU+9wDpJ8qUn
	 0g4+nOpf2nb28He4czk4cHgnceEK129PfncjzYxA3X2AvZhfO8kNjs7obSNHyLwCU7
	 sUMI+qHMf7sfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D697140A23;
	Fri, 20 Nov 2026 20:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECAFC9CF
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB8D76071D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OB_VVRRk4arR for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 20:49:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5337D6069A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5337D6069A
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:49:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B778619F57B;
 Fri, 20 Nov 2026 21:49:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 20 Nov 2026 21:49:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 21:49:19 +0100
To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20261120173009.1339691-1-pyk@foss.peewhy.fr>
References: <20261120173009.1339691-1-pyk@foss.peewhy.fr>
User-Agent: Webmail Free/1.6.21
Message-ID: <854cac8fd3cc4fe1d7a9320ae618d41d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: bump to 0.22.02
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
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Pierre-Yves,

Thanks for the patch.

On 20/11/2026 18:30, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://github.com/ColinIanKing/stress-ng/releases/tag/V0.20.00

This link does not correspond to the version of this patch.
Also, since there is several version included in this bump,
it would be preferable to add all intermediate release notes
(stress-ng generally includes many changes in each version).
For example:

Release notes since V0.21.02:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.03
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.04
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.22.00
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.22.01
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.22.02

> 
> Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
> ---
>  package/stress-ng/stress-ng.hash | 2 +-
>  package/stress-ng/stress-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
[...]
> diff --git a/package/stress-ng/stress-ng.mk 
> b/package/stress-ng/stress-ng.mk
> index 59cd249291bb..60438f264ea3 100644
> --- a/package/stress-ng/stress-ng.mk
> +++ b/package/stress-ng/stress-ng.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -STRESS_NG_VERSION = 0.21.02
> +STRESS_NG_VERSION = 0.22.02

Also, this new version introduces many build failures:
https://gitlab.com/jolivain/buildroot/-/pipelines/3095502459

For reference, see the previous version:
https://gitlab.com/jolivain/buildroot/-/pipelines/3095678903

Could you have a look to fix those build failures, please?

>  STRESS_NG_SITE = $(call 
> github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
>  STRESS_NG_LICENSE = GPL-2.0+
>  STRESS_NG_LICENSE_FILES = COPYING
> --
> 2.53.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
