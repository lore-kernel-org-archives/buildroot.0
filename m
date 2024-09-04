Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29430CD4847
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 17:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C21812F7;
	Wed,  4 Sep 2024 17:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJqG_Cn5ba8G; Wed,  4 Sep 2024 17:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9D118130C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D118130C;
	Wed,  4 Sep 2024 17:59:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 125DE1BF263
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 17:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2AD740B53
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 17:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P28CbzLvvk5p for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 17:59:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AB85400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB85400D6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AB85400D6
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 17:59:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.126.159]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsnP-1sTXOI1ca5-00V4w0; Wed, 04
 Sep 2024 19:59:15 +0200
Message-ID: <b37f65c3-93c5-47ea-b7e6-bb542aa208e0@gmx.de>
Date: Wed, 4 Sep 2024 19:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20240904100748.3623308-1-yann.morin.1998@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240904100748.3623308-1-yann.morin.1998@free.fr>
X-Provags-ID: V03:K1:Q0Tndj6LotgxnEUnDzv+G98HyjmKqAZo02MYbF1SL9aGpzIdHcD
 pyIuCLCjSbKKXPJHKQNzmvs+/1eiY5QeYAw+ASsO6p8hOacHlB1KRhZzM3/eFi8Yzd9UAcr
 MadZBN97Ev9xLe7eDnuzXu2qlWikqzoRNDoJhfu0l/ORoPVvWlWUwnVhlZeluBfQlYhw+Cd
 jxk3fV64cE8P2xIi/P1ng==
UI-OutboundReport: notjunk:1;M01:P0:r3CKs4vkHmw=;S7H2zRrkira1XCIMfvgPTxsSQWj
 on/vGh4cVrcIxslt0H10sbvTg/F3MPimgTQ8+HJtPVxvkITbCh4OT1LOELFdRDlZAlHaivak6
 U2YiYUjVaSSbX7CBlsgPEicB4HdyO0QG6pr1AY5PO2C4ACwI/seEf1/bLVqoElaV9LcwGIYuy
 AmqoTSaRQY2p720PPr9I6tOR3JSl1xYS3dQIxxEviIQbvWKjktVGmjCRmZW34LSd44FssRHzu
 o8b5AWLP2WwlxYZqB2hgd+UBv48vEwQ51hCAkPoJDbqi6RPIbbOBMmlZAV18Az6gTvcOI/9b9
 UIqQnKxCp063oNva1BHREmowPmooMGmX7n2lfMiF4pKH8Cz6Wq66Z5slkrgJknsPo1gQUQiB2
 VuQWvNPgr9ZCW+wb88BEUeepfRqJjRqOOJlEJ3MWqaraj1fdeLaeH3Jg6NZ8oxUBJCyJ6eOXs
 OijYt5rSY/OHWjOGDr8zKhfGXWo+7tVlmg7fFgy4rMS+3ddZ84NsE6dsOHr3Vd9KDFrg08aMW
 567FXDJvKIJcgfxgGKz2QYnoiv3Iiu1wWM1lRvhaS0BEvGoRqX5CzyjIvlxCK7Jps1KbLKvjh
 8tg8yiIEU5YHv475OxxtqkChyA3ptMVHf/khPWsVxk1gdC9pYhlhaNpzGaJNk/eWeKaXFymCP
 ejwB0gTed85JnwuomPWw//apcHcyya0+YW3Y7tD30Zbms8FGXmEMYC+R/UJ4Tnxhhn5F/+Pxn
 Zn6hBy71zip1oQlMGLXxSh8y6/e4l6ulUY+b8eFu2DaCiXSj0Ay4uoJ7e9mK3WyxDG80tikXn
 DMWvMuUQki6l5guCwYYWww0Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725472755; x=1726077555; i=fiona.klute@gmx.de;
 bh=q4FMHtko6UJ05iX9GRVrwpkrqlbTwkknE819gWQ8PqM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=V1m//u3mJK4jZYkPU9iaUFZuHQOSZVm62AZPYfqTzQ86xiPqJR87RFVHP0GzP1u2
 pUX9Olv5CLtab93QYopfpa4RUeueLJzVwbqyUl3+uNSiihp8p7sVOSHCinQLbngIL
 pG4jSycPrm6VkjzG3GGdX5BCEvz/Mnnz2SyZtG3ca05AJ3mWh4WyUtfmuqj4wb3qN
 Y4hmExgFgW3JU3tcMPqDKMQANPj+U/XfDy+Rhq7I0oN4uaUBzZ99WzgBNABM/itxX
 U/LqfNmzEDTcPCgyysYnhW1sPVApTYcGX3gFjK+Bs2YxYqlL801a9hCEvCRrm7hxp
 vNgerSXDLFRAg6E2Eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=V1m//u3m
Subject: Re: [Buildroot] [PATCH v2] docs/manual: use space-separated list
 for BR2_EXTERNAL
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Brandon Maier <Brandon.Maier@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.09.24 um 12:07 schrieb Yann E. MORIN:
> Specifying a list of br2-external trees is poorly documented, and the
> only example uses a colon to separate the br2-external paths.
>
> Adding the support for colon-separated list is the biggest mistake that
> was made when introducing support for multiple br2-external [0]. Indeed,
> both space and colon can be used to separate entries in the list, and it
> is also possible to mix the two. However, internally, the list is stored
> as a space-separated list, and all the code will split on spaces.
>
> So, using colons is odd.
>
> Change the documentation to only mention using a space-separated list.
>
> Of course, for backward compatibility, we keep the code as-is to accept
> a colon-separated list, but we just do not advertise it.

I think it might make sense to add a comment that explains this in
support/scripts/br2-external where the colon substitution happens, to
avoid confusing people who don't know the history.

Best regards,
Fiona

> [0] in 20cd49738781 core: add support for multiple br2-external trees
>
> Reported-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Reported-by: Brandon Maier <Brandon.Maier@collins.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> ---
> Changes v1 -> v2:
>    - fix typoes
> ---
>   docs/manual/customize-outside-br.adoc | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
> index 5e653f1603..081d302e42 100644
> --- a/docs/manual/customize-outside-br.adoc
> +++ b/docs/manual/customize-outside-br.adoc
> @@ -58,10 +58,11 @@ We can switch to another br2-external tree at any time:
>   buildroot/ $ make BR2_EXTERNAL=/where/we/have/bar xconfig
>   ----
>
> -We can also use multiple br2-external trees:
> +We can also use multiple br2-external trees, by specifying a space-separated
> +list of paths to use:
>
>   ----
> -buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
> +buildroot/ $ make BR2_EXTERNAL="/path/to/foo /where/we/have/bar" menuconfig
>   ----
>
>   Or disable the usage of any br2-external tree:

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
