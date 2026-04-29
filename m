Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C9BFF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 22:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7983561736;
	Wed, 29 Apr 2026 22:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmBzA6Fab0Ef; Wed, 29 Apr 2026 22:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6672461708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777501335;
	bh=QKVgis37E7l9q4VeDSaO6pB8ZCsVbz7XzhFcE7NDmE8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=CBuhyBY+/zaXN7ETT+pblvHuaFTlInh8pZt4wH2O6v9afDgueytm0hsX+ZMxMtOkb
	 ZqbVgHj2t9LQvP0dzFzRVWrOMpvJeSXLz9ilc67FnAhVxGMDzHAfojtZ0mdN7UkgOr
	 FfH08XzR62e03LMtbnww/laNh8aOZMB3JDnv4Jp2pi+O98pzoyB+/3NPSGb7nYNUto
	 xE+OZJ6ta0YPZ1QBTvN5gaIOTx1RGtl0bsV3uAe6fNaNDYkwF4vj8PM5TaLvb391pX
	 sp8wGEd3IvHdu2dyH8cqM8XMT/rNEp9WxxuI7sarT4qa1lKqK2fXEEUSCofBe3y1q2
	 +yss+yjaBDqig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6672461708;
	Wed, 29 Apr 2026 22:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1274192
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 22:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2F3F425F0
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 22:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uF6nLXZSFKhi for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 22:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CA90425FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA90425FB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CA90425FB
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 22:22:11 +0000 (UTC)
Received: from [192.168.1.108] (tmo-087-238.customers.d1-online.com
 [80.187.87.238])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5E7772C80CC9;
 Thu, 30 Apr 2026 00:22:09 +0200 (CEST)
Message-ID: <aee80fe7-06e4-4cc3-af27-84ad2fd0bdab@bubu1.eu>
Date: Thu, 30 Apr 2026 00:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20260121144322.1587729-1-nolange79@gmail.com>
Content-Language: en-US
In-Reply-To: <20260121144322.1587729-1-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777501329; bh=i3lMYcC2zxZB7cN4pDIDNyhna13BL7VAktEnreVTKK8=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=YT7GtcoboyxMpQ2Ebd0NVeH1TpLYEywG+Di1OaztlRL5fIDUQA9jjz6g9r2YalhXP
 M8IhU0jFC0zf5v6zDFKo7j+AiNsJ8B/jQ7gyRA1+MmN3oYOTv8SiVpeneGNX/Z19se
 /xg28gP1ygwR1hSn+wPEh1xUHmSSq7w9G6ZUz7XaPtnthUxW8oAhVEPJB0DjnPTsv5
 PtS9WfrEo64nScMq2f39DyseqIcq5/VVKow3e1Erzmbs7YVFIL+pMWjlQEP75JDWIf
 pWVPOZUTlP7TDc7OLAgJ6At2pM7+q/RVLOWD7XvY/h0kvt7CngKuisCfbJ+QAoAEDE
 b+vFc2BxvMoMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=YT7Gtcob
Subject: Re: [Buildroot] [PATCH] package/linux-pam: include pam_systemd for
 login
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

Hi Norbert

On 1/21/26 15:43, Norbert Lange wrote:
> pam_systemd ensures the user's processes end up in the
> correct cgroup and scope.
> It should be used, even if the full functionality via logind is not enabled.

I haven't found explicit information that this should be used with 
systemd, but without logind, the only related thing I found that 
registering login sessions with logind through pam_systemd can be 
disabled since systemd v258, and then skimming the code of the module 
says that most functionality is skipped for non-logind systems.

But this all makes it at least sound that it's safe to enable this 
regardless of having logind available or not, so I'd like to merge this.

But can I ask you to rebase this after the recent pam update and changes 
in 30e38505e4 and 9408bc0161?

It would also be really helpful to have a runtime test for this (and pam 
in general), would you be interested in contributing this?

And lastly, pam has support for building against libsystemd for logind 
support as well[1], which we currently don't enable in buildroot. Would 
this be worthwhile to add as well?

> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---

 > [...]

Best,
Marcus

[1] 
https://github.com/linux-pam/linux-pam/blob/master/meson_options.txt#L11-L14
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
