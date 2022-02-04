Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FCBC433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 11:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B08D383112;
	Fri,  4 Feb 2022 11:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJfT7fZL2zP8; Fri,  4 Feb 2022 11:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03562830C2;
	Fri,  4 Feb 2022 11:21:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2681BF339
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 11:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A4A260B5E
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 11:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqmAtgPeplLQ for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 11:21:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id B948A60B5C
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 11:21:45 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FweqnQ46r4NL9FwernW9K0; Fri, 04 Feb 2022 12:21:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643973703; bh=5FubwFOyz/yYBVWxJKY2byzCpExqZRgMAk3w+YX8nos=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=W8NRzIkbLu0tjrXKCkINxvpItc1LN1oPbtx5mnOQgysPH4X/jvV4TNnN1NVvcxM5H
 wU+Rjfh8q5LqoIgVNFjOY1xBT34BgOYqF8Gf1c/ZLHp+QOV9UfsjnIGuZx1uhRcgbf
 hkpPEZutUnPhknm3dnvijI/aa+1PaW6GwdXRZnqwinKpDWuGBBNqur3dsW02IqVxx8
 mQDvsRAQWhH/P5H0iIuDAJryaTiQP+LKcf0pz0okKQYXQWGaUdSRp9OILenlZ0NjT2
 jvHbiwG6T8bs+4dSUflpXAkUE6vDe9Qop2g34AiWTV58indXMP+sgmQ4XWRs0TmvIM
 irTjYCrAfcF2A==
Message-ID: <67349e3c-373f-905a-840a-55c4b8143906@benettiengineering.com>
Date: Fri, 4 Feb 2022 12:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
 <CADvTj4qg822gvS8ufFWFB8w5Uv+EQ7L4ULJRueQ+rp+MY_ugeA@mail.gmail.com>
 <a07ea4e2-d37b-8596-8cfd-5c5dd29bc279@benettiengineering.com>
In-Reply-To: <a07ea4e2-d37b-8596-8cfd-5c5dd29bc279@benettiengineering.com>
X-CMAE-Envelope: MS4wfB6uXBZHl6jbTlgcj89lP/xP1YKFmtJUnOcqnIiPkFDS6ROELQg63Slz0ZQGXt3Nq28lGWh6mUz3rOwEt2pR8F8GmIek84vgV1jJ9C3DCDUn4rlVuJZh
 tUW+VhklUkiY27XAq7ckyEi1n5g2aatjix9Gns13M1bi7zOTSOkEzTZxtZGEckbI2BocqIsyrA9FJ9bowoI5D7z5PYucS8CrE/GOUK8uTCU9FcpxJHpBnlQL
 jdWC8HcqJOVa/1IyNmJ9Qs9SyNkidL67E8BSOC1Yb3Y=
Subject: Re: [Buildroot] qt5webengine build failure on gitlab-CI
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/02/22 11:27, Giulio Benetti wrote:
> Hi James,
> 
> On 04/02/22 09:52, James Hilliard wrote:
>> On Thu, Feb 3, 2022 at 6:03 PM Giulio Benetti
>> <giulio.benetti@benettiengineering.com> wrote:
>>>
>>> Hi Peter and James,
>>>
>>> I can fix this build failure[1] due to qt5webengine, you're the experts
>>> here, can you take a look please?
>>>
>>> You have to build using official docker as I've described in this patch
>>> for the manual:
>>> https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/
>>>
>>> I've tried this patch:
>>> https://patchwork.ozlabs.org/project/buildroot/patch/20220117114358.3814200-1-james.hilliard1@gmail.com/
>>> but it didn't help :-/
>>
>> I've got a WIP branch that should hopefully fix this and a bunch of
>> related issues,
>> cleaning it up at the moment:
>> https://github.com/buildroot/buildroot/compare/master...jameshilliard:qt5webengine-kde
> 
> This is a good improvement, but I need something to fix the actual
> problem and that can be eventually backported, so this:
> https://patchwork.ozlabs.org/project/buildroot/patch/20201221203952.22168-3-ps.report@gmx.net/
> fits more our needs for the moment.

I was wrong, I haven't pulled the master branch so I was still building 
5.15.2 and no 5.15.8

Look forward for having your patch to test then.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
