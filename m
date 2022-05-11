Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD5EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 10:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBA1740B6A;
	Wed, 11 May 2022 10:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xcaqQuaIGml; Wed, 11 May 2022 10:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBCC440B53;
	Wed, 11 May 2022 10:09:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 432991BF5B3
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 10:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FFCA4167D
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 10:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5pgZh0RWGkR for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 10:09:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 974BA40247
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:09:37 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7BD0A440F29;
 Wed, 11 May 2022 13:08:34 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652263714;
 bh=LLASWrVPzUkBcrUVd33XEdRq9Qp6AEU/M83NblEHyVA=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=BttjCs3u7OBxdTb1X7/IL43XzCos6hL5x7yM/l87JNNc0HdwjLPmwhEfhQNFtD1k0
 c72ASjFS2+LdMhOzVgTf+Mh40LyhUnQ1nlISklJ5+oVAK6tdlM0ERkXy7y34ZK1Zls
 23x4d/128i87rIBs6M0A0uMOqQLGuxg1lWSkAXe4ZkC6fgslQiebalkuxteilbi6wx
 mmHTIYm3lmyX3+quIAwvzLEirtfsTdXmEmgf/KCQBT69vqwpWwHLzQI2cwoNfBqdIX
 DHc+dn+pVaWAKDy4TatmoJ973h0YH/J98QfC4zoWz1kfEWJ7nTFnPlG3G8PbGRCjT/
 Dve3E+NWVboBw==
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
 <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
 <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 11 May 2022 13:06:16 +0300
In-reply-to: <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
Message-ID: <878rr88joi.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Alsey Miller <alseycmiller@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrey,

On Wed, May 11 2022, Andrey Nechypurenko wrote:
>> On 10/05/2022 17:20, Andrey Nechypurenko wrote:
>> >>> I am just curious if the following patch will be accepted for the
>> >>> upcoming release?
>> >>
>> >> What about bumping it to 3.23.1?
>> >
>> > At the time I submitted the patch (29.03), v.3.22 was the latest one. It
>> > also fixes the bug I was facing. So it is good enough for me and definitely
>> > better than v.3.18 currently used by Buildroot. If you would like to submit
>> > another one for v. 3.23.1 it would be great.
>>
>>   Up to now, we've always kept the cmake version in sync with the value of
>> BR2_CMAKE_VERSION_MIN (defined in support/dependencies/check-host-cmake.mk and
>> updated every time there is a package that requires a specific newer version -
>> like swift would, as mentioned by Alsey.
>
> In addition to the Swift package mentioned by Alsey, there could be custom
> packages added by Buildroot users with external trees. This is what I am
> currently doing.
>
>>   What is the bug you were facing?
>
> Our custom package uses a feature which was buggy:
> https://gitlab.kitware.com/cmake/cmake/-/issues/18299 (it is also mentioned
> in the submitted patch). This bug was fixed in CMake 3.20.
>
>> Perhaps backporting its fix is appropriate?
>
> If the proposed patch with v.3.22 does not introduce any regression, then I
> personally do not see any reasons for backporting. 3.18 is two years old and
> it might be beneficial to switch to a newer one.

Backporting the cmake fix alone would not help hosts with cmake version
3.18 installed. With current BR2_CMAKE_VERSION_MIN set to 3.18 Buildroot
will not build the fixed cmake host package, but rely instead on the
buggy host installed cmake.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
