Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14306C6FA82
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 21:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B4340A02;
	Mon, 12 Sep 2022 21:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B4340A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wbzpj5A6Nrht; Mon, 12 Sep 2022 21:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60630414CC;
	Mon, 12 Sep 2022 21:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60630414CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 699F21BF333
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44D624048A
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 21:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44D624048A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbeTvajxdljs for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 21:05:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B200D400EC
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org
 [IPv6:2001:67c:2050:102:465::203])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B200D400EC
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 21:05:50 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4MRJzF6PjMz9sR4;
 Mon, 12 Sep 2022 23:05:45 +0200 (CEST)
Message-ID: <75996cb7-84f0-00ea-b83a-cbc589499922@othermo.de>
Date: Mon, 12 Sep 2022 23:05:23 +0200
MIME-Version: 1.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, erichiggins@gmail.com
References: <CAHfxMJ4cFRmUBteM-tM_gM=5fbdupjJRaahnbc34wifYgSn=gg@mail.gmail.com>
 <20220912203446.GB1082494@scaer>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220912203446.GB1082494@scaer>
X-Rspamd-Queue-Id: 4MRJzF6PjMz9sR4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1663016745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjIZH1gt2D5FxRZTLVWw43tEsMWOcOYX9rzujE+zFz0=;
 b=Q6o5xWHktJYORmaDPTAcFyQKgBq0Ul2+Mq1sxhex4d16D+i9IJkTpFa3HJD96PkIaM7Pk7
 tCOgatT7uWsRPwAcKyoE49asVkRWPC9bGq01hgHkM0YJa3r4SxL4J+rKEruGMG+OSLNqZk
 RiSYgQFZ62rGtK2BBB4opfmfS6dhxzILQciSTtiNzL3ssz2uf5JF5BNJDFbZXiBs5sGEku
 WQB+IqEDLinqVZ3gnt1RwDryMdQJqqp5L77UqmSH1+tN9tpIN7/IN0syDpWFfS8BNRQGEv
 oyEeBgWrGQedKGydWfo+GZKrjM6/2aG7LzzDvee0Dg1ach6ujI97+0nhNAx36Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=Q6o5xWHk
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: supply package name to
 setup() when not provided
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, Eric,

On 12.09.22 22:34, Yann E. MORIN wrote:
> Eric, All,
> 
> +James for his expertise in that file
> 
> On 2022-09-12 09:28 -0700, erichiggins@gmail.com spake thusly:
>> Signed-off-by: Eric Higgins <erichiggins@gmail.com>
> 
> Thanks for this patch.
> 
> However, this will need a bit more explanations in the commit log. Start
> by describing the issue, explain why that happens, and how it is fixed.
> 
> You can get an idea of how to structure that by looking at existing
> commit logs: git log utils/scanpypi
> 
>> ---
>>   utils/scanpypi | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/utils/scanpypi b/utils/scanpypi
>> index 452b4a3fc3..a5522a879e 100755
>> --- a/utils/scanpypi
>> +++ b/utils/scanpypi
>> @@ -58,8 +58,9 @@ def setup_decorator(func, method):
>>       def closure(*args, **kwargs):
>>           # Any python packages calls its setup function to be installed.
>>           # Argument 'name' of this setup function is the package's name
> 
> So, this comment states that setup() is called with 'name' argument, but
> what your commit title implies is that it is not always true. So, this
> comment is now incorrect, and must be amended apropriately.
> 
> Could it be that sometimes, 'name' is a keyword argument, and in some
> other case, it is just a positional argument?

I can offer an example of where the existing script goes wrong:

https://github.com/Pylons/waitress/blob/73fe701cba0b37dc6099858b064cb1e755e83e9e/setup.py

No arguments passed at all. `name` (like anything else) in this case is 
read from the accompanying setup.cfg file (in medium-modern python 
packaging world):

https://github.com/Pylons/waitress/blob/73fe701cba0b37dc6099858b064cb1e755e83e9e/setup.cfg#L2

This is explained for example here: 
https://towardsdatascience.com/setuptools-python-571e7d5500f2

In the even more modern world the same info is specified in 
pyproject.toml instead:

https://github.com/agronholm/apscheduler/blob/49344e6954559259beb336436a45698d62eed5b4/pyproject.toml#L2-L9

But I think it's easiest and correct to use the name specified on the 
cli instead for us.

> 
>> -        BuildrootPackage.setup_args[kwargs['name']] = kwargs
>> -        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
>> +        name = kwargs.get('name', BuildrootPackage.setup_args['name'])
>> +        BuildrootPackage.setup_args[name] = kwargs
>> +        BuildrootPackage.setup_args[name]['method'] = method
>>       return closure
>>
>>   # monkey patch
>> @@ -147,6 +148,7 @@ class BuildrootPackage():
>>           self.url = None
>>           self.version = None
>>           self.license_files = []
>> +        self.setup_args['name'] = self.real_name
> 
> Otherwise, I do understand what the code does, and I think this is the
> correct solution. James, your opinion?.
> 
> Still, what is missing is an explanation on why this change is needed. >
> Regards,
> Yann E. MORIN.
> 
>>       def fetch_package_info(self):
>>           """
>> -- 
>> 2.25.1
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
