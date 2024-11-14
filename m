Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB6FD68B19
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 13:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B3B8456E;
	Thu, 14 Nov 2024 13:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0j-R-YhLDl3h; Thu, 14 Nov 2024 13:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F3784572
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F3784572;
	Thu, 14 Nov 2024 13:52:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3DFD972
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D43FE42F8C
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Uofk_cT6Qmy for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 13:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D78A642FB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D78A642FB1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D78A642FB1
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:52:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 510F860005;
 Thu, 14 Nov 2024 13:52:13 +0000 (UTC)
Message-ID: <61e55ae2-676f-4795-b660-44c95bc254c1@korsgaard.com>
Date: Thu, 14 Nov 2024 14:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: buildroot@buildroot.org
References: <87cyiyxpsg.fsf@dell.be.48ers.dk>
 <ZzXwnIy2hU9zDrwF@smile.fi.intel.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <ZzXwnIy2hU9zDrwF@smile.fi.intel.com>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Buildroot 2024.11-rc1 released
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

On 11/14/24 13:44, Andy Shevchenko wrote:

>> And a special thanks to our patch reviewers:
>>
>> git log 2024.08.. | grep -Ei '(reviewed|acked)-by:' | \
>>      sed 's/.*by: //' | sort | uniq -c | sort -n -r
> 
> Useless use of grep and sed :-)
> 
> I get this via
> 
> $ git log --no-merges --grep '(Reviewed|Acked)-by:' -E -i --format="%(trailers:valueonly=true,key=Reviewed-by,key=Acked-by)%-C()" 2024.08.. | sort | uniq -c | sort -nr
> 
> (yes, that's a bit longer, but faster :-)

Thanks, I will try to remember for next release.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
