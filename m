Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D830C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D005981A15;
	Sat, 13 Jul 2024 21:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mMp-vVE488r; Sat, 13 Jul 2024 21:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7A7681A30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A7681A30;
	Sat, 13 Jul 2024 21:11:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3EB91BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FD7E81A15
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8r-idKAhwhNo for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:11:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C96D8146F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C96D8146F
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C96D8146F
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:11:14 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266b1f1b21so20484445e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720905071; x=1721509871;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CIOngKmi9REl30ClKACsbMVoqAdXHdt0VKA25j4rwKA=;
 b=WzSjf/lwQIRvieCwoRcUJTm6wWcnGSnLCAi3w48ZtxZkeQIxzwxZtdcTPTW1I5taDT
 cS6lWTaSPWLP5jtz45yZu+7jpQ5GC94dtJG8+xZWyP1otBaFhWlQOkNj4FKbQQA6IeOu
 3bVEuIKesVBPuwiy86J3ILs0HBrPBEBIyR4wbfNSYCFuDF+7cLcPo9sxiIAsHqYXdyAT
 PWo+on4tDMx1sWoV7XNp/drtb+Tr49xEeIp4O3os/ZtqcwPOQJ1yCHki04G81LoSLngh
 Xn3lixYueU7mmdEm7Lj4hlsHXO7d44MrFssw8rXG5vY5p2emBp6KaT8xqdrFtRFb2gWE
 kfOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG2Gd5+4IFdcDaWCRDblQdg4qZxszTmVpXCK8ggqLp08mXzMoH8OxaFAmlisqVXZkBX+I7xLHl91jPNmOlnM5v/j5W4uxt7A==
X-Gm-Message-State: AOJu0YzSqY8TC84/xfkWzA8sW7wtQGDcTY9ex18SWdTdf6vcz3rJpazk
 +C7Czz3xCbRa37undUEbNgnEMUyqh6nPoqGUIlefQHP0o0mc4vVj5C0JesgGRKO0f9xFmGzxAFF
 9Jy4=
X-Google-Smtp-Source: AGHT+IGzr8+4VFsrwezxWQv9w86DxLIn4u4jfHM2CxmwQjYmxYqZd9dYxTPQPZ0ZVMCidj/0BT93hA==
X-Received: by 2002:a5d:6346:0:b0:35f:24f5:e597 with SMTP id
 ffacd0b85a97d-367ceadb1afmr9110910f8f.65.1720905071115; 
 Sat, 13 Jul 2024 14:11:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db0f26esm2366861f8f.116.2024.07.13.14.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 14:11:10 -0700 (PDT)
Message-ID: <17a32325-e8da-43e0-b05f-638255ea0fbe@mind.be>
Date: Sat, 13 Jul 2024 23:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20240607134848.2974069-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20240607134848.2974069-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720905071; x=1721509871; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CIOngKmi9REl30ClKACsbMVoqAdXHdt0VKA25j4rwKA=;
 b=LgcE8Zz9HnGU1K4OLf32J8/3f1U9ITNWGNPkB89UCRzxWxEsu8l8/PosA1dlZUBAA5
 yeNP2dU+FPcx2N/Ocz0TMxgi8ZVrfVcbOoekzqG7/feDLwf1L/uiLzF0eHIVqyJOrCLt
 cvLz7Z9rGzVAlhv7yRD/etL5H+C3WSUkqws6THdB4P0J2t0lTu4cnloe59R6Q9/ViOn5
 foeqWZ5j5FwPmS7jmu6b7VtMyK9k3FmXZR+6FWyCSw71+iraoobLFM4PgJXor/PsONR+
 HBeTgHAWxpbCNi8r5iuMP5/Q9XMtdLEUvfU2iAXHCIxKSdW1IrOd9xvvXxfq3c2V7sFA
 sJ2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LgcE8Zz9
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/checkpackagelib: really check
 variable name
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2024 15:48, Yann E. MORIN wrote:
> Currently, when a package defines an unscopped variable, but its value

  I didn't know what you meant with "scoped", I translated it to "prefixed".

  Applied both to master, thanks.

  Regards,
  Arnout


> contains a properly scopped expansion (or even just the name of a
> variable, there is not error reported (e.g. with the recently fixed
> composer issue):
> 
>      BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar
> 
> The reason is that he check is done on the whole line, rather than on
> the variable that is being set.
> 
> We fix that by really looking at the variable we found, instead of the
> looking in the whole line.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> ---
>   utils/checkpackagelib/lib_mk.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index ce2ab5157c..831a8afe61 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -312,7 +312,7 @@ class TypoInPackageVariable(_CheckFunction):
>   
>           if self.ALLOWED.match(variable):
>               return
> -        if self.REGEX.search(text) is None:
> +        if self.REGEX.search(variable) is None:
>               return ["{}:{}: possible typo: {} -> *{}*"
>                       .format(self.filename, lineno, variable, self.package),
>                       text]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
