Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72C8EED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B3440489;
	Thu,  1 Jan 2026 18:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PF2R0TOjUpqP; Thu,  1 Jan 2026 18:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C80403B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767290685;
	bh=a8Il94n77l4y3L4cpHFmmAfXT7W4NRzFETMLlfn9meo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=fmQfs535aiAC1FJPJykIJKpVSp1FuJA8kXzZxz2E2unDqy1l0RbvoDH+l9IrVfga8
	 NDJyjHKjrcVgdfeOHvR23UysXJbcwqwc+e6hwPcelekiL4VJ1Bz8l8wvCmzz6bMAAl
	 2ViTGHMRJ5UOAQ+Tdin2COFLRiWDZyWWOojOib8wgzuYaFdEdnmdXX4UEge95zymh8
	 /tiV0WgUdI9nYXANP47jT1x6P73DH98tJsX0iYndAx0ShiIkK8huPC05FALQ548x5A
	 YgKZNlrXabgcFR0gbxOiQ10mz46ED3bWc5gI+90WYMztdp1hM6CAKjU5fpDWRbxtTK
	 jkhksF/mj0QOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C80403B6;
	Thu,  1 Jan 2026 18:04:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2790B19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E4FA403B6
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZZrJVHeXpc3 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C24D0402EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C24D0402EF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C24D0402EF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:04:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.28.192]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QsO-1w00go1iTu-014JMS; Thu, 01
 Jan 2026 19:04:40 +0100
Message-ID: <0868be2c-8a0a-4775-924a-140b9d620f99@gmx.de>
Date: Thu, 1 Jan 2026 19:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20250929092431.8974-1-fiona.klute@gmx.de>
 <20260101181830.35ccf7c3@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260101181830.35ccf7c3@windsurf>
X-Provags-ID: V03:K1:qxSBWtSXoLgcbn2kff17uz9k8E5p7XWnjLRd8sJAoKicz5byoqd
 J32vwccs7Y71aBteZYqLGwtKrP5y2Ykm3Gqj5nlURcTsgHeE628/w8lgeWGG9OVAKDTjPpd
 PqcdeNZjNoj3lR3481Xpem5dzv5PlZxtrSHrDn4Tn1UZy7LgsefohxmV1bH0l4In07jRQjU
 23O8kG9+SmlJSS7yOKV3g==
UI-OutboundReport: notjunk:1;M01:P0:xs4O9lH6OsM=;TCiKX0XVwY0LdQ5/rBsPMVA8eKa
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767290680; x=1767895480; i=fiona.klute@gmx.de;
 bh=aK6fq2KMvlNPCyhWBt1MmEK/E2vQN2ReB2f+pUqvkqg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AlkzYExIvtZQkoBHdYLgKz7ErwYW57bpWxcJ2LadGNMxW1G02dcNCdCtf0XXXLzi
 4pZ0xAfjoXFW0Aqff2fziQN6pI7qjyiIO6dYIJUdexh48dM/QlyX6LBjpeOV5IggI
 mkWK7r9MdzrhzSYZRtUF94Xk5CurWiBC3i98U+271HfQeTYFQsELNfqX59YDs6qpK
 ZYTPQLnlaMo69kMHbNIx52nKOLwfVq1c+rlGdWishMncCluGcprvGWec0khV44Ncn
 8qbZqMh0rHFBDtBeimRkpoVmEgLWCAFneZemIkfNuPZidURUa2fM0QX1FNbUIkrUb
 O/nX9LcKAxtGPi2lOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AlkzYExI
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: add check-package-external
 target
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 01.01.26 um 18:18 schrieb Thomas Petazzoni:
> Hello Fiona,
> 
> Adding other maintainers in Cc: to get some feedback. If there's no
> feedback, I'll apply as I don't have a very strong feeling about this.
> 
> One thing perhaps that bothers me a bit is the naming, as from the name
> I didn't really understand it was for br2-external, and I was wondering
> what this concept of package-external was. But I don't really have a
> good name. "make check-br2-external" lacks the relationship with "make
> check-package". "make check-package-br2-external" is a bit long.

Not sure if long is a problem, when working on individual packages make 
commands can get pretty long too, e.g. "make host-uboot-tools-rebuild 
world" for testing a U-Boot env file. Adding "br2" might be a little 
clearer, but I don't have strong feelings either way.

> I have a suggestion below, though.
> 
> On Mon, 29 Sep 2025 11:24:31 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
> 
>> +# $(1): br2-external path
>> +# $(2): br2-external description
>> +define check-package-external
>> +	@$(call MESSAGE,"Checking packages in $(2)")
>> +	$(Q)if [ -r "$(1)/.checkpackageignore" ]; then \
>> +		ignore="--ignore-list=$(1)/.checkpackageignore" ; \
>> +	fi ; \
>> +	$(TOPDIR)/utils/check-package \
>> +		--br2-external $${ignore} \
>> +		`git -C $(1) ls-tree -r --format='$(1)/%(path)' HEAD`
> 
> Could be written in pure make I believe:
> 
> $(TOPDIR)/utils/check-package \
> 	--br2-external \
> 	$if ($(wildcard $(1)/.checkpackageignore),--ignore $(1)/.checkpackageignore) \
> 	`git -C $(1) ls-tree -r --format='$(1)/%(path)' HEAD`
> 
> (completely untested, of course)
That works after moving the first parenthesis in front of the "if", and 
I agree it's nicer. I'll wait a bit to see if any of the other 
maintainers have comments, if not I'll respin with that change. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
