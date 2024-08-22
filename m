Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF462C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804E580BFB;
	Thu, 22 Aug 2024 10:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHMx8l6bb3Sn; Thu, 22 Aug 2024 10:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C5F480B76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C5F480B76;
	Thu, 22 Aug 2024 10:01:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5E11BF35A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2745A40231
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJdmCo0N8bKw for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7252400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7252400EA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7252400EA
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:01:25 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C82692C85C6D;
 Thu, 22 Aug 2024 12:01:22 +0200 (CEST)
Message-ID: <7c94a664-eea1-4244-9338-6d4ca208d3dc@bubu1.eu>
Date: Thu, 22 Aug 2024 12:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240213123753.2471309-1-buildroot@bubu1.eu>
 <20240213123753.2471309-2-buildroot@bubu1.eu>
 <20240722223748.5893f728@windsurf>
Content-Language: en-US
In-Reply-To: <20240722223748.5893f728@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724320883; bh=mxzVtk61UWmdXyI0uxuFAaLWzvaJCrgohAn7rCtnJUg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=oGiFg5MTBA0VdcMCsuKs89gL1y8cU778ABJ7hIgqEu+JiHZIU7+wJlyydsWUYLNj6
 NMdRdxUkluqjBNcn2X2QNd3/+mM38JVTh5ghRah0sanJ37UPsO0x60lirsWYuqvLyW
 An9+7nbRNqhYfHfF+CCAiLzhwDS+HequkQWRjGtjJSIiN23TP9YAoOK3kg7eJm43hm
 2mAxDtaFBifiFX7qwknywnS1BvMUc8DLHegCEwkJYE8re/MJU+gCsyL1ID4oFmHHR3
 qjLNev3UTMlqc0PJFOwLxK4eXcOed/1HbVe6SRRBHfb8jG73Ydo2dC1wjYfl8EHfUU
 vb6/TRSl1ZxiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=oGiFg5MT
Subject: Re: [Buildroot] [PATCH 2/2] package/python-can: needs PYTHON3_CURSES
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 22.07.24 22:37, Thomas Petazzoni wrote:
> On Tue, 13 Feb 2024 13:37:53 +0100
> Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:
> 
>> The can.viewer tool requires curses support. [1]
>>
>> [1] https://github.com/hardbyte/python-can/blob/v4.3.1/can/viewer.py#L44-L53
>>
>> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
>> ---
>>   package/python-can/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/python-can/Config.in b/package/python-can/Config.in
>> index 61955a2b00..106da4560c 100644
>> --- a/package/python-can/Config.in
>> +++ b/package/python-can/Config.in
>> @@ -1,5 +1,6 @@
>>   config BR2_PACKAGE_PYTHON_CAN
>>   	bool "python-can"
>> +	select BR2_PACKAGE_PYTHON3_CURSES # runtime for can.viewer tool
> 
> I am not 100% sure on this one. Do we want to make this dependency
> mandatory, while it is only needed for a viewer tool, which probably
> most users of python-can won't use?
> 
> I see two alternatives here:
> 
> 1. Leave things are they are today, i.e let users figure out that they
>     need to enable curses support for the viewer.
> 
> 2. Add an explicit BR2_PACKAGE_PYTHON_CAN_VIEWER option, which selects
>     BR2_PACKAGE_PYTHON3_CURSES and enables the installation of the viewer
>     tool. When this option is disabled, viewer.py is not installed (or
>     removed if disabling installation is not possible)
> 
> Thoughts? This is not a hard feeling on my side.

I didn't really have a strong opinion either, but I went ahead and 
submitted a patch with the second options now. Hope this makes sense :).

Marcus

> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
