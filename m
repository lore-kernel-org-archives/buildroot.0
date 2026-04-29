Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71907FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 18:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 250FA616AC;
	Wed, 29 Apr 2026 18:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbizica8nMHt; Wed, 29 Apr 2026 18:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28DAE616A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777488590;
	bh=42n9lMg5xlPlZ17zb/vsZlbQUxos4LzVRhkW1cRZKXc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=PnCjPqB/fTLz0qFHYiCAZy5skhRi0NC6V+xoBbl0iNG43sv4hQr/pjdm9MqeCSL3P
	 ZtBNA0TlbMzttA9CYpSiFkjXEBI5WozagOAa/J6sJcl/tsDHknicwCpf8dHEuOK//Y
	 cSsgQma/XEkW7zz/pv5c1c+pQUwOiQcHZLNVWrCt3oZyRfUfUBYDGiMPtV5dGkE6xF
	 7h+Ox26Zv5uqKmT0b/jvbhSbFyBn8KlVHxgJdHLN5zE5TiO8a9/lSQXBy5zN6Haf9L
	 QMXFXZ3cUZZIanoqszz2mX2LVr3XX2xYJjwfEG+ZehusRA5Q2n/yG52OFjkVqiTydD
	 5eT/sOg+hgEtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28DAE616A9;
	Wed, 29 Apr 2026 18:49:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B96EB18E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB2F98457D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVKotDNcZUXp for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 18:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAFE784575
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAFE784575
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAFE784575
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:49:47 +0000 (UTC)
Received: from [192.168.1.108] (tmo-087-238.customers.d1-online.com
 [80.187.87.238])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E4E402C88E83;
 Wed, 29 Apr 2026 20:49:44 +0200 (CEST)
Message-ID: <cb7dd067-e4be-4a93-8e0d-7735aacef28a@bubu1.eu>
Date: Wed, 29 Apr 2026 20:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
 <20260429170808.1144652-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260429170808.1144652-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777488585; bh=FszMwMC76yArF/4zPvO57STzZmrGe1qZ/ceWEmVloec=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=laJ/OCL9WjVS6HGqVFe6uvNaA1qdWB4UGS70LSllMEMjc1iwFONdG8jRSSJx+1p3Y
 qB1uic/sx0gDEwGJLh8fJOkVnktBwQC3+SfRxaIeT5zGTD3+tWSsfyVh6/6mWVgcx1
 +Qrk57gnxLQ41wNiMXcSHb4gZmwMLCxaguteuvPdxyAJFP4ozA549UATedrJQ64XKg
 uK3zuR/7iSR1E2qpCCEJzlaq0y1K2rgqW/2/mjJy3ASqUnf2Wb8yzEYQi0M9gq9Ssc
 TziVLAUlHRqMmRq41GrJqxTLsg3nBEsGdbfbbd7exOVZLGZJUbPU8RxqM9pgcf25wR
 0PTrSPPgkrEsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=laJ/OCL9
Subject: Re: [Buildroot] [PATCH] package/nginx: bump to version 1.29.7
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

Hi Shubham,

On 4/29/26 19:08, Shubham Chakraborty wrote:
> - Security fixes: CVE-2026-27654, CVE-2026-27784, CVE-2026-32647,
>    CVE-2026-27651, CVE-2026-28753, CVE-2026-28755

If this version bump fixes security issues, it should be marked as such 
in the commit title.

> - Feature: Multipath TCP support via "multipath" parameter
> - Feature: "local" parameter of the "keepalive" directive in upstream block
> - Change: keepalive in upstream block now enabled by default
> - Change: ngx_http_proxy_module supports keepalive by default;
>    default proxy_http_version is now "1.1"; Connection header not sent by default
> - Bugfix: invalid HTTP/2 request after switching to next upstream
>    with buffered body in ngx_http_grpc_module
> - Fix bootlin-sparc-uclibc build by adding -latomic when needed this caused
>    build errors in "bootlin-sparc-uclibc [24/32]: FAILED"
> 
> https://nginx.org/en/CHANGES

I don't understand why you are updating this to 1.29.7 though. The 
latest *mainline* version is 1.29.8, which was released over 3 weeks 
ago. But also we are currently deliberately using the *stable* releases 
of nginx[1], which also recently got a new release with 1.30.0.
Bernd already sent a patch for updating to that[2], but I think we 
should update to 1.28.3 before.


[1] 
https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#stable-and-mainline-versions
[2] https://patchwork.ozlabs.org/comment/3683711/

> 
> Tested Using:
> - utils/test-pkg -a -p nginx
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
