Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C55F44873
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 14:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CBE9809B5;
	Fri, 10 Apr 2026 14:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2u_wRLOSGks9; Fri, 10 Apr 2026 14:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B5B80985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775831998;
	bh=52e1ZaXR1PvWwXpKwfCtgdrqkuegZGC4CqXu//27lEU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Ym9nAhSkRIwTdnzz/y3ZkzBwpsbLJg8Ti2VhOF929QDNqBJ6rTqTCxzlbUyG39tU7
	 nwaKlmjyZ8+c425fiTLbOrmR4ZUpUswJYd71yZQ1vEDnfGwnOnWSZvmHfuHP4XlbEi
	 YD6sIZmNKJtU1zdPpKT3ZTA/5zVYOFyDJAnmkyjkfM/tWeObkVtcm3FY1jMIHPE73L
	 vLaolp6sPaIRl7BYAZ0d5ykF/6HQhV9/w209+zuoZZv9PbO0Z3+R4KQbrop0m73khd
	 bRGQbk4iaS2KwVEpDQ0OX/QbvaCzU16izty7E+PXW74aQF3R7w5BTB1mdJJxznWC4i
	 min91B+kIw66A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B5B80985;
	Fri, 10 Apr 2026 14:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D1D51F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72BBD606AF
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KXpSJLLswz3 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 14:39:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5139B60617
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5139B60617
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5139B60617
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:39:55 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D2F572C84735;
 Fri, 10 Apr 2026 16:39:52 +0200 (CEST)
Message-ID: <692b3530-b7a8-4898-aaae-3e1f8736ac0a@bubu1.eu>
Date: Fri, 10 Apr 2026 16:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20260410132316.CF960810A4@busybox.osuosl.org>
 <PH1P110MB1603F003E8115D527FAB219F9F59A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PH1P110MB1603F003E8115D527FAB219F9F59A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1775831992; bh=9yh04la6Y7IiLTR/7hvMq/IdC1a3QNJtywiOWXaPQ3Y=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=ouQC4keUHMtx5lCAX+zdo+dBFR7TNA3zoK8kbv8qO+DgPaifz+xelonlz+Cxpdhwf
 sbvz2kOjgQZasAWXmBZwwpcSpXoxkjbtI9JVfKS3GveESPlree/Sq8+n4xMngZOeYV
 mxm0RqcYz14hMhktaazRje1DJcsoreB5HDt/dsXnznAP74Nchq27Vo0vvgG9Z29WcK
 RnijpvLuJ8fFUCg3mHZQMnonE9ApweEr7ZaDhDTP/kLxRvCCTAkhcqTe57D7cbZk5s
 vAzr5c8K/IwHxVILCR25P4VinaKVB/Wn8C9OOwY4GpNO6cO8sMJ8ILNcilFGxfZk8h
 tAcTc/aiJzsEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ouQC4keU
Subject: Re: [Buildroot] [git commit] package/libgpiod2: bump to version
 2.2.3
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

Hi Vincent,

On 4/10/26 15:49, Vincent Fazio wrote:
> 
>> -----Original Message-----
>> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Marcus
>> Hoffmann via buildroot
>> Sent: Friday, April 10, 2026 8:22 AM
>> To: buildroot@buildroot.org
>> Subject: [Buildroot] [git commit] package/libgpiod2: bump to
>> version 2.2.3
>>
>> commit: https://gitlab.com/buildroot.org/buildroot/-
>> /commit/1afd1a6d4dbef3c78d92fb3f228c9bc5e592d90b
>> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
>>
>> Changelog:
>> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.
>> 3
>>
> 
> Just an FYI that we (well, Bart) cut 2.2.4 very recently [0] with some security fixes.

Thanks for the heads-up, I'll send a patch for these.
> 
> There was also a new release of the python bindings (2.4.2) with similar fixes [1] and also should now include a discrete license file [2] to avoid pointing to pyproject.toml

Out of curiosity, is there a separate release notes/changelog/NEWS file 
for the python bindinds? These do follow a separate release cadence and 
versioning scheme, so a dedicated changelog would be useful, I guess?

> 
> [0]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=v2.2.x&id=08dda33acce9c1358b0cfb57e36bd621a5445fee
> [1]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=c3655b5f641b87656c11da3ac708608d2c0e05ee
> [2]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=51ee19fe1ec8a94b5ecfdc7627b0c574c7874a1b
> 

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
