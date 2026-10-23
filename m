Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D1606A32C
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cz5o6xT7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73B3880D4A;
	Fri, 23 Oct 2026 11:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBAg2Kc3G5Mx; Fri, 23 Oct 2026 11:23:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 876E680D64
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792754638;
	b=mkpmqCq3zQGdCTnaa1UKl2h1/2eeHvF+YS1vh4kr/A+fL3gmm+WzulqX16LWhfXb8jd0
	 IVQCNrtA92FRCLHUbbwKWeEh0y024MD6x2bC/9zSRkiLYlhkPYBieZCETZGv6Z0c+/OlY
	 nahKsYyKDp/yfewx1+1riGYDj5Ad5jeOQeofGvXoUjcfNwSrhxnjVuV36GlTfbHjSXAz1
	 1nwokc2atHhe3hPmBJMjgfHD68d2OSJspR0eFw0LLEaI431FBSX1gtFaP6TOYs21Xs+Ig
	 gjz327pcjIbti1SNz8m6VqT5roJm4UGFC2bdSs8LXflVOaZQuXqa7IgoXpwATyDKtMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792754638;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SsyvD1P/wp2TXLq5ATWYwarLqTls6/Oyth5wszjMXRs=;
	b=OGu4jUyS5SgPQ9t1re8JxQh5C3gjfJXz5bW7+SrPfSXHHfvn5PN/Oxf4z30kq52lgd78
	 PTrQikfE3bKxTJ0SDBpJsVmdkracTPPi44++uSA0D5wndeHxzXzlZ5bIn98FcfXpAWzp+
	 08CUSlg/WwWH9QvZRKSm3aegp27sz7OayNWQmCgY10jExmIykiMHWkmiLT8CBjEDtR217
	 D8aoExgjENti8M7QdeZzNcza8hBMrvxx1gdQIKS1vOdFW8SMlYprVlhaqs+yoUYERSStd
	 LL5UrwtX2KXx9LGns9zifVvRu44Lkk1v4VyTsLExPfbQiu2vFc9rtt22/y5NI4Jy33Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792754638;
	bh=SsyvD1P/wp2TXLq5ATWYwarLqTls6/Oyth5wszjMXRs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cz5o6xT7jv93YOWm3UsH0b1+UsnKao0xGfgY9Ufi6DZ4SVYHIZwIh4Y6gz55tIPeT
	 hcirfiWpb4wAvMeZvDfiPoR5HqG8I4H7BKUTnZdZxZ9o6EjR25leMyztj0vqcJIhf6
	 n3cOddCBlU6/hZ4s6ui3v4vq1tUvLnzxNxBevo9cI+1oNy0ih9griJZola1OiNGj4S
	 wRhailPZqaw5bLcN9+iIzmcLRXUWpKDSbu6QjImcMVe9DmU9XofvCk/X2fXfpmo1cG
	 7V+Bv6I28L6I/XFTEcq0CyZwb7OYu2GTMV4K7uMmbG5X4xXeWshXy8JfaVjWINXp3F
	 JZBmKsbbDq2ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876E680D64;
	Fri, 23 Oct 2026 11:23:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 295503C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B7A960616
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSJ-lb2AYqC7 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 11:23:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2ACFA605FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792754636;
 b=R5Jl/BQ5MGm6hkQQmmsJ1LHb23RczngBMbd3Fe2zDvqSYZSRM5S1lqC8X9l+8YNq9Js2
 0y1RD6Z2NISMjSnbgC0ZSDo83h90ptpzdPfc2scQowwamdBi0KTStwQhIKL8q62y239c7
 72WtG/KfVLrwium5mspNufpu7kfR0UjtC5hLSr8cntPORTAZCcNCLTiYNGhv6YGKmekVO
 djA3iiwTDYEZbA5oX/suto+D58CnZusblmajybUacdwgVQ08H7McSTr9G3uvG/nh8v4uD
 3icets0bln7uHx+bktqYOFjXq39jUtSCgVvGOa4PLl2C0qaSki6QK1EnKadiAfstydw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792754636;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=IUBqSIsQncc1vJffgaMl/heWN+5nfKrnjlgTDIbh5n8=;
 b=BVI31nTP0BAF5wY+DpAUJxytfmldP9VwVJyJmT6y+xHof0Ndn+MOdLZFkuCTQn/79sIS
 Gzmg8PRhM8pT0mhDruEQYWSwyZtPg0RABkNBKAgfpW7300K6bz9jFKYsDeF1PHJ2wVB2P
 fe2Ybs8bt6E1eNwtnSA/3LXQEr1ix9f/P8vaR8HbgIzAD1h4JejFg9Pc+btxZND/9/WhG
 y7N9RRQ2tg92nHbSlL6mnj68JZx7xS3WODisgtN0HyzUZ98G1f/DP0L7BRsyCKcQpnQR7
 ACV2gDdpo56ckLPeOCO63BPBKzyFh+nhcNrvcbG0pIXQxR1Eb6BR/0sj3l9Zc5DqPyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OX689vJE; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ACFA605FC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:23:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 94B2D13F88E;
 Fri, 23 Oct 2026 13:23:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 13:23:49 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 13:23:49 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>, Arnout
 Vandecappelle <arnout@rnout.be>, Mark Corbin <mark@dibsco.co.uk>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <87zew6t6is.fsf@tarshish>
References: <20261020202639.1094960-1-ju.o@free.fr>
 <20261020202639.1094960-4-ju.o@free.fr>
 <562ad192-b09a-4470-a02e-e3b0d5b2af00@rnout.be> <87zew6t6is.fsf@tarshish>
User-Agent: Webmail Free/1.6.20
Message-ID: <c3ab76847e4dd0d716ea7cbaeeb5e8fa@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 4/4] arch/Config.in: change default target
 architecture to AArch64
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Baruch, Arnout,

On 22/10/2026 11:43, Baruch Siach via buildroot wrote:
> Hi Arnout,
> 
> On Thu, Oct 22 2026, Arnout Vandecappelle via buildroot wrote:
>> On 20/10/2026 22:26, Julien Olivain via buildroot wrote:
>>> This commit switches the default target architecture in 
>>> arch/Config.in
>>> from i686 to AArch64. AArch64 is now one of the most common
>>> architecture on embedded Linux systems. The default CPU for this
>>> architecture remains the Cortex-A53 (Armv8.0).
>>> While at it, this commit also refreshes the .defconfig to:
>> 
>>  Do we even need this .defconfig file? Isn't that a leftover from 
>> very, very,
>>  very old Kconfig?
> 
> .defconfig seems to be Buildroot specific:
> 
> support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch:
> Index: kconfig/confdata.c
> ===================================================================
> --- kconfig.orig/confdata.c
> +++ kconfig/confdata.c
> @@ -30,7 +30,7 @@ static void conf_message(const char *fmt
>  static const char *conf_filename;
>  static int conf_lineno, conf_warnings;
> 
> -const char conf_defname[] = "arch/$ARCH/defconfig";
> +const char conf_defname[] = ".defconfig";
> 
>  static void conf_warning(const char *fmt, ...)
>  {

This .defconfig file is still used, when running a simple
"make defconfig". If we remove it then run "make defconfig"
kconfig fails with error:

*** Can't find default configuration ".defconfig"!

Also, we can see that without the patch changing the default arch
to AArch64, running "make defconfig" generates a i686 config.
With the patch, we then have a aarch64 config.

There was indeed ancient leftovers in this .defconfig file.

> 
> baruch
> 
> --
>                                                      ~. .~   Tk Open 
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
