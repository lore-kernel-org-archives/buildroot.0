Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8090CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 15:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB15082846;
	Sun, 23 Jan 2022 15:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCpcdBLsCzod; Sun, 23 Jan 2022 15:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D6781AF6;
	Sun, 23 Jan 2022 15:34:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 395F61BF2F0
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 15:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27B1460BFF
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 15:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQiOAGbpBjhq for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 15:34:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAEEA60BF1
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 15:34:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp3-g21.free.fr (Postfix) with ESMTP id C78EC13F814;
 Sun, 23 Jan 2022 16:34:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642952058;
 bh=yg7LkGKVm4PLR/k8ecXlx3mrHJczpUF2cvKOKpiLG1A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uXYY3D2tONfmfeyuwbOjIopp0vVL6CH993346hXBZ8VJ/i7TOgsZSmfZ8CoVaq412
 I5zA9GCftCg9YmTvm4ber5D4R1vuxoAOmztbt0l/02n6dQg00VOGwPZa4pVJoqzC8V
 Jb6XmrZm4d1hbCh49bppHSBm1tedlSCVsZnIRDQaDujI0AudXqaJk7OmAkV7/HR0Mp
 BbqfbWpGGh7p/+3XZfCfe1X6sXcONVlNdpquXBQLmV1hiVeofp0VDFBgRVQUhqDWAK
 waQEENf00bJXRKGpXhHdoLVX6SYaQh8pomVvdteYRsU5ezGInuFN67LVlx7ze1wpXw
 zUDQ7DmdOJ3Ww==
Received: from [37.164.161.123]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 23 Jan 2022 16:34:18 +0100
From: Julien Olivain <ju.o@free.fr>
To: arnout@mind.be, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <6ece845a-20a1-4d79-c544-21e0f1f2fc6f@mind.be>
References: <20220110200151.830192-1-ju.o@free.fr>
 <20220113215104.02a734a1@windsurf>
 <77b72a63fdde563f496649641a0efab1@free.fr>
 <6ece845a-20a1-4d79-c544-21e0f1f2fc6f@mind.be>
Message-ID: <0b192b9e1ca3de226b780e0f9440f000@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: new package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On 16/01/2022 13:01, arnout at mind.be wrote:
> On 16/01/2022 11:55, Julien Olivain wrote:
>> Hi Thomas,
>> 
>> On 13/01/2022 21:51, Thomas Petazzoni wrote:
>>> Hello Julien,
>>> 
>>> On Mon, 10 Jan 2022 21:01:51 +0100
>>> Julien Olivain <ju.o at free.fr> wrote:
>>> 
>>>> ?[...]
>>>> +config BR2_PACKAGE_PYTHON_GNUPG
>>>> +??? bool "python-gnupg"
>>>> +??? select BR2_PACKAGE_GNUPG2 if !BR2_PACKAGE_GNUPG # runtime
>>> 
>>> This generates a circular dependency reported by kconfig, because
>>> another package does exactly the opposite. So I have inverted the 
>>> logic
>>> here:
>>> 
>>> select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2 # runtime
>> 
>> What do you think about reversing the logic of all Buildroot packages
>> selecting gnupg so they default to gnupg2?
>> 
>> Quoting: https://gnupg.org/download/index.html
>> """
>> GnuPG 1.4 is the old, single binary version which still support the
>> unsafe PGP-2 keys. This branch has no dependencies on the above listed
>> libraries or the Pinentry. However, it lacks many modern features and
>> will receive only important updates.
>> """
>> 
>> There is currently only two packages selecting gnupg:
>> gpgme and python-gnupg
>> 
>> Most Linux distributions are now shipping gnupg2 by default.? gnupg v1
>> is now more for legacy/compatibility cases.
> 
>   Perhaps we should simply remove gnupg instead. We've had gnupg2 for 
> 7.5 years
> now, that should be enough to migrate.

I think gnupg (version 1) should be kept in Buildroot:
- it's still maintained (only for important updates),
- it has a smaller footprint (compared to v2),
- it has less dependencies (only zlib),
- it has less build dependencies (can build static, no need for 
MMU/threads, ...)

gnupg1 might still be useful in some specific cases. This is why I was
mentioning to switch the default version to v2, rather than removing v1.

Best regards,

Julien.

>   Regards,
>   Arnout
> 
>> 
>> If you agree, I can send a patch for this.
>> 
>> Best regards,
>> 
>> Julien.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
