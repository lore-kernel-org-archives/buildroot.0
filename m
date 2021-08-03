Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4CBC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 18:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 614A260F45
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 18:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 614A260F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AA4340498;
	Tue,  3 Aug 2021 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDOdQ5R2yM6q; Tue,  3 Aug 2021 18:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC68D4050F;
	Tue,  3 Aug 2021 18:56:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 132781BF847
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 18:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 001AE40209
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 18:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZENwLx5Vemjs for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 18:56:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 935CF40001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 18:56:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F74C1814B9; Tue,  3 Aug 2021 20:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1628016996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=0kKayyqLxOfzIQCJQpov4Oq+HG0c6LoecATkEU5RTfY=;
 b=UHJhMh7rNshIglkY6s9DD8qj2cfeRkMNIv1VO5StcswdmIW8hh6BKj5vz3v+gicjJql5g0
 isdxcwhCwWJItF7KRXwLLv62309fIAsgRdEdPKqaLYt1mnoETShmbkaHrBjh5pm/3Wgs8G
 JC4kAvU4xXYWiXo4IC330apKTsb6sSw=
To: Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210802162244.620782-1-arnout@mind.be>
 <20210802162244.620782-2-arnout@mind.be> <20210803054842.GF27036@scaer>
 <4b68e8fc-81ce-d0f9-9337-df95eb3715ea@mind.be>
Message-ID: <68f35ba6-c038-6d46-c4ea-ee0cbc46bceb@heine.tech>
Date: Tue, 3 Aug 2021 20:56:34 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4b68e8fc-81ce-d0f9-9337-df95eb3715ea@mind.be>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC 2/2] docs/manual/migrating.txt: add
 "individual packages" section
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
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,


On 03.08.21 17:19, Arnout Vandecappelle wrote:
>
> On 03/08/2021 07:48, Yann E. MORIN wrote:
>> Arnout, All,
>>
>> On 2021-08-02 18:22 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>>> Add a section to the migrating documentation to explain what changed in
>>> individual packages and how it may affect your build.
>>>
>>> This section is organised per package, not per Buildroot release,
>>> because in general it's easier to check package per package if anything
>>> changed than to check release per release for all your packages.
>>>
>>> The idea is that every time a package is changed in a way that is not
>>> immediately obvious (mainly: affects runtime but not build time), it is
>>> mentioned in this section. This may include:
>>>
>>> - a new version of the package got a new name due to API
>>>    incompatibilities;
>>> - the default behaviour or config optoins of the package changed;
>>> - the Buildroot integration (e.g. configuration file, init script) of
>>>    the package changed;
>>> - what is installed by the package is changed (e.g. executable is
>>>    renamed or removed).
>> No. Please, no.
>>
>> We already have two locations were changes in packages are identified:
>>
>>    - git commit logs, the authoritative reference,
>>
>>    - the CHANGES files
>>
>> I do not want to have to maintain yet a third, ever-growing and
>> never-trimmed list. Also, we will always have to bikeshed whther such a
>> change is disruptive enough or not to warrant being on that list...
>>
>> Instead, I would just suggest that people run "git log --oneline" or
>> "git log -p --stat" on the packages they are interested in.
>   That's good advice as well. Simple "git log" should be sufficient though, if
> the commit log is OK. "git log --oneline" is definitely not OK, because
> important changes during a version bump will not appear in the oneline.
>
>   I'm going to add a bullet point for this and merge it into the first patch.

One thing I want to point out: The releases are tarballs. Should we 
assume the user has the git history available?


Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
