Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E59C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:19:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC1660F92
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CC1660F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D46403BD;
	Sun, 19 Sep 2021 19:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-9BVBjPsgWS; Sun, 19 Sep 2021 19:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A697403C0;
	Sun, 19 Sep 2021 19:19:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79BD01BF2F5
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 768D160726
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9AAihQjClgz for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 19:18:58 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTP id E48D2606D6
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 19:18:57 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S2EAm8kGYFA2gS2EBm3QWV; Sun, 19 Sep 2021 21:11:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632078711; bh=FfWn0LvDThbs4vVTynT/u66/r0MtGWYmuxxvj7gIHl4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=nCrY6469V3eYTsZjJ5mXMNlYShjP7+D88ftYQ1ZWKbW+vbaRkk0lnz+HXllfnNhx5
 1TWAbQoLNYyhpjn3WJCco4jS+ipFsVl67QtPYYZ95orQwFr9nRJIXscRYQsdVFA4fb
 VbRsksXTn3qeRf4cV63l5ZWWiC99+pCSsbNuHDwi45+G7LElkBt5tCrBy2ZchQr5os
 FPm93v7L7bcnksMTnz3wwsrskm11pJQ0Hyo46WcbijcfM0lrVz5EPaEhYhT7cbxVk3
 IZ7qGE640hYnlvginutIF4lE9f2KVAtI+JvOJ6mb2ZZ7xlKgyCQtb1e2Svq0KEKH2y
 MPoze8yHvzZ5A==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210906213938.201161-1-giulio.benetti@benettiengineering.com>
 <20210919071555.GF1053080@scaer>
 <1a389193-3d8d-ffad-b744-7cf5f7412c7d@benettiengineering.com>
 <20210919162546.GU1053080@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <fb108e9c-e3cf-848f-775c-50cbab404385@benettiengineering.com>
Date: Sun, 19 Sep 2021 21:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210919162546.GU1053080@scaer>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNSKYOsm7yvRxUjeWZGrGi2+5VYTp5pvWGM/CEy4T+mg1bIUXlcVCvop6e+FHluP2WM602LLt3dihnXP1PN7m4esb0SVwkVi0y0LZltfwYymZ25JdXrL
 huZQTz5nOGFbseE9iX4FPK3twKLKbSlFYtLwlizkKw2SNn6sQEHOPi2ZsYJmWoSK1uRbBlClmJkLK7SN1vJyqapDzZ0yEkeUM4HAmobI5u4bFajYnvxlw6ke
 SK8yH1lwku4F9Ybbv6DSAq1itQLqslubVKag+l2mZHY=
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.10.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On 9/19/21 6:25 PM, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2021-09-19 17:13 +0200, Giulio Benetti spake thusly:
>> On 9/19/21 9:15 AM, Yann E. MORIN wrote:
>>> Giulio, All,
>>>
>>> On 2021-09-06 23:39 +0200, Giulio Benetti spake thusly:
>>>> Bump libfuse3 to version 3.10.5 and remove local patch that has been
>>>> upstreamed.
>>>>
>>>> Release notes:
>>>> Various improvements to make unit tests more robust.
>>>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>
>>> Applied to master, thanks.
>>>
>>> It should also fix the same build failure that occurs with glibc 2.34 on
>>> the old libfuse (pre-3).

Aaah, "It should also fix" you meant the actual patch

>>
>> I don't understand here. There is a patch already applied for glibc 2.34 on
>> the old libfuse:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20210912194057.2556882-1-fontaine.fabrice@gmail.com/
>>
>> I don't understand how this version bump of libfuse3 can help. Have I missed
>> something?
> 
> libfuse and libfuse3 are really just the same upstream project.
> 
> The patch that Fabrice submitted on libfuse is a backport of an upstream
> commit that was applied between libfuse 3.10.4 and 3.10.5.
> 
> So:
> 
>    - libfuse is fixed thanks to the backport of the upstream commit;
> 
>    - libfuse3 is fixed thanks to the version bump that includes the
>      upstream commit.
> 
> But we so far had no such build failiure on libfuse3, probably because
> the autobuilders have not had time yet to hit it.

Ok, now everything is clear.

Thank you :-)

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
