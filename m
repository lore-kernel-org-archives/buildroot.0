Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5686C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 15:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68CF8811DE;
	Mon,  6 Jul 2026 15:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rzpEYS52EcM; Mon,  6 Jul 2026 15:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59DF806D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783352950;
	bh=emAgaBtjwW2oV4nAvgwDi2marDLF+uIrdahkOBHMa/o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cSsuk9ZiRObbEj+lD9/VGtSzDr/CT3ghPG5+8hTltt6SAhz+nLiY06/iFqIcy+DmM
	 ts25FM8/HV5ocVjYGHyXNHzuVT9nyiNR1bppsWOyOmRRTqMw4Lw12Gwu/0RXSF32O1
	 oplyp5uc3O/YRJZgRMNrHeSsXMTeNUdyvFDsJfZBaF9HM1J+kW4GnbcDYruxfaNpjb
	 ul79cminT9vZidBNAp/F1b1gVGq5/qCPwTpniiwQ1ixhB/bvCzBBeSiC1/vgF3/r4B
	 nbceRUy5EZmGLc2W8H/VMgOkD95U14LlycZuAoX0T4BMcGV8Zhy2umAumt6ViXjR5D
	 6iF8GfOPqcBjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59DF806D5;
	Mon,  6 Jul 2026 15:49:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEE372A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9BA9806D5
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBKL9opjXE7Q for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 15:49:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D12B380607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12B380607
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D12B380607
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:49:07 +0000 (UTC)
Received: from [192.168.109.38] (unknown [213.228.1.188])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B2BA413F8C6;
 Mon,  6 Jul 2026 17:49:03 +0200 (CEST)
Message-ID: <0e73fb3d-3bc5-4f48-9a87-725795e7841c@free.fr>
Date: Mon, 6 Jul 2026 17:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260701121937.346945-2-nunes.philippe@free.fr>
 <aktl5IUWFKCT5l62@L30177.local>
Content-Language: en-US
In-Reply-To: <aktl5IUWFKCT5l62@L30177.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783352944;
 bh=S6FAEYn5suOqXbGdrLDuDWKNus7q5h3Be5DTRjp45Hk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LUNS28+X4Ue0vMk93uYACpE5g40hnUjdeXKvnhNgy12ScpL2Bg+a56eKDWyq3/4Cn
 KmH/2mSuUtbmJoiV/86IxpIgTVN9bCvxEgLxKSVtknpRzWP6sYfGZAuVsq1je2/RC8
 H3+RCpKjySfaHfuqFR2Mnwj27xrPQUZrTb2wHrJHLq9IaG9pZzTRtAuiqE37iAGl71
 LdgjKXhdf/RWcJ1OaDOyQCMBn+dDluA875utwb3dbGyBekEOPw2QoySA0tB+UTg5hC
 pY2IA4PY3ak8dfoypQ65XcdK1UkkvcIWYXY5DLPAxCshNqPBq9vB5vKnc7NgfxyVFX
 Q+6MjU9yGOedQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LUNS28+X
Subject: Re: [Buildroot] [PATCH 1/3] package/mcpp: new package
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
From: Philippe Nunes via buildroot <buildroot@buildroot.org>
Reply-To: Philippe Nunes <nunes.philippe@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On 7/6/26 10:23, Vincent Jardin wrote:
> Hi Philippe,
>
> Thanks, see below,
>
>> diff --git a/package/mcpp/Config.in.host b/package/mcpp/Config.in.host
>> new file mode 100644
>> index 0000000000..b5fb6e30c4
>> --- /dev/null
>> +++ b/package/mcpp/Config.in.host
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_HOST_MCPP
>> +	bool "host mcpp"
> The same can be needed on the target.

Ack, adding BR2_PACKAGE_MCPP in v2.

>> +# --enable-mcpplib builds libmcpp.{a,so} alongside the mcpp CLI. The
>> +# library is what most consumers embed (libqoriq-rcw, etc.); without
>> +# this flag only the standalone CLI is built.
>> +HOST_MCPP_CONF_OPTS = --enable-mcpplib
> A shorter comment could be good enough:
>
>   # builds libmcpp.{a,so} alongside the mcpp CLI

I agree. Fixed in v2.

Thanks.

Philippe



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
