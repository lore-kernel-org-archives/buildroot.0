Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C65C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:54:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE8960F42
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BE8960F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEF540526;
	Mon, 23 Aug 2021 22:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWpNrufYeaRG; Mon, 23 Aug 2021 22:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43F854052C;
	Mon, 23 Aug 2021 22:53:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9182E1BF2F7
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E553605B5
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6vlbuUPtrVy for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 22:53:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02111.aruba.it (smtpcmd02111.aruba.it [62.149.158.111])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85EE96069B
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 22:53:52 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.10.203])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IIpBmdkKlqG1wIIpBmFO4t; Tue, 24 Aug 2021 00:53:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629759231; bh=EEedg30pZAK+EzxyZhi6YpC7SUzDSuWhGCrl/hbgF88=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=DOTOA4c+w67jABnjUMwbDul0Kzdr+HmXHO5nlVssruKdMkz/PHdkfyy7a1da7oNhj
 KjNQAQs1mwFmR4xFGvLINFGoZH8X6DlnlCj7XpsxsCg1SCuDJHGHmM7E6LfMkPp7dG
 AFQ9RB/tpGa6lc4+yUC1j+OfG2kv25dQ9k+aLQX31l4oOeyJ1U3KP68cbdHkx+PCp6
 76/opvOhjArNK1HstWt7jGKO1XzEEKuisxxkVnHgSx47MFq1srhrxvso5iFK7EF8XH
 L0hvietsO8E/DVCgkLfugxBbm6YF8I46CIc/8G+Ksr+e7js2O3Y+fuoO28mu8E2KJy
 BsnpDeDQAJIUg==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210821230613.470903-1-giulio.benetti@benettiengineering.com>
 <60ae8d41-7b62-b5bd-dade-cdb0d347ab59@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <14adf596-cd27-f44f-7fe2-3888b49f283d@benettiengineering.com>
Date: Tue, 24 Aug 2021 00:53:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <60ae8d41-7b62-b5bd-dade-cdb0d347ab59@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJZwsxC3Vr5IKHzgZToQ7FUJIDXrdVLeGb/Ccj4X3NCzS1TSvxz69KW8j/pgdvrUBbeW77IUO9fKcYHoKmgS2gdnVqOlop8fLqeNXZN3dKwYkUL5u8YT
 atrgInaAtGyC3q5akNlgmFPb4t/ZuMaQWj+oFcVmvJEAnFXM5OCGs14OvF/YK61WvVxAPFI1l94yiyjhhGmsDsKm28DSDBVoZ3Rkw5bA7B64qTRT9aeqXx8s
 Tq6x5TsDnQzBEWap7Dqs7kyAo3OKVa3AMd06grDzpvA=
Subject: Re: [Buildroot] [PATCH] package/libmodsecurity: fix build failure
 on m68k_cf
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 8/24/21 12:25 AM, Arnout Vandecappelle wrote:
> 
> 
> On 22/08/2021 01:06, Giulio Benetti wrote:
>> This package has -fPIC gcc option set by default but we can't use it on
>> m68k_cf since it doesn't support it throwing a gcc build failure. So let's
>> disable it by passing -fno-PIC.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/b92980a563fe7ee331e70f288ce041be0bf29d40/
> 
>   Applied to master, thanks.
> 
>   I just changed the subject line from "fix" to "disable -fPIC". Most changes are
> fixes, so that's obvious, and "disable -fPIC" is given a lot more information in
> few words.

Ah yes, thank you. This almost sent me to nut, because it seemed a gcc 
bug instead it was this and I've written commit log too fast!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>   Regards,
>   Arnout
> 
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libmodsecurity/libmodsecurity.mk | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
>> index 66e7e522a1..be46eb6e02 100644
>> --- a/package/libmodsecurity/libmodsecurity.mk
>> +++ b/package/libmodsecurity/libmodsecurity.mk
>> @@ -52,4 +52,14 @@ else
>>   LIBMODSECURITY_CONF_OPTS += --without-maxmind
>>   endif
>>   
>> +LIBMODSECURITY_CXXFLAGS = $(TARGET_CXXFLAGS)
>> +
>> +# m68k_cf can't use -fPIC that libmodsecurity forces to use, so we need
>> +# to disable it to avoid a build failure.
>> +ifeq ($(BR2_m68k_cf),y)
>> +LIBMODSECURITY_CXXFLAGS += -fno-PIC
>> +endif
>> +
>> +LIBMODSECURITY_CONF_OPTS += CXXFLAGS="$(LIBMODSECURITY_CXXFLAGS)"
>> +
>>   $(eval $(autotools-package))
>>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
