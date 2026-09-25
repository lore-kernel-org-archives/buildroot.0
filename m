Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97A6C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B206760DC6;
	Fri, 25 Sep 2026 14:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABCAGoe7eKHF; Fri, 25 Sep 2026 14:45:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5B96F60DBD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347516;
	b=dXKblle4bMaqFGRObZT0C2VZjJVtziShMrWRuSa0+nW7x6JZrWg/jg8JE3ZOLsa335m2
	 dcKyu0+oPXnPDsQZNGQnFKAGESZ1/9nDd8p4uIXChSZMRmwcHA45FIHigbmZ4XUMhnL/o
	 1urwesSk3D+1Qq9O3/byh3ilidB+kalSKOE3EEzwWM3UCTZ1VSV7KBJisC5Bg9xPz4lig
	 94yhVnIizZhuEGYFAlOvd1GpeCj/AativCPLgpO9SijNlAaUFtbNiqqWV3R4cQ3sv/Rxn
	 2IgvBYXpkw6sxb6FzHWCSEmdXvqDemNnKRl4xNNAZiBHyO2fp4HeASruMx4EDQte89w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347516;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YqcLNM43cWwSxlNTO35Aw6Py43FRGmO5k7SsjhNSVhQ=;
	b=mY37bqKdsCaQe4kSoHC/2yp4d9TlTledgF3iwdsF1a1YucZCkNLIrl8M1az6QzJEcHUh
	 308617JXK0mWNDSj9+NbmqVKGZ+gzi3HjUudvtD8XrWPxdIOjtLzrVOuitlTfKbxn8NK3
	 8nbfmnMcR4SJ3VjxboI1D75xYmE2pjX/5/b9mshRUoVrMjabjGlFJAKCmMfzRhu0x3lz/
	 6RRRrwjKTHjBiJOVCIfWNUIXBX8qS0Q387V1gw4ZldtAPit8pTPyCC7l46sZThuuRVxNP
	 i8AjMnHedGddg700Inx92e9etHX+2IX7zu/L+TVlFoYL8rgDOrXUIMH6xlF9pjDqhrw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347516;
	bh=YqcLNM43cWwSxlNTO35Aw6Py43FRGmO5k7SsjhNSVhQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pce+uJ+9DwqEIkajEZMTacX9j5jVTjmuGZlqbNup8B2ASqNqjubXwSQztPaZj6tfe
	 4u2z58mU9t5HiMULywkZOj3gptuk/qoXnGriwJDUF5lOtVrB5O4jC9CWNnMIpJqsRs
	 RuZ808hkuTZxJ42q/DX9t2SYOdePfBOW8mJa3p4J6s8Re61iRVDTcbeo0NDeGISw5k
	 xUiOk79LEi18Lm9OSnaMk8NSBiQzB/01DHwn/dtJY7icdt/XTwg2eGHVO6yZI7EOjv
	 krMMIlecpoZdjfd3pLBz/j6tWTzj3vUtsQd8PsmDOWWRCMqvbfO0EpzsEAvmX4bByD
	 +/3k32NgWR30Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B96F60DBD;
	Fri, 25 Sep 2026 14:45:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D278334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1338481352
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmtPLvYFnWsk for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CB0D481359
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347511;
 b=A/q7ZF+jU5saiYZFrAR2RJ5YuzaLH6VEtT/h2EaE0spx23Z2hK8IRb2Q5aB272Jzn9fA
 kAQXVM13wguoFY0K5xMu6Y+4/539SNnMSIhj8BLOUl320oMvjP/4/0bbQadgcBji5YEsZ
 0q3B2zoRXNfTAgXE6PSLFM5uToMc8L7VsvxgjwWkh1GaD0OzTasZUxCWDEQFY7PnzsyBS
 lgpw1S0LxInMT6BO7JXNNDmSEQZOXGw0TD2rVJbw4tKFsKYWB0aJng6ErclUD1LMFRGwu
 a4HNQUuwLLKvx70webxA8pGbcnqgf6pHePihbyVEM84kWkgwwkFSgimgQ4KFVdIywEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347511;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=/s+k6hqvy3UZ4Sw0HtCr56BA7dHZLhk4Le+MZPoF0Ik=;
 b=WOb0wQjFeQCNV6/22B6OFHf1cQIwD9SiZjLJL2EjHXQuAvoRC1zI/lhUDsQohqBSl7P+
 F9sUh01ypxCs06PI1LweQcnux0TsCXx1zCPEomxEnUYAq4rtTrFsoPRDi9TuDwwaIGxCc
 wUmw8Jwa84c6fh294jmTuWSzPu1BEUs0+nWS5VyC9GY/2V4j3tfpsyiG4Yx+Ps9ZNbyLc
 AzPCA2NFJXyfHb01ml8ri9R27EV3viwamve9IGFRCBPACK/2s5fd+POqtYYnh2/WCxjQh
 LrIF2E9j2aBYCNh9B8q7xkOQUz4X+N2eCn/YJIthuJxeC6Dm6/chG3UBqnTatXUx8Ig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JQ6R5oo5; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB0D481359
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:10 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843c3ee4cfso487466f8f.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347508; x=1790952308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/s+k6hqvy3UZ4Sw0HtCr56BA7dHZLhk4Le+MZPoF0Ik=;
 b=dRGRCIyj4y618D80KGTgBHZ8ErtWlwKIehUoitvJPElO5AH/0vJN99zXx6rUPO8IpW
 10+508FZV/WwceaBJ6vf/VT+KTlUFKwpoviXE2c9SBiAMriwObJlefyhpYf86gS99oft
 Hmm1X20GmJcDiNLAR0VgvzCa0/G+V+kTaTWEWqy0X7Xk/kJsFlHFJyS2AYGFYeMx8jl7
 I82lVr3U8NJof2HFUn5DEA+mkN878TpVod9Xvb3ygno4tTMddbnThAWEu7t5gNlZty/6
 69iPIWE5JvNGQnxmKDqwylofvtoExlRCs5FN4W2EASUQlctZq6cCrTkObLPT0/o+RVyT
 7oGA==
