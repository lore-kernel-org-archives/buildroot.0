Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8F1C71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53C48400DD;
	Sun, 10 Sep 2023 21:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53C48400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcjRkcCkG3M7; Sun, 10 Sep 2023 21:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D2364047C;
	Sun, 10 Sep 2023 21:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D2364047C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2552E1BF836
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E8C60B89
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E8C60B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASitM6h49fQB for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:05:24 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96ACC60B42
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96ACC60B42
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 57D35780333;
 Sun, 10 Sep 2023 23:05:19 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60176])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Sep 2023 23:05:19 +0200
MIME-Version: 1.0
Date: Sun, 10 Sep 2023 23:05:19 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <ZP4cBkx2VFsfsN7M@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf> <ZPxtEfe6FVIucVWS@gmail.com>
 <20230909155549.15a4b507@windsurf>
 <35d775ed8e08f7082c025d0c32f53bb4@free.fr> <ZP4cBkx2VFsfsN7M@gmail.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <6316e92cc730f0e9fdd11379a95dd10b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694379921;
 bh=m2+bESEzi4L/8RVE1uGzm0Gd/Izb2FUEV6NlVlCJ88g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UlArpUQ0vhd8RAHqdcrIy2ZyZnKLj/9aSsXP9YeKCE64RIScKvZcvRhkCwkn6IaL6
 5Otc1x7sYV+dzuf/vQAdwGfJ3oMFlHZx9brlLBK47BEz3hxpHKkPfzpumBJlKeG7sm
 kgGreFoyX2mutbF1UG6hFKO9dlhH/+r8URWYUcz1LKL5QQBqSoBtKuKLVC32YLcnJV
 5OnESKrKtFDk9fdT4BHFpMVvTglS+5pJgdf7J1/hfFo/2aiLoBcVILQkyy5yPxvJN/
 uLW4/R4O3ClRD9TTPSGv1mz0LMGAs94aql0J3Jus3+q1osWKtC0+uYDr3y6e2YXB/Q
 NOTMKZVJEWH9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UlArpUQ0
Subject: Re: [Buildroot] [PATCH 1/2] package/criu: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

On 10/09/2023 21:41, Marcus Folkesson wrote:
> Hi Julien,
> 
> On Sat, Sep 09, 2023 at 11:16:27PM +0200, Julien Olivain wrote:
>> Hi Thomas, Marcus,
>> 
>> On 09/09/2023 15:55, Thomas Petazzoni wrote:
>> > On Sat, 9 Sep 2023 15:03:13 +0200
>> > Marcus Folkesson <marcus.folkesson@gmail.com> wrote:
>> >
>> > > Thank you for your solid review.
>> 
>> [...]
>> 
>> > One good thing would be to have a runtime test for criu, in
>> > support/testing. Julien Olivain (in Cc) can probably provide some
>> > guidance here.
>> 
>> 
>> Marcus, you should be able to reproduce that with the command:
>> 
>>     utils/test-pkg -p criu
> 
> I've sent out a v2 where the comments from Thomas is addressed. But I 
> am
> not able to reproduce the errors you got with test-pkg.
> 
> I'm not sure why it skips my tests. Could you please provide some
> guidance?

All test are skipped because of the "depends on
BR2_PACKAGE_HOST_PYTHON3" not being set by default.

I'm not sure is this "depends on" is really needed, as I expect it
to be a build dependency. If it's the case, the dependency is only
needed in the .mk file. I let the reviewers comment the v2 patch
on that topic...

Anyways, for the moment, this can be managed by manually creating a
config setting this for test-pkg. For example:

     cat > criu.config <<EOF
     BR2_PACKAGE_HOST_PYTHON3=y
     BR2_PACKAGE_CRIU=y
     EOF

Then, test-pkg will no longer skip the tests. On my side, I now see:

     utils/test-pkg -c criu.config -p criu
                     bootlin-armv5-uclibc [1/6]: FAILED
                      bootlin-armv7-glibc [2/6]: FAILED
                    bootlin-armv7m-uclibc [3/6]: SKIPPED
                      bootlin-x86-64-musl [4/6]: OK
                       br-arm-full-static [5/6]: SKIPPED
                             sourcery-arm [6/6]: FAILED
     6 builds, 2 skipped, 3 build failed, 0 legal-info failed, 0 
show-info failed

I let you inspect the build log files ~/br-test-pkg/*/logfile for
the details.

With this v2, I am now able to build criu on some x86_64 and Aarch64
configurations, so I can start writing a runtime test ;)

>> Ideally, the package should have no failure (i.e. only OK or SKIPPED)
>> when testing all toolchains, with:
>> 
>>     utils/test-pkg -a -p criu

Then, once the test-pkg (without "-a") will have no failure, it will
be a good test to retry it _with_ the "-a" option:

     utils/test-pkg -c criu.config -p criu

>> For the details, see:
>> https://nightly.buildroot.org/manual.html#testing-package

Thanks again!

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
