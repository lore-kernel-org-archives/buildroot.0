Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29C8CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 08:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925BA847A5;
	Thu, 14 Aug 2025 08:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxzcyXDUsdgf; Thu, 14 Aug 2025 08:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1761847A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1761847A8;
	Thu, 14 Aug 2025 08:43:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C84081B5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9CE3847A6
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0_l_xSNDoXH for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 08:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45E4C847A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45E4C847A5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45E4C847A5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:43:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.132]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9XF-1uuxsR2Wyf-0034p4; Thu, 14
 Aug 2025 10:43:06 +0200
Message-ID: <39065671-f8bf-4472-a82f-9a8decd35fd4@gmx.de>
Date: Thu, 14 Aug 2025 10:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20250811160210.3238772-1-fiona.klute@gmx.de>
 <da0d7e1f31bec9ae102316b65dd85fde@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <da0d7e1f31bec9ae102316b65dd85fde@free.fr>
X-Provags-ID: V03:K1:3nE9/bVqCG3Sd2mKNs6V/V4Ap4ea5kmNqfAwVLE8Ws2yzf32rL+
 bc4zKiwbTz8Nkz5MWOhiXbK81mJ7lIjratxY3/nVVgwzzWIoXdgShMTeE/bqR8y98QXxYYT
 sMMMr1c19tnkvwMSXEuUhgxgZsy4X+q8/EA+pOrAwWqJtzqHhDowfkhbe3+ywidDoarEJ+o
 NGXZzHDUOO+M29iDKKRiQ==
UI-OutboundReport: notjunk:1;M01:P0:k2iwiEUuE6A=;u+Fv538ZBH98J/MdcWgBL5Uq8zU
 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
 TjBGZRHG4cUAl4z+CsyVYGsAJS+W
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1755160986; x=1755765786; i=fiona.klute@gmx.de;
 bh=4mleN+gBuYRAxwcO50/Uo0Yz6Q4LZzGvRoN3I5vQgyA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nsROI5xKIaEDHOwGUzaPvRcpSQTV3G0RY99xas1K3MSpEklE1BADwlVF6DsDXnk4
 waIYb0FK3wGsvwDqWUl49SfSvcU6Bj1mc1GGqHbjIZHq9ZxbO4k9LeKRx0qNEjJH0
 JuO/0WhD9tZLraFe3i5st0kSoQG1SEKYsnjX+pIutIK+W1JQ7Dxhhsb2U6LZfWI6D
 CAmyqyR/kZIGEV7EgCHvldaYcumjcT2EiBWuJSTAuuXTK5n6qVuY8UEI/YC0dAkc7
 CoHZUjNOLBgiN0kDbm1BcjGqO5hE0/maWX14LdLm7Gbb+b4eJWNBsfaPTNsvlOtB9
 rTFd1WVxrUuhnU/UDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nsROI5xK
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pyroute2: bump to
 version 0.9.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien!

Am 13.08.25 um 17:29 schrieb Julien Olivain:
> On 11/08/2025 18:02, Fiona Klute via buildroot wrote:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> From 0.9.1 the pyroute2 core is async, the synchronous API remains
>> available as a wrapper.
>>
>> Upstream changelog:
>> https://github.com/svinota/pyroute2/blob/0.9.4/CHANGELOG.rst
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> 
> Series applied to next, thanks.
> 
> For info, I made few minor changes, see:
> https://gitlab.com/buildroot.org/buildroot/-/ 
> commit/786557d859dba7e52c883e5215e53e93fac13b88
> https://gitlab.com/buildroot.org/buildroot/-/ 
> commit/7b3bf7b29c49848dd29d778f4041dd90cd5556cc

Thank you! Is there some guidance on the expected style for tests? I 
don't remember seeing any in the manual, so I tried to follow what I saw 
in existing tests both with the formatting and commit message style. 
Personally I'd prefer f-strings over either %-formatting or 
concatenation, but I guess that wouldn't work with old Python versions.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
