Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D842CA9EC9
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 09:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A5E80F95;
	Sun, 11 Oct 2026 09:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_AL_F9qyUt9; Sun, 11 Oct 2026 09:05:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 60CB480DCA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791709522;
	b=EQNvIpfRbfxcnk8Fxprm1iB3592M2YN4/oCLfo9Up8gKmOTPJzTzlnH6OZ/PV14gBHfz
	 8jWFV4aNxxWrIgktOU6OHM3HM3vcXfFdUtFejuxTKom2MA+v20XEEOYy2wdzzOIAPoPcY
	 K4YLQX7jSXu5ozAZKJKbuV+ezennT3tocX9qehLezOPSTkHoTnYSpGovyHkDCx3z/zTV5
	 39XGf+8Stndg6q8of7NGQ0QWU4O3WkPX4mzDE7eLphHhF2rhWmpQaUMG+OI9+LRNz2YS4
	 5IBErw8qdhHeeCz1E0l9HO45cRQyi5Ryi3w5qiyWed65MQkhb/0B8KYiSCifTxCdyFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791709522;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=GyJ1T7rRqfS2X5ora2beMNGxpQM11nF3yh0SVpaH5vI=;
	b=b4qHYNPa95i4i4l7pxbO1rp7OoC7l686n8sCeWI2Z4qsPOz/JxbMQDNHcx6nIwXYj+1j
	 jS9w/XnWFh2O6QUOWdltKKUtsw+gRzcU3GBOJF0zU2KrLIdfbs1AiuxOf0QZ8yaU0Ajzn
	 D5OpcS+n703+2Crk0+yCzv2jmJg3EjP5H2UycgwumcermEPG3LQKuUySie10wLavlKKND
	 RQDetWqVY8/A30zefMJR216zjgu/6SwOyRXd1Bpoo4DE6OxrPnmSnspjSRgln9PhcUUYb
	 SKuE6J+ezEKYCiQqZHU/qIam4nhLmCb04pDjsBSjtiHBYkAN0NaYIJhe1OoFg8QzI4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791709522;
	bh=GyJ1T7rRqfS2X5ora2beMNGxpQM11nF3yh0SVpaH5vI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=dpc3PrbEKteIh9odgU2akhq0rONRmgXAjgBWr5Xgo6+6LvY7BuuUqSvje2LvkEzgr
	 ZPpphhGacu6Dpwwx16zDzdtGsAqqdpYIjIzDXcFm0dA9fouVKBMDWX0FEKN1NMKaTS
	 WQpRAuNrcOJ29O4mWcp4BMtb5G7sxpBv8RM1KPMo/8hEb0pcob6Dg7ran6c0D8o8Gy
	 +QtBV4M4J5x53wyvvLXTgHegzyyvOjNj/M0Y98o9JilraEKv6rw1CmUWYlY4DMf1w+
	 Hx3atV/VAgVDZX+RAAhCjKIGnzaRJMY7HABjecwQCrntB62H4tRQTA0r6lCzE9V5wk
	 6XMeQNQmlVkSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CB480DCA;
	Sun, 11 Oct 2026 09:05:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37D9B380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29BE480DCA
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apreBc6slKbY for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 09:05:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2AC0880A9F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791709519;
 b=EWFWiV0YbDR+lEPkMyvExM4qzCtW/SSUAf1KWe+FcwNn1kaRivpTBshKf/gucMmFPJdn
 9kEtIFPiL9c88O5DRHFupBbaw4u84OkA7DB10zcgIs1d5gpVWgP+TFdj3yLbrGK26vVY6
 isSJIhG91EB68Gwimd4E7JfRdLBcGqiXMLrGQjX8C+r3wAb27kj1semwHih1t15TePs7J
 4mnYVxt4vy/INELVj8wT+nz+PjO/m/h0heW63nSokrb4P4C9adjqdlYYs+5yPc9e8cDOF
 4Naf3do4ncpeNpHfD5IsO3VlQOSxUKlajnOobRHhr087Hu5TMp0/wZvdjy2a0SdC+kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791709519;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=+lO1PSH/RZfjLz01tthRRuJYRQDIrC7PXnw8l+P/9jw=;
 b=Pgmy2ASWmXohERD/RnnNjwm/9PkWHZhMCGaUBgtwOncbCr1Z3zlG3mi1Kl404RP5MTf7
 07Kz1CZvbvbVaG/mnJJhull0Jy2tgKnVY+7wLkcG/Zk9HDVbjaT4EqYdbldgmrEFGqqo5
 XTrUq4rlx/9eBwBpUo76DY9Tr/6kIsIb2N5hpodQTISeSPik7VWlWaXH+TkeuJTgyUf9G
 Pef6EY4qkYP0AYv2kEo1mhYfcrZ1X4r8aR3i/4ppblF55kmau3kRj9CLyf36T0DxrG+qG
 HbHNTd7ZKtdxckEJsqmDBVeepP/wULYZg0vppBBdRfwzAVwlrXNOm58WUVECqt3u64g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=lM+9goO5; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AC0880A9F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:05:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E672B978F6F; Sun, 11 Oct 2026 11:05:04 +0200 (CEST)
Message-ID: <d053673f-e104-49e8-91c2-8b4900b6c7b6@rnout.be>
Date: Sun, 11 Oct 2026 11:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, Peter Korsgaard <peter@korsgaard.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20261010124237.92754-1-arnout@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20261010124237.92754-1-arnout@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] .b4-config: add patchwork configuration
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/10/2026 14:42, Arnout Vandecappelle wrote:
> This allows maintainers to use b4 to update patchwork.

  Since this is only relevant for maintainers, I decided to keep it out of 
b4-config and instead document it in

https://gitlab.com/buildroot.org/git-hooks/-/blob/master/MAINTAINERDOC.md

  All maintainers can freely update that document (no need for review).

  Regards,
  Arnout

> 
> - Use git config --global b4.pw-key <key> to set the patchwork token.
> - Use git config b4.thanks-am-template <filename> to point to a template
>    for thank-you mails.
> - Use b4 shazam -s -k <patchwork URL> to apply a patch and set it to
>    "Under Review".
> - Use b4 ty -a to prepare (and optionally send with -S) the thank-you
>    mail, and update patchwork to "Accepted".
> 
> Without pw-key, b4 doesn't touch patchwork at all, so non-maintainers
> can safely keep using b4.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
> ---
>   .b4-config | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/.b4-config b/.b4-config
> index d568669864..9fa518d02a 100644
> --- a/.b4-config
> +++ b/.b4-config
> @@ -4,5 +4,9 @@
>       send-series-to = buildroot@buildroot.org
>       send-auto-cc-cmd = "./utils/get-developers -e -"
>       prep-perpatch-check-cmd = "./utils/check-package -q -p -"
> +    pw-url = https://patchwork.buildroot.org
> +    pw-project = buildroot
> +    pw-review-state = under-review
> +    pw-accept-state = accepted
>   
>   # vim: set filetype=gitconfig:

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
