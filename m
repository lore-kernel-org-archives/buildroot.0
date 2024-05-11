Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BDBC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 09:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3747E4214C;
	Sat, 11 May 2024 09:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miNVFY7Y-vql; Sat, 11 May 2024 09:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C254160F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C254160F;
	Sat, 11 May 2024 09:09:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E63EB1BF363
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 09:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D30D6613E8
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 09:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lI3IhP8OiNnX for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 09:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53E8A605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53E8A605E9
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53E8A605E9
 for <buildroot@buildroot.org>; Sat, 11 May 2024 09:09:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 916DFC0003;
 Sat, 11 May 2024 09:09:35 +0000 (UTC)
Message-ID: <1d6652d2-b919-48f6-b525-e2b5757b013e@korsgaard.com>
Date: Sat, 11 May 2024 11:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240427140941.381333-1-peter@korsgaard.com>
 <20240509221859.21465e96@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240509221859.21465e96@windsurf>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/python-hid: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 5/9/24 22:18, Thomas Petazzoni wrote:
> On Sat, 27 Apr 2024 16:09:39 +0200
> Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>> A python wrapper for the hidapi library.  Hidapi has fairly complicated
>> dependencies, so use a select rather than a depends on.
> 
> You actually did the opposite :-)
> 
> But in fact, there were only 3 depends, so not that much to propagate,
> so I stuck to our normal way: a select BR2_PACKAGE_HIDAPI + propagation
> of the depends on. Otherwise people will start using that as a counter
> example and use "depends on" where "select" should be used.
> 
> Applied with this change. Thanks!

Heh, indeed - Sorry for the mess, and thanks for fixing it up. I see 
that the unit test still has an explicit BR2_PACKAGE_HIDAPI, but that 
can now be dropped.

I'll send a patch for that.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
