Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE597E9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 20:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BBF40933;
	Wed, 18 Feb 2026 20:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id keQsGe3WpSjx; Wed, 18 Feb 2026 20:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BBF240652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771447306;
	bh=MnCwPvE4t/eOz4Ry82G5cbdaeLyZgmhpvfGGgHuNHfU=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2NFc+hVNg9Ib3HaOs4TR6Maybfoekc67rbALb9J5E6Zd0M+Loerivqac0EohJvqd
	 yycdI+jVnYwaf54aL+orPKpq/eBlC9s6qu4Lw7usB6l54aUl6+p5uUr+A2HSmMfllo
	 F++HMHa4RRFJ4qlEN5SE8IcB/tqj2oUnupEVWQrdn0xFAP5Sp02Yime/JbMkbbSFfC
	 uIA1Pq75Wo8o/ZaSayJM9zn3Y6Or3Sw5oWBUs+aoVtW1I1qvh48VzIaZvH+YtrxRnZ
	 UTJEEmR9xr9fN4ivudz5e6oQWKJ3purcuqrolEmMKAGYuFp0PgF8006uNTjUZ5K2fQ
	 B9isf8zq1ZPZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BBF240652;
	Wed, 18 Feb 2026 20:41:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83151206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 744D360A8D
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnEWKLIXYI4L for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 20:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CD2260782
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD2260782
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CD2260782
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:41:41 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id soMbvE32SclBZsoMbvHOrF; Wed, 18 Feb 2026 21:41:38 +0100
Message-ID: <574c9977-3015-42f3-b39b-87779214d19f@benettiengineering.com>
Date: Wed, 18 Feb 2026 21:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
 <20260210000739.3810940-2-giulio.benetti@benettiengineering.com>
 <cc4a08444f2ae8c06f48c78473bd19cf@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <cc4a08444f2ae8c06f48c78473bd19cf@free.fr>
X-CMAE-Envelope: MS4xfAl0lfgu1Dd8w+5lsLytlmYzzP2FDJ5XDOMecs1TBK7h08jVvGh0N5aY1IJv9y5yB7KPGYxUGLSyqBNkyA8aWEQOzNwc+QtrHW8msN+vw7Tq9gLPNa6w
 GP4Xg3yshP3bY2gqoQQTUUzwUIQ4nX2+bS0YR4v//AtmuBMoN7Df9htEU79zlFsOEvbDw8BgwWIN1pnWE09tc5jQs6a1Vhpfod6LHfPwzynC1q+rRlLDS2VZ
 1XfE1PwkiNDQlbMs1YUeLUQHrzBfLzzH7aGqmgJl1WBAZh1eoExvayno0KOE7VEIqLbMNjg2XhiDRGNbZaFX+f64Dqa/ctKDy7XvEKC1mnk07I+wc/uhwoKM
 lJAuTMDH2rV2G/pw7lt0UDdUYpCsosqhJar1Uf2OSor3TTEPdwKMq35BloqcvTGHMCW4f04XLTq4NGo8SfiT1fzBKR3CT6D9ZHlKhX+nqQ4WHRwuNqzVKeup
 GRO7emLTIYLdSa6cxNJuB19IvdY6KNTQgFUyFA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771447298; bh=/B76OfClNwC0Z5VHUPihot8HJAcT2k2wAcGP1Jxw7I0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=gtQLutWaYnBAihQ0kEXKolwLAEqu7O6J7BKkGvdsU4pFezIXMRVjNTLntOhkKRwRR
 j/Hn5j0mRNYou/NizcWNXee/JF+xAeuaQKAO9wCZFII1y1czwSWC5euLqSzaZs6BjS
 jFYGr7jjBOwUO8iS61XSlGD0peqvqAQHs/Uf/Gd5/4cp0BRSYTkngBWhJ83U51yMnd
 5nsHzacRC1HhHGtJJ5h79MVzbuZAkD4AsgLnuOrcBQ20DId2x9R+iWJ8MjtkgBlGlY
 TBz6YOVwOIWZtVhDTBhFjH6i3jQQsdHbvb25Lmw4SN46XNVCYWMg2zT8W5rMUVsWJ4
 JSr69Lek6zuyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gtQLutWa
Subject: Re: [Buildroot] [PATCH v2 01/13] configs/amarula_vyasa_rk3288: bump
 Linux to 6.18.8 and U-Boot to 2026.01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/02/2026 20:51, Julien Olivain wrote:
> On 10/02/2026 01:07, Giulio Benetti wrote:
>> The patch:
>> * bumps Linux kernel to version 6.18.8
>> * bumps U-Boot to version 2026.01
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Series applied to master, with the exception of patch #6
> (see my separate answer). Thanks.
> 
> I changed the comment in linux.hash files to suggest the hash
> is coming from upstream (rather than being locally computed),
> where applicable.

Thank you for taking care,

> Also, could you consider, in the future, switching those defconfigs
> to use Bootlin external glibc stable toolchains, please? See:
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Oh, I see, I've missed it. Sure yes, next time I'm going to use a 
Bootlin external glibc stable toolchain.

Best regards
Giulio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
