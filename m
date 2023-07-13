Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D272EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 03:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC6F41F6E;
	Thu, 13 Jul 2023 03:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC6F41F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTveYE3ip3Yv; Thu, 13 Jul 2023 03:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B3241DBB;
	Thu, 13 Jul 2023 03:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B3241DBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3A991BF3AD
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 03:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D436405E0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 03:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D436405E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ouep3pCGfMP for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 03:25:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5071640018
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5071640018
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 03:25:02 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 8737F4405F3;
 Thu, 13 Jul 2023 06:24:30 +0300 (IDT)
References: <20230611233619.128038-1-grzegorz@blach.pl>
 <20230611233619.128038-6-grzegorz@blach.pl>
 <20230712230206.359c037e@windsurf>
User-agent: mu4e 1.9.21; emacs 28.2
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Jul 2023 06:24:08 +0300
In-reply-to: <20230712230206.359c037e@windsurf>
Message-ID: <87lefkwl12.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1689218670;
 bh=T0TZqWR3wWhRGnBvdNpGgvPqbqSmCk49Jx29RyR3yOc=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=tcVMmVKTGW6Az1+l+SwWMvxAX1TsDwBSG06VReOmcgeCaefti0UgxrzcccEu8gKuo
 +z5tLCUIlLk5Dp0jzRN3lg/UgaDcYj+VMCGTR5BDEkiy1rPGBpFwwLmKiTGCNiKaRG
 6mOqDnvXKNgqIxtc/uzvf0IzMlF6FTW9sLX0oJuhglo96nYRS+9w1rur0jJDH0KLwI
 7nMELRa8X4Cija9K/qdlwYKNU6hsXr7QBeomsR26FKSobUjLHMDR/DmJOwwCjl1GDn
 GJD8q+7BuhbMxTbnZ11kNIfvk7HuR1Kz7eb79k5aahRWj/Jd/tYVf1I8YA/TCxcUDb
 fUSWSoDTNtfmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=tcVMmVKT
Subject: Re: [Buildroot] [PATCH 6/6] package/python-rpi-ws281x: bump to
 version 5.0.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Wed, Jul 12 2023, Thomas Petazzoni via buildroot wrote:
> On Mon, 12 Jun 2023 01:36:19 +0200
> Grzegorz Blach <grzegorz@blach.pl> wrote:
>
>> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
>> ---
>>  package/python-rpi-ws281x/python-rpi-ws281x.hash | 4 ++--
>>  package/python-rpi-ws281x/python-rpi-ws281x.mk   | 4 ++--
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> Applied to master, thanks.

Not in current master as of commit 587d392df7d1
("support/testing/tests/package/test_shadow: fix flake8 warning").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
