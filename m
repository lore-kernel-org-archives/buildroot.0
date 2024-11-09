Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B60D5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0410E42414;
	Sat,  9 Nov 2024 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yU-SQfj-BTmu; Sat,  9 Nov 2024 17:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF68A4241C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF68A4241C;
	Sat,  9 Nov 2024 17:07:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6E96D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B749440339
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ss4M55sOrl4U for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3404400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3404400D0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3404400D0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:07:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01F0920002
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:06:59 +0000 (UTC)
Message-ID: <1667f49c-b488-46c5-a148-d0d95fff2458@korsgaard.com>
Date: Sat, 9 Nov 2024 18:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241003152523.1131434-1-nunes.erico@gmail.com>
 <20241024224228.55f1a784@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241024224228.55f1a784@windsurf>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop my packages
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

On 10/24/24 22:42, Thomas Petazzoni via buildroot wrote:
> On Thu,  3 Oct 2024 17:25:23 +0200
> Erico Nunes <nunes.erico@gmail.com> wrote:
> 
>> I still follow Buildroot development and use it for some personal
>> projects, but no longer have the time to be an active contributor.
>> Some of these are important defconfigs and packages to have up-to-date
>> in Buildroot, and mostly other developers have been doing that work, so
>> I am dropping them so that someone from the active contributors can be
>> the maintainer contact for them.
>>
>> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>> ---
>>   DEVELOPERS | 12 ------------
>>   1 file changed, 12 deletions(-)
> 
> Applied to master, thanks. That being said, as Arnout said: a given
> package or defconfig can be associated to multiple in our DEVELOPERS
> file. So if you're registered as a developer for a given package or
> defconfig, it doesn't prevent anyone from being registered as a
> developer for the same package or defconfig.
> 
> In any case: thanks a lot for all your contributions to Buildroot!

Committed to 2024.02.x and 2024.08.x, thanks!

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