X-Gm-Message-State: AFuF++m4bohJ1pWpHElO3UOSi/xFT2iT8LBnk0rrF0T65aJKdOaysqmZ
 xrpg88twFAfhIUwy45Yj9awlVpj8/Mc+zwgSmQ7oAPwIFC9dpXGa44g4cz8pb07Opavx17FyYa9
 yyPNotJtQ4w==
X-Gm-Gg: AYBFou0yFQVGgG7fiFJvTIGfzm6aZDHen5HGx/0zQp7R69UQCAux2Xau84NVc9wwdJV
 nW3DKWctAF4nhtw3zTxxEY58IwCtHdqLpKrvjqsyNvlbI9SLnVYDhJAIyGGK0xYUj+hq7BqUBr6
 sfkzFDew4/y+y1+PlXENGVM4cvKR7rvTBmFf25dibzbABLq9iF2MN8UNpEc0BFaCDIblPMi5Wd+
 qrHtd5oe8k/s3yAX+lI7h51r+7LxUk4eyXl8HWYZiA6JZGmWiU9bmJV3lw3LF4VYWo/UbldATzE
 FTOF7vCwRCu0QzVRy8waobRrLcH69wMWPoWIjd8zcAzbv7gfvLnF/4nrtCDk3rCv9qBAlBia1ZA
 r5iIg4zJ6uUTw1V/fKo3cynEFWg+X2N7cDYfMl8+FUK+yjDfzfHPn/dmYyk1s9FdDCBInvLWfu6
 PBgCNvJ917vbsmu7FEu7x6N7NsGbxsiJrnZvFDRaIMkpzLLO/DQvghSTgxM+2myZYb6EhcFzNOD
 yB5w76Umjzpzyv+jPXnuvR+aG0dOunb7Y58V8PF8A==
X-Received: by 2002:a05:6000:2306:b0:487:f81:1d3d with SMTP id
 ffacd0b85a97d-48871718d1bmr12898260f8f.50.1790347508450; 
 Fri, 25 Sep 2026 07:45:08 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a355d96sm8484804f8f.17.2026.09.25.07.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:08 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:05 +0200
Message-ID: <20260925144507.4097265-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915095653.279455-2-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/zabbix: security bump to v7.2.15
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Zabbix 7.2 is EOL since December 2025 [1]
> 
> For more info on the version bump, see:
>  - https://www.zabbix.com/rn/rn7.2.14
>  - https://www.zabbix.com/rn/rn7.2.15
> 
> This fixes the following vulnerabilties:
> 
> - CVE-2026-23920:
>     Host and event action script input is validated with a regex (set by
>     the administrator), but the validation runs in multiline mode. If ^
>     and $ anchors are used in user input validation, an injected newline
>     lets authenticated users bypass the check and inject shell commands.
>     https://www.cve.org/CVERecord?id=CVE-2026-23920
> 
> - CVE-2026-23921:
>     A low privilege Zabbix user with API access can exploit a blind SQL
>     injection vulnerability in include/classes/api/CApiService.php to
>     execute arbitrary SQL selects via the sortfield parameter. Although
>     query results are not returned directly, an attacker can exfiltrate
>     arbitrary database data through time-based techniques, potentially
>     leading to session identifier disclosure and administrator account
>     compromise.
>     https://www.cve.org/CVERecord?id=CVE-2026-23921
> 
> [1] https://endoflife.date/zabbix
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/zabbix/zabbix.hash | 4 ++--
>  package/zabbix/zabbix.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
> index 787a0acfe9..f312dd4a49 100644
> --- a/package/zabbix/zabbix.hash
> +++ b/package/zabbix/zabbix.hash
> @@ -1,3 +1,3 @@
> -# Locally computed
> -sha256  44b51a09897e83b7d25cd706f88c0462224991d780881d6157d88fd804cc3a6c  zabbix-7.2.13.tar.gz
> +# https://cdn.zabbix.com/zabbix/sources/oldstable/7.2/zabbix-7.2.15.tar.gz.sha256
> +sha256  b7013063b9c6256a185f6e6001eff7d43b831b183aa39133d6ee524d0570e85c  zabbix-7.2.15.tar.gz
>  sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> index 50bdfed609..09673d43c9 100644
> --- a/package/zabbix/zabbix.mk
> +++ b/package/zabbix/zabbix.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ZABBIX_VERSION_MAJOR = 7.2
> -ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
> +ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).15
>  ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
>  ZABBIX_SELINUX_MODULES = zabbix
>  ZABBIX_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
