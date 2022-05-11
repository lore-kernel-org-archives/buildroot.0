Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 18:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B23D0418BF;
	Wed, 11 May 2022 18:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXTL36ELb3z5; Wed, 11 May 2022 18:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6735E402CE;
	Wed, 11 May 2022 18:03:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE37A1BF402
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 18:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA36060D55
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 18:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-EH9ki1cMVT for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 18:03:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1BE060C22
 for <buildroot@buildroot.org>; Wed, 11 May 2022 18:03:13 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 86566440F2F;
 Wed, 11 May 2022 21:02:09 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652292130;
 bh=Ixz0M63ZU8fIQk7/Oaus7nq74ph9fIzoQhiO58w9XRQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=JN2hA6iNpH59rzAdiHMiTumQUlbDUT7hhJ3zsNVgSouyA00Ht1fjvVPVjXv6HCI7z
 NNACZU9xjdfLbB5dYgHzK1FhvI0YZNHS0W2SimqTAGKt2s/3UAQLtzJNC0CLPFoY3N
 VFToM5tr1CHKTlsk3PADuVcRtjx3HwoCv04INfrjtwZFcLS6QG39FLIl/U3iSt9G7V
 rLoFbbVD3tIiW+zGxU7Eu78cLVSDPbjBnzLEZmZWireyupZfN2KyesyU48p5zmCvrD
 2E45zJoVE5Y7jZceisYCinfXvqy0vXACXkR7g5oxax7RxKbj1z2PvQ1XUZSde5aIMJ
 oiiardE7a/K3A==
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
 <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
 <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
 <878rr88joi.fsf@tarshish> <82370296-a5c0-fa25-1993-1c4a885af02c@mind.be>
User-agent: mu4e 1.6.10; emacs 27.1
To: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 May 2022 20:58:51 +0300
In-reply-to: <82370296-a5c0-fa25-1993-1c4a885af02c@mind.be>
Message-ID: <87zgjo6j6s.fsf@tarshish>
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
Cc: Andrey Nechypurenko <andreynech@gmail.com>,
 Alsey Miller <alseycmiller@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Wed, May 11 2022, Arnout Vandecappelle wrote:
> On 11/05/2022 12:06, Baruch Siach wrote:
>> On Wed, May 11 2022, Andrey Nechypurenko wrote:
>>>> On 10/05/2022 17:20, Andrey Nechypurenko wrote:
>>>>>>> I am just curious if the following patch will be accepted for the
>>>>>>> upcoming release?
>>>>>>
>>>>>> What about bumping it to 3.23.1?
>>>>>
>>>>> At the time I submitted the patch (29.03), v.3.22 was the latest one. It
>>>>> also fixes the bug I was facing. So it is good enough for me and definitely
>>>>> better than v.3.18 currently used by Buildroot. If you would like to submit
>>>>> another one for v. 3.23.1 it would be great.
>>>>
>>>>    Up to now, we've always kept the cmake version in sync with the value of
>>>> BR2_CMAKE_VERSION_MIN (defined in support/dependencies/check-host-cmake.mk and
>>>> updated every time there is a package that requires a specific newer version -
>>>> like swift would, as mentioned by Alsey.
>>>
>>> In addition to the Swift package mentioned by Alsey, there could be custom
>>> packages added by Buildroot users with external trees. This is what I am
>>> currently doing.
>>>
>>>>    What is the bug you were facing?
>>>
>>> Our custom package uses a feature which was buggy:
>>> https://gitlab.kitware.com/cmake/cmake/-/issues/18299 (it is also mentioned
>>> in the submitted patch). This bug was fixed in CMake 3.20.
>>>
>>>> Perhaps backporting its fix is appropriate?
>>>
>>> If the proposed patch with v.3.22 does not introduce any regression, then I
>>> personally do not see any reasons for backporting. 3.18 is two years old and
>>> it might be beneficial to switch to a newer one.
>> Backporting the cmake fix alone would not help hosts with cmake version
>> 3.18 installed. With current BR2_CMAKE_VERSION_MIN set to 3.18 Buildroot
>> will not build the fixed cmake host package, but rely instead on the
>> buggy host installed cmake.
>
>  So we have 3 options:
>
> - Keep the current situation, which creates problems for some external packages.
> - Update cmake but not BR2_CMAKE_VERSION_MIN, which is nice for keeping cmake
>   up to date but doesn't solve anything for people who run into the bug and
>  have CMake 3.18 or 3.19 installed.
> - Update both cmake and BR2_CMAKE_VERSION_MIN, which basically means that
>   everybody has to build host-cmake unless they have a really bleeding edge
>  distro.
>
>  There is a fourth, much more complicated option, which is to allow individual
>  packages to define the minimal cmake version. Then a package that actually
> runs into the problem can force BR2_CMAKE_VERSION_MIN. Of course we'd also
> need to change cmake.mk to use that config-dependendent cmake version. And
> we're in a bit of a tricky situation with the patch version - we'd prefer to
> set BR2_CMAKE_VERSION_MIN to e.g. 3.22, not 3.22.3, so people who have 3.22.1 
> installed on the host don't need to build host-cmake. And there's a problem
> with cmake.hash that needs to contain the hashes of many different versions.
>
>  So overall, nothing good :-(
>
>  With all of the above, I'd say we bump to 3.22.3 (this patch) and set
>  BR2_CMAKE_VERSION_MIN to 3.22. What do others think?

The bug that Andrey encountered is fixed in 3.20. So updating
BR2_CMAKE_VERSION_MIN to 3.20 should be enough, I believe.

Is there a reason to keep BR2_CMAKE_VERSION_MIN and cmake package
version in sync?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
