Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED108C433F5
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 20:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 580B4408BA;
	Sat,  7 May 2022 20:07:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVss44cf6fpn; Sat,  7 May 2022 20:07:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7155940199;
	Sat,  7 May 2022 20:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA121BF599
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36B1F40199
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdg2zRVhtI7m for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 20:07:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 975F34017B
 for <buildroot@buildroot.org>; Sat,  7 May 2022 20:07:48 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 398F2440F56;
 Sat,  7 May 2022 23:06:47 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1651954007;
 bh=Wau5bwozgdo3u738Hy7lQfioLJGPGUrG78vv0j93bDo=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=n8w4XolIZerY2c9kMf6JcB9etLGrVvSw3dEWkcavVXN5fXrzpRu0l28ph/xB2dCje
 WiOKstjn85PzujrtjqRlpnzXywp3UYj6JSRk3RyW7zrDCR+FBE1jXdC7E6HIRqgxDa
 rkdCZXfDWNkcGYzYx9EhGESTctY197lPicbMSz4U9LAYF7Id4WZCW/0K2sTh2Hdqdv
 cFIgO4McebfVhW7Eczsm9HPgxt6WEyXdo5VpRcEkiG6hazAebdtzkUkfuOmc02WE2Z
 AoPLelOOlDpCI4Axf72pFpRfCgUhpVHNyq3jKkdMBjbvPYREBgxsWpAq+h8PPHO5ku
 hxzyaqacyZCNA==
References: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
 <878rrfibvx.fsf@tarshish>
 <CAJ+vNU3KHR+J0y9o3CVOC+1zA6G3=kQG2G_bQ2PSegFho8c9BA@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Tim Harvey <tharvey@gateworks.com>
Date: Sat, 07 May 2022 23:05:52 +0300
In-reply-to: <CAJ+vNU3KHR+J0y9o3CVOC+1zA6G3=kQG2G_bQ2PSegFho8c9BA@mail.gmail.com>
Message-ID: <8735hl9kdt.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] how to get buildroot to update a git repo that has
 changes? (ie building HEAD vs a specific SHA)
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tim,

On Fri, May 06 2022, Tim Harvey wrote:
> On Thu, May 5, 2022 at 8:21 PM Baruch Siach <baruch@tkos.co.il> wrote:
>> On Thu, May 05 2022, Tim Harvey wrote:
>> > Greetings,
>> >
>> > I use buildroot to build a Linux kernel+ramdisk using:
>> > BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> > BR2_LINUX_KERNEL_CUSTOM_REPO_URL=<gitrepo>
>> > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=<gitbranch>
>> >
>> > When the upstream branch changes I would like to build that kernel but
>> > I find that buildroot caches the repo in dl/linux/.git and doesn't
>> > seem to know how to check to see if there are new commits.
>> >
>> > I realize that this is atypical as typically you want to configure
>> > buildroot for a specific package gitsha/tag.
>> >
>> > How would I go about getting buildroot to update the repo? I don't
>> > particularly want to rm dl/linux I want to instead somehow check to
>> > see if the repo needs a refresh then refresh it without a massive
>> > network download.
>>
>> Using a branch name for _VERSION is not supported. See the rationale in
>> the manual section 18.6.2, note on LIBFOO_VERSION description.
>>
>>   https://buildroot.org/downloads/manual/manual.html
>>
>> You might want to consider using OVERRIDE_SRCDIR to make Buildroot build
>> your local kernel source tree. See section 8.14.6 in the manual.
>
> Thanks for the references. I do understand that it is not supported. I
> guess I was looking for a few simple lines of shell that would tell me
> if the cached repo was out of date so that I could remove it.
> # get branch from BR2 config
> KERNEL_BRANCH=$(grep BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION .config |
> cut -d= -f2 | tr -d \")
> # get the HEAD commit from the BR2 cache
> KERNEL_HEAD=$(git -C dl/linux/git/ rev-parse $KERNEL_BRANCH)
> ^^^ but I'm not sure how to check to see what the latest revision is
> on the remote branch?

Check 'git ls-remote'.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
