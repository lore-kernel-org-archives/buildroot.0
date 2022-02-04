Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B303DC433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 10:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B98840D8;
	Fri,  4 Feb 2022 10:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11aykfS_jsKC; Fri,  4 Feb 2022 10:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 767DD840D5;
	Fri,  4 Feb 2022 10:27:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 329841BF34D
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1508C840D5
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubyjDO3JYSP5 for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 10:27:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECAA4840D4
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 10:27:34 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FvoSnNppW4NL9FvoTnVMrU; Fri, 04 Feb 2022 11:27:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643970453; bh=+wMyjdwotW5BnZW4/bTuMNPbcQAxRZPlubCZ7BZiiwI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Fy/AM+sgYoFsBDknJSXQ/QRBJTklsDUp/WkVBxBcyouDZTh+F+KauV3TusyH4ffq/
 RSrDudLMGb4c0ySWYL8qYaSDbYyxERIv47tn9PpiXLVa2ePt7aspR5KgoVgWsr0GSj
 CzzWhUM/As4XnmjQFFvpu4z6coyaIB/O3WJkd8t1E+Gn4s7xe77qFs13N/Yj6Sr9ue
 9XlG6V3ueHrIWsWKFgqLIq4K6NvAxjS+MvI413RvDiKm7hSGP7zE8Iq4C7c2+0Ncb8
 JMjLVb6GGyIJDBLbR+ZPU0AnzQZM2mZmTDB6Xc90IO97O5B+yI4NGQjK0Ne1vGBJXa
 ULaXuOIWNLVdA==
Message-ID: <a07ea4e2-d37b-8596-8cfd-5c5dd29bc279@benettiengineering.com>
Date: Fri, 4 Feb 2022 11:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
 <CADvTj4qg822gvS8ufFWFB8w5Uv+EQ7L4ULJRueQ+rp+MY_ugeA@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CADvTj4qg822gvS8ufFWFB8w5Uv+EQ7L4ULJRueQ+rp+MY_ugeA@mail.gmail.com>
X-CMAE-Envelope: MS4wfG06whymtVWuwllN46Bkb+EFESdepEz1keQF9+JdCmGRBTxdh2CVILoWzTbdqmNAKwX/JgMmqJAFlerdOeYuoXRDw8tzvVZ0aG2v4PtW87pYDgRnJfg4
 +Q3QSDqs6AH0qkqiN1+Eu8u9nWVSsA69m6L40Om1kUxpXbrUs6uV0uXy78HK08kH59w94bacFE33T+LRnCKxbfB3tbOdOIN0RqjyHMZhe6ahM2WanoZntwCe
 4A8wSSUylgIHIsroP7vI9Lh5PSl5y/rZoMeZcKD/FIw=
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

Hi James,

On 04/02/22 09:52, James Hilliard wrote:
> On Thu, Feb 3, 2022 at 6:03 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>> Hi Peter and James,
>>
>> I can fix this build failure[1] due to qt5webengine, you're the experts
>> here, can you take a look please?
>>
>> You have to build using official docker as I've described in this patch
>> for the manual:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/
>>
>> I've tried this patch:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20220117114358.3814200-1-james.hilliard1@gmail.com/
>> but it didn't help :-/
> 
> I've got a WIP branch that should hopefully fix this and a bunch of
> related issues,
> cleaning it up at the moment:
> https://github.com/buildroot/buildroot/compare/master...jameshilliard:qt5webengine-kde

This is a good improvement, but I need something to fix the actual 
problem and that can be eventually backported, so this:
https://patchwork.ozlabs.org/project/buildroot/patch/20201221203952.22168-3-ps.report@gmx.net/
fits more our needs for the moment.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>>
>> Thanks in advance!
>>
>> [1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717230
>>
>> Best regards
>> --
>> Giulio Benetti
>> Benetti Engineering sas
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
