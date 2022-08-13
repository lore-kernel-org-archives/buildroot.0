Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFE4C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 833A160797;
	Sat, 13 Aug 2022 20:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 833A160797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSWi3P3VDQxP; Sat, 13 Aug 2022 20:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921C560759;
	Sat, 13 Aug 2022 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 921C560759
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4827B1BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 20:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 237EC82779
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 237EC82779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQ1mFotrKSpj for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 20:01:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB0DE8275A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB0DE8275A
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 20:01:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp4-g21.free.fr (Postfix) with ESMTP id 8BB4119F735;
 Sat, 13 Aug 2022 22:01:21 +0200 (CEST)
Received: from [37.166.134.74]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sat, 13 Aug 2022 22:01:21 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220813125424.6caa746b@windsurf>
References: <20220813093627.369221-1-ju.o@free.fr>
 <20220813125424.6caa746b@windsurf>
Message-ID: <e0634cb156656205a84bc7ecce8a9412@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660420881;
 bh=6HrYReqv3TBFAHYFins/yXG45+jEOjED9/9ha8BnIM0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g7XIZkjl7sWQS31Xvb2rS17Q15LVXUoc8RfbqsVXhzNxM8FiqRcur+sLFHwubuc0I
 ZES8jRaAO+6PRKRgWmd0wrR2LMS9h+3y9edXsPZ5IvDE0iKEw1NmDsc6Jw1jb3sJPp
 B4G64wXKNmSXgSM/VxwL8NUD6LryxYQ1ZHJru85538PPcWKEGL08sWA9QOulihFplV
 zUAYJb+HjhGT83ZHyVox7JI57sPrbGGBJ2izDdYbWR/EX/B/o2Pf/v+GXj9ivKchhk
 qnbqkp6b5IBoRlrhj+U61t1Vs/7SFvLvRmqkqfYqiO6voo3Zo9UW/wfSRHSYPy3ZiP
 7tg2iBcz5n4ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g7XIZkjl
Subject: Re: [Buildroot] [PATCH next 1/1] package/linux-backports: bump
 version to 5.15.58
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

Hi Thomas,

On 13/08/2022 12:54, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Sat, 13 Aug 2022 11:36:27 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> This commit also change the minimal supported kernel version from 3.10
>> to 4.4. See [1].
> 
> Could this be problematic for some of our users? Do we want to keep
> support for an older linux-backports release to still support 3.10
> kernels?
> 
> I can imagine that the people who end up using linux-backports are
> probably stuck with an old kernel for some reason, so raising the
> minimum kernel version required to use linux-backports is probably
> something we should do with a bit of care?

I agree that the purpose of linux-backports is to bring new drivers to
old kernels. Then, how old is reasonably old?

Few points:

- v4.4 was released in January 2016. It is no longer maintained (last
   version is v4.4.302 released in February 2022). Oldest still
   maintained LTS is currently 4.9.

- Oldest maintained CIP kernel is currently CIP 4.4. See [1].

- The oldest kernel in Buildroot defconfigs is currently 4.4.7.
   See [2].

- Trying to compile kernel v3.10.108 in qemu_aarch64_virt_defconfig
   did not worked out-of-the-box for me (on Buildroot tag
   2022.08-rc1, in utils/docker-run). Build fails with:

     dtc-lexer.lex.c: In function 'yylex':
     dtc-lexer.l:46:18: error: 'yylloc' undeclared (first use in this 
function); did you mean 'yyalloc'?

I thought it would not be such big issue to update linux-backports and 
raise
its minimal kernel version requirement to 4.4 (which is somewhat the 
oldest
kernel which is still maintained we can get today).

I let you decide what is the oldest kernel version which is supposed
to compile in Buildroot, at a given point in time. Maybe we could add
a test or a defconfig for that version, to make sure it's actually
working.

In the meantime, I suggest we could update linux-backports to the
intermediate version v5.10.110-1 which is the highest version which
does not change the minimal kernel version requirement (which
is >= 3.10).

What do you think?

Best regards,

Julien.

[1] 
https://wiki.linuxfoundation.org/civilinfrastructureplatform/start#kernel_maintainership
[2] 
https://git.busybox.net/buildroot/tree/configs/s6lx9_microboard_defconfig?h=2022.08-rc1#n10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
