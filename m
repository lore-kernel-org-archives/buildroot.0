Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9673AECD997
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F6A541260;
	Thu,  5 Feb 2026 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VRnGaWB940r; Thu,  5 Feb 2026 21:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 640AA414ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770325442;
	bh=I5tHFmjkjGe+haEoqIxC7IQrTNmtlTFdSAPmSNoBviQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=aVY4RUfFSn7loxAdx8xlsuYJ2WGUSVcxJJTNFs3my+GbbBMdZnH1w/f91irk+WFWS
	 QOxS3T6+XlckTIT8RBE8RRvnRnxcrnsTBq7DBaOXrS2ISO6qXNxcgdyw3lYuVcKl9d
	 mfBtOdRDJe6ricb4FGXapNT/j6w33w5wbXiSc1XxMia9Gloc4UGB5B9F+ZQosSWVPO
	 ns/PHhe0HhWcPJsCSRpq7Qdm7reCcN4q1J3Zz5JYvG0vLrvFobsJFvtq6esugReVbP
	 OC6NuXJ7GPh9UQpM/WbYL0cjiQKZ2advgFZiE0g/Subzz5rxJPTFF1bx8oCM/80e/C
	 lHofaQyN1z6SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 640AA414ED;
	Thu,  5 Feb 2026 21:04:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F78117A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00482842E7
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2jDGgysOvIa for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 21:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D7F2E842DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F2E842DE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7F2E842DE
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:03:59 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 12B8B2C8330D;
 Thu, 05 Feb 2026 22:03:57 +0100 (CET)
Message-ID: <5cecc965-d626-426f-be94-c7653f3d096b@bubu1.eu>
Date: Thu, 5 Feb 2026 22:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aYNnP1uFAqo1fta0@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aYNnP1uFAqo1fta0@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770325437; bh=s+Mxbc+mAej3LsBFx7MQz6+jK92/aSgjMSvO/FNytCc=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=QbjZ3k2+HCr16TJr2AYWb/bNZHxlFELvee7M8yRDE1ln5F67XFEUhKN3RVLHQjZs0
 ZbZvK6FREaTV9jVINcpBge+LoyCJ3L/ckIsW3Mnqp96IX0DN8pp+bG2tEoduZD15RS
 DABouZzMyM8nyAQGMS7a64CltOWPQpzQhmWspKmXmfdWhA4tvvSUcAIPPLnCyXkp+c
 NjfNxa4B1tnxGosU2N7djLl3tV5Qm0DSad50wD7dsMFiwx25v68CRUx7IqkgBgaFJJ
 feBmg2b45INgkcU5P6uPph27RuX36kBog2B09hhWa3I0nUKYj1gobPg6NccrDASQEb
 jZ8gJwrHPbt/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=QbjZ3k2+
Subject: Re: [Buildroot] [PATCH v3 2/2] package/strongswan: add Linux kernel
 options
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/4/26 16:35, Waldemar Brodkorb wrote:
> See here for options required by Strongswan to work properly:
> https://docs.strongswan.org/docs/latest/install/kernelModules.html
> 
> We only enable a subset, which is the bare minimum to start
> charon IKEv2 daemon. For advanced users this might be not enough.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
