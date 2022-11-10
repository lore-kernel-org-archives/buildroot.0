Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB91C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 08:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F8281A30;
	Thu, 10 Nov 2022 08:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F8281A30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDfQkY5zK7hd; Thu, 10 Nov 2022 08:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D33F818E8;
	Thu, 10 Nov 2022 08:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D33F818E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D24361BF3C5
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 08:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAB8A400D1
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 08:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAB8A400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JK3ua5daeao8 for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 08:11:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC964400AF
Received: from mailproxy06.manitu.net (mailproxy06.manitu.net [217.11.48.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC964400AF
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 08:11:41 +0000 (UTC)
Received: from [IPV6:2003:c4:d718:4800:13e4:5f80:9e24:9265]
 (p200300c4d718480013e45f809e249265.dip0.t-ipconnect.de
 [IPv6:2003:c4:d718:4800:13e4:5f80:9e24:9265])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy06.manitu.net (Postfix) with ESMTPSA id AE86A5803FF
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 09:11:39 +0100 (CET)
Message-ID: <5468c14c-2a01-5e5a-26a4-48b1f3112476@grandegger.com>
Date: Thu, 10 Nov 2022 09:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <b1bafa9c-393e-b9aa-0a3e-0a3e67c5fd42@grandegger.com>
 <20221109231058.6265929b@windsurf>
From: Wolfgang Grandegger <wg@grandegger.com>
In-Reply-To: <20221109231058.6265929b@windsurf>
Subject: Re: [Buildroot] [PATCH] package/udisks: add config option to
 support mounting in, /media
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

I just sent v3  (v2 has a typo in the subject).
Hope it's OK now!

Thanks,

Wolfgang

On 09.11.22 23:10, Thomas Petazzoni via buildroot wrote:
> Hello Wolfgang,
> 
> On Tue, 8 Nov 2022 18:22:03 +0100
> Wolfgang Grandegger <wg@grandegger.com> wrote:
> 
>> Support mounting in /media instead of /run/media for compatibility
>> with the Filesystem Hierarchy Standard (FHS). This is also required
>> for backward compatibility with udisks1.
> 
> Could you resend with your Signed-off-by: line? Also see below another
> comment.
> 
>>    comment "udisks can't be built with Optimize for fast"
>>    	depends on BR2_OPTIMIZE_FAST
>> +
>> +if BR2_PACKAGE_UDISKS
>> +
>> +config BR2_PACKAGE_UDISKS_FHS_MEDIA
>> +	bool "Mount devices in /media instead of /run/media"
>> +	help
>> +	  Support mounting in /media for compatibility with the
>> +	  Filesystem Hierarchy Standard (FHS)
>> +
>> +endif
>> diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
>> index 2bf519a2cc..91328effba 100644
>> --- a/package/udisks/udisks.mk
>> +++ b/package/udisks/udisks.mk
>> @@ -39,4 +39,8 @@ UDISKS_CONF_OPTS = \
>>    	--disable-vdo \
>>    	--disable-zram
>>    
>> +ifeq ($(BR2_PACKAGE_UDISKS_FHS_MEDIA),y)
>> +UDISKS_CONF_OPTS += --enable-fhs-media
> 
> Could you add:
> 
> else
> UDISKS_CONF_OPTS += --disable-fhs-media
> 
> So that we are explicit about what happens when the option is disabled?
> 
> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
