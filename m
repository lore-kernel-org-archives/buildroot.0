Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C7CCD13DF
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 19:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C922840B7F;
	Sat, 31 Aug 2024 19:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTDVH7g05CFV; Sat, 31 Aug 2024 19:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA2740BCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA2740BCB;
	Sat, 31 Aug 2024 19:23:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B90961BF2FF
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4B9E81A81
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOvpCMsjWaLf for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 19:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDDDD81A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDDDD81A58
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDDDD81A58
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 19:23:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.123.38]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1sRAPr3GLW-00OEHo; Sat, 31
 Aug 2024 21:22:53 +0200
Message-ID: <d8c3b452-da4b-48a6-9b95-7ef25fe51301@gmx.de>
Date: Sat, 31 Aug 2024 21:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240713192207.873065-1-fiona.klute@gmx.de>
 <ZtI7NyPyq9rU94RT@landeda> <ae8a1d19-00a8-4be4-a16f-a951cba5e9f9@gmx.de>
 <ZtNdccT-tuO4Epk2@landeda>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ZtNdccT-tuO4Epk2@landeda>
X-Provags-ID: V03:K1:WhnoqnbX9QNn/OR+4YJhylAu7gVUK72us9qLoYuI+JofIjqKenL
 rqClfDHrbD7V9qzNMTifyGMEyOGD3KLwiIB1T/Rkwxg3iupS6h4xj0Of4tr9KKCwy32n8zT
 lSgJPVfGwsG2S8mu1xxlGagg7KMnsfWdpal0nHs0CKdpaFfOK98cNITRbygbeEUpAWzyUIt
 zDIuiY+kBoYlE3MKroRKA==
UI-OutboundReport: notjunk:1;M01:P0:hmKCuo0LD/M=;V4sHHD2TLiugiP3xzGZBlTYH4wd
 zJ/Kd/lE8Q0pNL+lpdjM0nZKhr6GE0uU2PrKxWt64wQBLUYA9DKc9ltBP2evxJVtwD2ysskQG
 ZVdmmLYnSN83SQm7oVbv0cKZIEse/0MFfmTX8+jPlxFzUbJV03bSOmXqUINpB5Y536HYF3waA
 cQhQyn+2ek9Rf4rl8YnzGy8cFl9bxV7nwZ4V1ucCjMdkzYtvD0ZiJMAp5TNq4O2M6YzpyVYPA
 ETrnARe0UesVcN3vKE3JAQOZnb8G0GXYP8qg8jOJXOW+tDDlQcOzJr+RES+0kIaJxSzgiTNcF
 5xvVKZVFsoVibP4nUcXN0wrRyOAWmHfTD2AfDMyFwzS0QS0+c/1s+J8edKuySaFEYv1CMFJnr
 5BnBKFtlTxCUCL70NoC0JkXF+jlV0anwN6xGJmXAMvUMFT3lsesu9B38ucAsq/2BP6EFxVCE0
 0HDgekBCGwia+VaOHkerXeX5KCUbcOL3Py6Os/swjye81aE2v6R9xU47RynZREsRcNSvmNBuo
 /PhubyT3TDKJSCsBTLt9ioEXhw6UG9EMk62Sf4GGtPbuL42W9ybpVnBCUyK0itzLOn8VjTD+a
 ey91dDOv+yH+AwrVUfdJEBVs+xJK1+hiHgv/YCYN2z/RPAjztMYjwr0w30vF8kRnnyZxln4Uy
 kKF+J42z0iqH1ZDyjKOFvHv/DYcGFm9UUigB6H4lr7BVVUIjWyWbWKB173imwhqUFy5ugyB2M
 2Jor9XdYV7aCKLFxWLCrKaAhb1UdSVXj9/yWqrH/6kUnFdiu1rAmxHeyqG4ENEdsLOVO+zp4w
 TKeJiPmnQ1g7tbRJc4erXNTg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725132174; x=1725736974; i=fiona.klute@gmx.de;
 bh=WrWLx42EUuih1c469mqvGqy9w6ZBMfwVwiWJyg5NL8s=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ENJ7OEdj3uZUTw9oieZgqaT5y607sECpRSf54L/6KjvH8jd7NyjyvKDIRx6Af6K3
 zS1izoonZ5CIruCoFkgZqK1UekAEqNhU5x/Tp6G4L2LctMLNmr3V+pILshRI8tMy+
 g28Ajq9foWMfzo8BhKOUH5o/AC1ykLN4mbim3ACqtTbuMTnUx9F8ih0F5FNnrVxGc
 Z43vD6aWq2m+CWJg2MFv6JJqPPR7ILq+vWAnSNjs3PF7sAuWM1go2MAtS2D36637a
 SV3x2eCw46SBWh5DiJhoVphM5KxbdU58Lxz0tQtl9Yp8q/bRk8QA9WVqusCM9DvYj
 mZ2Oi1+y8JBHjk3YVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ENJ7OEdj
Subject: Re: [Buildroot] [PATCH v3 1/2] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 31.08.24 um 20:14 schrieb Yann E. MORIN:
> Fiona, All,
>
> On 2024-08-31 18:57 +0200, Fiona Klute spake thusly:
>> Am 30.08.24 um 23:35 schrieb Yann E. MORIN:
>>> On 2024-07-13 21:22 +0200, Fiona Klute via buildroot spake thusly:
>>>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>>> The BR2_EXTERNAL environment variable is passed into the container,
>>>> and each path listed in it mounted. This allows using external trees
>>>> when running a build using utils/docker-run. Testing the existence of
>>>> the variable instead of a non-empty value allows passing an empty
>>>> BR2_EXTERNAL variable to disable currently set external trees.
> [--SNIP--]
>>> This commit mixes multiple changes:
>>>     - using process substitution with a while-loop, instead of the
>>>       command substitution and a for-loop
>>>     - passing br2-external and mounting trees in the container
>>>     - handling br2-external trees with spaces in them
>>>
>>> I see you have a second patch with support for br2-external trees with
>>> spaces in their paths. If at all, it should come before this one.
>>>
>>> However, I don't think we should support paths with spaces. We currently
>>> do not, and the rest of the code base (as your second patch states) may
>>> or may not work (hint: it does not, it's broken in a lot of places, and
>>> the buildsystems of many packages do not support spaces in path either).
>>>
>>> Also, BR2_EXTERNAL must be a space-separated list, as it needs to be
>>> split on space from Makefile context, so no br2-external tree with
>>> spaces in paths can even work... (unless I missed something...)
>>
>> According to the manual multiple paths in BR2_EXTERNAL must be separated
>> by colons, not spaces, example copied verbatim from
>> docs/manual/customize-outside-br.adoc:
>>
>> buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
>
> Supporting both colon- and space-separated lists was the worst idea I
> had when I implemented and coded support for mutliple br2-externals.
>
> In fact, the manual has an example with a colon, but nowhere does it
> explicitly states that it can be either.

Okay, in that case there really is no nice solution. :-(

I've just sent an updated patch based on your suggestion.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
