Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A464C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08FA60F94
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B08FA60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A5D60732;
	Sat,  9 Oct 2021 19:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRmhZjkhkhau; Sat,  9 Oct 2021 19:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B2F6070F;
	Sat,  9 Oct 2021 19:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95F491BF31A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 822924057C
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvWGe-HOqlyp for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 19:34:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1A8840577
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 19:34:22 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 64B1F440EDD;
 Sat,  9 Oct 2021 22:33:28 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1633808014;
 bh=ybQNg6thSYtv5tjXysh8aukyGDjBYhTCa4XoYxxCm0w=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=LsvaJ83tm0nuyO17+ey+68hQJKROYfWTRywDnekB2edP4nl2g9DuW65QJDO58vtMX
 ucJL9fLtnDumxLmqfOkyhuiJs+xx/GioJVvlNfH4EjYxEA1jAWehtrZZiPy7IO0YPo
 E2fPE0L16qDpg+RqXjs3TUEl1yQDd9V5idZZbOB/+cq259Y5758UeLAIQ7lMkhc7xz
 rmtiBnLD4slOj7Z2pwvB2bfA54RMr/Q1f1sq5WGLIORZ45aeTI0rjvIdIH+G8487nl
 gtR/Nz2Z9YAFz/kPXXVc1BdS9l1J4xIBuMCwGaaTIxFlkQA+lG/WMRTmdlYgGlN7jh
 elYdW+I1oOMwQ==
References: <87a6jl5qvb.fsf@tarshish> <20211007060119.GG2081069@scaer>
User-agent: mu4e 1.6.6; emacs 27.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Jeremy Kerr <jk@ozlabs.org>
Date: Sat, 09 Oct 2021 22:26:26 +0300
In-reply-to: <20211007060119.GG2081069@scaer>
Message-ID: <87bl3ym1qr.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot patchwork strange Submitter
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, Jeremy,

On Thu, Oct 07 2021, Yann E. MORIN wrote:
> On 2021-10-07 08:13 +0300, Baruch Siach via buildroot spake thusly:
>> The "Submitter" field of some Buildroot patchwork entries over the last
>> few days from different senders is set to "Baruch Siach via buildroot":
>>   http://patchwork.ozlabs.org/project/buildroot/list/?submitter=82609
>> 
>> Any idea what might be causing that?
>
> That's because of DMARC mangling in the mailing list (or something like
> that, I'm no expert): the From field is replaced by the list adress, and
> thus the patches look like they are all from the same sender, and
> somehow the name of that sender is arbitrarily chosen... Not sure aboutr
> the heuristic...
>
> And this time it picked yours. In the past, it picked others' nmaes, and
> I expect in the future it will pick another one...

Patchwork now changed the "Submitter" field on these patches to
Christian Stewart.

This looks unrelated to the content of the email itself. Take a look at
the headers of one of these patchwork entries:

  https://patchwork.ozlabs.org/project/buildroot/patch/RnUd7kxUKLWeLZSMoM1dFtpAD4Qfe3R-67gu27eAGtE6yrgC1oHzq1GwiOoE9Gmk6uZZ-c6k6LUVxdMqKhUro4_bM4zZKPhsbN5e9BV8SV4=@protonmail.com/

You can see that the 'From' header shows the correct sender:

  From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>

I see the same in this email from my archive.

Still, patchwork previously used my name as "Submitter", and now
Christian's. So I think something is wrong with patchwork.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
