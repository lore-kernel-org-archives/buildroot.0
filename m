Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793A9C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:56:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B0D61008
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00B0D61008
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92F980BE5;
	Tue, 17 Aug 2021 20:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLNkp4IXKZsb; Tue, 17 Aug 2021 20:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08CB080C2A;
	Tue, 17 Aug 2021 20:56:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 967D41BF95A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8632440370
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2bVzQZJUvZ7 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 20:56:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EB5940304
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 20:56:32 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.10.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G68Km5TrYxC2nG68Km18Vp; Tue, 17 Aug 2021 22:56:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629233791; bh=U4+x1kgzDv2hglrhR5zld2v9v3azooHwRMj/oTRX3co=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=AB66ajQYNPEc2EHEjZIbqSN9ycWg5bsK88SMLN2uwiotSWFwmOPT9FPCkQNhUVZzm
 mmWbExVyXmilJ5J5vyTUTkjgrcLOa8Z7ar42UNXPL99cX0pRhiClZmkXK7aQIdveJi
 GixLBvR5nmVkvr+BQ8I540EwXa3z3IZ6JuEz4MkcnaVu5YZl8gr644zECguFmRKFga
 0vZGg7ag+xlCdnMDUrJlEIBW7fY61aOlKUNTHeUvRfiWJM8mRFq6AF54caVXwIJ6ya
 pCWasQ6qfavwJ5CRFeGP2iXQa5dsDi09xW77uRae89NawF5ty5nO1IGRwgUOj15GxJ
 xf1hVDrqSrOmw==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
 <b89f7acd-3549-f167-f984-b08a5a597a18@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <dafc15e4-91e2-976b-d173-c2856b167709@benettiengineering.com>
Date: Tue, 17 Aug 2021 22:56:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b89f7acd-3549-f167-f984-b08a5a597a18@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfC/xAz7+utsgJxhw2PVNDX8MLQQKnZiznIyieNfFb0z+rmzL5IZ7KqK3hHgjqFjJAYr2rifDFq8ZKZnHRg1Z3mA1o+KUUAHSsWYQbnEp/cA90H50PhGF
 eAXvNvJ2/asLQ063kP1ZajvuYKgcd4E6KPsqnpsvCHJEYORo95IgngYmeeonGQ/liodGyGZt2Q9n5UUOnz20BAZinW5uQjkJZrPVJ1L+rRfRJbzrmWjw94GR
 5hqbJmyOfpaZQaV6XYyZ0gvYwr715vBMheOC2J5XvVDCNmqmPT0bnsG/7TUYHblBw9FGA2wqkwULO729k10SVBNs5s45W/fh30TJTI+5TEZjFhRG3VvLqkyX
 EQLRimt6QR/kFfy40MNvm8+cc3cf8epDNVkAAoRGWOwgOO7ssuMFFRf/1IPpHTG3DVpPIMzZCUiic4GpQ7jI0rIyye5BkUCmgpt+SCcA6ERntulDFcw=
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libgeos: fix build failure
 due to missing -mcmodel=large
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Arnout,

On 8/17/21 10:34 PM, Arnout Vandecappelle wrote:
> 
> 
> On 27/07/2021 00:34, Giulio Benetti wrote:
>> When building libgeos for or1k -mcmodel=large is needed to link, so let's
>> add that gcc option in case we're building for or1k.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libgeos/libgeos.mk | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
>> index a355732af8..43211d0434 100644
>> --- a/package/libgeos/libgeos.mk
>> +++ b/package/libgeos/libgeos.mk
>> @@ -23,6 +23,10 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
>>   LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
>>   endif
>>   
>> +ifeq ($(BR2_or1k),y)
>> +LIBGEOS_CXXFLAGS += -mcmodel=large
> 
>   According to git, -mcmodel was added to GCC after the 11.2.0 release. Are you
> sure that this works?
> 
>   Oooh, we have a patch that adds it. But that patch is missing for 11.1.0 for
> some reason. Romain, you apparently didn't carry any of our patches when you
> added GCC 11 in 2ab88dac293aed5adf2504e8b182f9d8a306b935. The commit message
> doesn't say anything. Do you remember anything about the patches? The patch was
> added to master on May 21 and you only submitted the GCC bump on June 12, but
> perhaps you already had it lying around for a while?
> 
>   Giulio, maybe you can port the patch to 11.1.0?

You've read into my mind :-), I've sent it yesterday:
https://patchwork.ozlabs.org/project/buildroot/list/?series=258108

and that is valid for both libgeos and profobuf.

Best regards!
-- 
Giulio Benetti
Benetti Engineering sas

>   Regards,
>   Arnout
> 
>> +endif
>> +
>>   LIBGEOS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBGEOS_CXXFLAGS)"
>>   
>>   $(eval $(cmake-package))
>>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
