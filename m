Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B18CCD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 21:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A90240F03;
	Tue, 19 May 2026 21:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aU41VUSJep3Q; Tue, 19 May 2026 21:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F28840EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779227845;
	bh=7nF413w8jGG+RKIGnPiuzypIOVZxXByR1aNffM7RlmA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YyxSDaw3owREwYvQZE9CmEsgv9Ty9Um4jpFUMgDZ6JTpx4xuNwHIMln8qlV9c30MM
	 OeySB0cWs1zfWPsRhrkHklkjjl5ND1A3P3tGQld9IoPUgJEP9I07EewZn0wkSiZA8B
	 X3Rbhtnrxc5RKijpUvhDhpDX1omOU9x3PSaYaQmRE+GNXtJmF1SFvFDqmxAbIr+59T
	 kcHvVmwZZV2FKgu+BjL2F0Gm+hI/caLntwWfP8f/cg2VgE0XRDR2Qb77gb2h9nia48
	 i2b/bdzekwIMpfMX09uz9GXYVO5NsSf+sik01ROWc4bp0tkFbwXByQydvPKlusbggq
	 xXfqcgK4YcSpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F28840EFB;
	Tue, 19 May 2026 21:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 236F5282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04C5D81EB6
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXgRdARD2aEY for <buildroot@buildroot.org>;
 Tue, 19 May 2026 21:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2182281EA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2182281EA3
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2182281EA3
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:57:23 +0000 (UTC)
Received: from [192.168.11.192] (ip-109-42-117-151.web.vodafone.de
 [109.42.117.151])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 37BAB2C8080D;
 Tue, 19 May 2026 23:57:20 +0200 (CEST)
Message-ID: <fe4da745-f277-4b39-8891-969f49408f58@bubu1.eu>
Date: Tue, 19 May 2026 23:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260519210449.1158179-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260519210449.1158179-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1779227840; bh=vK2Z7JBbqp/NAFK9txe+GdJmIIyKj4zYnpoVoLWENXA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=F4HrblkPZ78H5BNvvcexFcpTLQDEQyHJvLTj3hwH0F21/kRexrfVTfwues5Jkzhxu
 B8UGKoTZklIdYekIxbKpn/zZ4ygJQ+uAGJ2wpa2VSg+SrMuY3cEGDnshGQpMtxhZG2
 1GVyotgI3W7EYSxArV7L7/T3ol+qPaLLNAvOOBHcMIpOXZjqZ5KaeGIy4pe83P2urL
 Wp7LkyVhxd1dGs5+ie30k4i274F0LfQvw0TxHQ1M1FQ/ckmi3YmOkCIAK7dRnXZKqX
 VCEg+Qa14Y523yxhSFNjG5fUn3pYjjUQ3F8/UAHyqj55ez2GDnc2YHvJEEUH/p+TZU
 HhmPuVEpmIVbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=F4HrblkP
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/util-linux: bump
 version to 2.42.1
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

Hi Bernd,

On 5/19/26 23:04, Bernd Kuhls wrote:
> https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42.1-ReleaseNotes
> https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42-ReleaseNotes

There's two new tools in this version, copyfilerange and getino. I think 
they should get their own kconfig options for enabling/disabling them 
separately since there are configure options to control these in 
util-linux. Alternatively at least the help text for the "basic set" of 
tools needs to be updated.

Can you add this to the patch?

> 
> The security fixes mentioned in the release notes were also fixed in
> 2.41.4:
> https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.4-ReleaseNotes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
