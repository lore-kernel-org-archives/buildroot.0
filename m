Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA4ED59F6F
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACDDF4080B;
	Wed,  6 Nov 2024 20:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6Ad9zeRVjAR; Wed,  6 Nov 2024 20:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79CE640824
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79CE640824;
	Wed,  6 Nov 2024 20:19:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 188F6B8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 146FE813F9
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORJGDqTgQye1 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:19:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5903813EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5903813EE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5903813EE
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:19:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.161]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjjCL-1tW2ZG0BhL-00f7JY; Wed, 06
 Nov 2024 21:19:21 +0100
Message-ID: <10c04649-a2cf-41e3-89e5-6c8a1bac1f28@gmx.de>
Date: Wed, 6 Nov 2024 21:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20241105175215.1402819-1-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241105175215.1402819-1-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:WdAHMst90TI7gasUpidpMN+uLI1l/U54fzd1mAe5N7YsHUH5Tg2
 EWQmkaYBWMAkRpKy9J1xKV+/CRMCN4LjdihR8pF/XF41v0/TmZHv9VjfNU0htKJ4MtjENSG
 eJd2wg05EomprWItvAyJoBmjuPhLh1/k8M2VjU7fX7Y9ptJwKuAKZee58QF2IUJ7TksHJj3
 mzeA3gM9AGhalEZeO9L/g==
UI-OutboundReport: notjunk:1;M01:P0:yp1sxqEqoBc=;UM6HgUUOzFhCcb1m3vJ2TbA7Ucl
 yu+Gj6oKe7xsaxHGVZBj5reuDdL77q5D2edWj4ounZnC13aay8NqhYJ04RDfS3JXFj9zZZ4TU
 QRlAoMGSz/Masgkez86fSIiHBRCZv6BKl1huD2CFpvW4C9DL4xT58awD1yP5g/v/7CSh6mrxZ
 5tHH9fWyYp5lmxCO82jkpIo7939G7wk3hO4moUqQ8ifh/ajwOUaKfSTtNilkMSSBSfhouNqAZ
 XSglyoDjJUBBB4B9QQCH+ZDU0uz9wk0bPQnOsqwxUp40UFtpWU2prKbcN5elpgCImdChEpGw0
 6XkiLvMYSM6STf5Hs3SVDccEi6ym+vztZmTqv0sQ+E1NeDSS0KPCQu8RCxK29Q9jkwoRhbzjC
 237f+qwnZ+MC9e8re34DxPtK+J5jfs9hvsye5USl4qK6f8jIR9LtVE5ZVULhyoLm8f90ojkrh
 5oA1UzbBc6/4faYorbh0nhxRDQd4sobEc5i0L0h804r6iPyjul7TN+MH7QAqxVrK4yHNQ3FZ9
 uZMGZe+gLhmBwFhvUoFUAZ6ZeggvI7J4dPu4scsWjnZbK1VMjt/9HnRfAjFcvsf8bGIXIJ2+e
 qVGzElc2zqD/pyaoS8s6MOgUQntjUqz/p+x8g3abwNEo5laEh+eU8uJ/Wsd/YUBd9SS0cKxi8
 hgbjp4Il+IJojZ/CEEJiAIPJSOfNPOBmd08DaS+RRjnWTtGH/HJehDtdZNAxJi+cp+fBaTidJ
 dIK5NNUqdrloQFmz34OkuNoedcT8SHXYwumUkJKcz7pqG0niDL3ubaPCQgzFa3Z2DkrVH6nB0
 w7pfGJLuY2UNpNPqOfh44DACg60OuzON+NMGbOb/WjYbwjjVQzdhottaZcORD/ouH6gSClgHi
 o6UtwS+Yb9r3iMoH3xs/9KtfHRk4CAdX3Kbee+i8/9syC7Xp5pZ9+/o4V
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730924361; x=1731529161; i=fiona.klute@gmx.de;
 bh=JiTTTTAPJrMqN1GmXlNyzuxdfqfLpAGxhYXZme4PuJI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Gle+jAZt+P9LKMEbKddA4bGCT3IgYj/wCdfBpBZO7m3KaFCxo8IDTMtkg3BCwjYB
 rYETrm2bHFokwKKjc5EiHvc1pbfW9NsKpwVjm29L+gc1cjvMXVBu5hOpiVU6vRpVx
 CTchSWRwJ6Yx6rp6vm1XAdSAtPmAjx4VfjarQRwA3pgAlhhJbfQRxE0zTXpcaW4F5
 XVFSbGI6PtB8m/E087MkWKYuqjY76zqYGHm/SEAMQnzwsLHRcgAdW+GK1VBq4ew80
 p2tTwL5wiAsOWRAPpX/y0n5MFljU28s8nCBDmlA6j2JTasttzHbEWTz45d6YqAdyM
 WqGPvnaqdIwEk2rCHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Gle+jAZt
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dunamai: use poetry
 setup type
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 05.11.24 um 18:52 schrieb James Hilliard:
> Use the new poetry setup type which automatically pulls in the
> host-python-poetry-core dependency.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thank you!

> ---
>   package/python-dunamai/python-dunamai.mk | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
> index c3ab45fd6e..bd6c71fd6a 100644
> --- a/package/python-dunamai/python-dunamai.mk
> +++ b/package/python-dunamai/python-dunamai.mk
> @@ -7,10 +7,9 @@
>   PYTHON_DUNAMAI_VERSION = 1.22.0
>   PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
>   PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/a0/fe/aee602f08765de4dd753d2e5d6cbd480857182e345f161f7a19ad1979e4d
> -PYTHON_DUNAMAI_SETUP_TYPE = pep517
> +PYTHON_DUNAMAI_SETUP_TYPE = poetry
>   PYTHON_DUNAMAI_LICENSE = MIT
>   PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
> -HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-poetry-core \
> -	host-python-packaging
> +HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-packaging
>
>   $(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
