Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1562CC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 17:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935C2605E3;
	Mon,  8 Aug 2022 17:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 935C2605E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5u6xvSRNxFBd; Mon,  8 Aug 2022 17:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C38B1605D6;
	Mon,  8 Aug 2022 17:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C38B1605D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE95C1BF3E1
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 17:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6DDB80BF7
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 17:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6DDB80BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43pC7KPxTGCG for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 17:55:55 +0000 (UTC)
X-Greylist: delayed 07:41:47 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF6480BE1
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FF6480BE1
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 17:55:54 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4M1kQG3j05z9sTK;
 Mon,  8 Aug 2022 19:55:50 +0200 (CEST)
Message-ID: <79d2d14f-9736-6385-618f-92b0eeb76e6a@othermo.de>
Date: Mon, 8 Aug 2022 19:55:48 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <35ea7a5d-e0b4-d98e-ca1d-716de2d25698@othermo.de>
 <20220808121723.7d0d2bcb@windsurf>
 <2e49d072-ab0a-4e7e-1d39-9844e98bf560@othermo.de>
 <20220808124708.552b9d02@windsurf>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220808124708.552b9d02@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1659981350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuvuJRt5rLKJyiPXlLYcmDIiFfwuInvaWco7o1sf6U0=;
 b=rMeoQ5tj4zIBIMF7qRCtRJS/4ug2u3mq2AePLclUiy0LMsZikrJKjdjH1ZgteK2NBGWXN8
 YBwBHNhzqxoVX8qan2Q+S5v6YBY7q8ouK7C2tsct2m7B8D0I4RxeXI2HBOS7jlcXS7xl8W
 2L6DBtW6PFENJRkTvHvtXoomWCSyvPXrcYA7m0FdzKZ3SZ1x4KIiHQfOP+4JpOgQbFGRNF
 +sf81SxIUgUawRcS+R4+NU3gRQIWjWz6LPZz3y+BjFFc5FbGnhw3vXbHwypVBMMjOz/uJJ
 i0/YXlCE30U45wfmm32lRPVpKUNGGwkKH08xjJQL8MMIwrfqB68k6B/9wzCAwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=rMeoQ5tj
Subject: Re: [Buildroot] Python pyc only and problem with scripts
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 08.08.22 12:47, Thomas Petazzoni wrote:
> Hello Marcus,
> 
> On Mon, 8 Aug 2022 12:30:10 +0200
> Marcus Hoffmann <marcus.hoffmann@othermo.de> wrote:
> 
>> Sorry, I hadn't really gotten around to properly reporting but here's
>> some details:
>>
>> https://github.com/pypa/pip/blob/main/src/pip/_vendor/pep517/in_process/__init__.py#L13
>> returns the path to the .py file in question and is called by
>>
>> https://github.com/pypa/pip/blob/1880f4a58b4e4ed577a6337d666767784f6831d5/src/pip/_vendor/pep517/wrappers.py#L320-L326
>> via the subprocess call.
>>
>> Why they are doing that, I couldn't figure out in the time I spent
>> looking at this.
>>
>> This is happening for us when we `pip install` an internal package that
>> uses flit[1] as it's pep517 build backend.
>>
>> [1]: https://github.com/pypa/flit
> 
> Ah, but you're doing "pip install" on the target?

Yes, indeed.

> 
> Without saying it's not supported in Buildroot, it's not really the
> recommended way of doing things: we encourage to create proper
> Buildroot packages for Python modules.

I'm aware of that :-). This is used for development purposes, which 
sometimes needs access to real hardware as well as being able to easily 
install new python dependencies.

> 
> Of course, since we support installing pip on the target, ideally this
> should also work, but I'm not too surprised it can be broken for some
> packages as I'm not sure many people use "pip install" on the target in
> a Buildroot context.

(I ran into this at one more point: everything that wants to compile 
native modules as part of the package installation doesn't work for 
obvious reasons. Every pure-python package should ideally "just work" 
but the pep517 world is still somewhat new and somewhat broken :D)

But now I wonder where the right place to fix this particular bug is. 
Locally I've just patched the .py -> .pyc but for upstream buildroot 
we'd need a conditional solution depending on the setting fopr what of 
py/pyc gets installed.

Or do you think this is something that should be reported/solved in 
upstream pip?

> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
