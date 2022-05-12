Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D419DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 22:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C28A404B3;
	Thu, 12 May 2022 22:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJtjOc8wzDzf; Thu, 12 May 2022 22:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50918400D8;
	Thu, 12 May 2022 22:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1CA61BF31C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B008860767
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 22:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtCxtBXh1PcG for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 22:07:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 385AC60761
 for <buildroot@buildroot.org>; Thu, 12 May 2022 22:07:56 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id d6so7864265ede.8
 for <buildroot@buildroot.org>; Thu, 12 May 2022 15:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fYm+eyPN9j6yu4LSYyJgM1m58RzHqnDu3GaybWDhFxU=;
 b=hv1VyZQCWQEq2Zwp8aq5xxg5T4RCBORsIb/8vbDd4yP4oDl8aySw1YZGJ1cIXh+Ka9
 xVg9dvDRiFWvCqj/HKeuZTBjodz3hMguWPBMJQ3NHWpnmpxI8vk2jv5kn3woTmRpg4az
 ii9NoSwFW49K5yZx6uieVYQkN7Dg2uCEifbHBxZ7hwo1UOvhGzXF3V8Si8jZFOJmZuKQ
 /PvYiCjAiirFLP+iHBgMe0sjvQgTSrRzbpzP+vqgQe675ErOjNSuycrL9fcSFkQtihlp
 fa0tSekPoS/8GQAmkMB9UEcUrnH/Rn76bWnFVeHHhtTyT8Yes2zFUU9K+oo+2AHFpyDt
 WXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fYm+eyPN9j6yu4LSYyJgM1m58RzHqnDu3GaybWDhFxU=;
 b=seDnKXiyX3xZxQkIz3E4EFTcV3oFK8boxTKVVUa1AGEk8PiQyFGL6AyH7Au1ZD5GUs
 rNWDUbapdmh8V25+7sY/2nHMRTe2hYSf1nIsbz7d6OvYiiWgvS15vPE8bZ10wpdFYCBo
 9m9r3L+4sADUTA6tIs+9MNru1q3ZHa34uUNFJ4ec7w2l74F7Gh3XWRvdkqVmy1ZAr6nd
 WnRI8dgSCheXuGuw9BnHDr3hAoarraeTXOKYxA4brL9R3fu8vbqj0/najntl7QkdT0ET
 s37QUa48TTed1iiEqQrlmk//6ivo7YLZ5TtMKA9/htF3jAuaQipbeZqiDeGb2t2e598a
 dQWA==
X-Gm-Message-State: AOAM5327wwTP3222JPO0IXHHykyuOQsy77IsQroahrAPN7kZTmvlYwOV
 +Pg24A/nqpEdBWpytYT2nBklQg==
X-Google-Smtp-Source: ABdhPJypiOtOYrLP89vRlTzB3hlPuB2Xbrgap4SJQ3Ltj4zGDkujpFhSHJvUheFE0Bla9PpqOp2nPw==
X-Received: by 2002:a50:f69b:0:b0:425:e693:5d1f with SMTP id
 d27-20020a50f69b000000b00425e6935d1fmr37231734edn.272.1652393275224; 
 Thu, 12 May 2022 15:07:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hf27-20020a1709072c5b00b006f3ef214e2asm153724ejc.144.2022.05.12.15.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 15:07:54 -0700 (PDT)
Message-ID: <0f1fa89e-fddf-5448-b352-e70966056c2e@mind.be>
Date: Fri, 13 May 2022 00:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
 <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
 <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
 <878rr88joi.fsf@tarshish> <82370296-a5c0-fa25-1993-1c4a885af02c@mind.be>
 <87zgjo6j6s.fsf@tarshish>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87zgjo6j6s.fsf@tarshish>
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
Cc: Andrey Nechypurenko <andreynech@gmail.com>,
 Alsey Miller <alseycmiller@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/05/2022 19:58, Baruch Siach wrote:
> Hi Arnout,
> 
> On Wed, May 11 2022, Arnout Vandecappelle wrote:
>> On 11/05/2022 12:06, Baruch Siach wrote:
>>> On Wed, May 11 2022, Andrey Nechypurenko wrote:
>>>>> On 10/05/2022 17:20, Andrey Nechypurenko wrote:
>>>>>>>> I am just curious if the following patch will be accepted for the
>>>>>>>> upcoming release?
>>>>>>>
>>>>>>> What about bumping it to 3.23.1?
>>>>>>
>>>>>> At the time I submitted the patch (29.03), v.3.22 was the latest one. It
>>>>>> also fixes the bug I was facing. So it is good enough for me and definitely
>>>>>> better than v.3.18 currently used by Buildroot. If you would like to submit
>>>>>> another one for v. 3.23.1 it would be great.
>>>>>
>>>>>     Up to now, we've always kept the cmake version in sync with the value of
>>>>> BR2_CMAKE_VERSION_MIN (defined in support/dependencies/check-host-cmake.mk and
>>>>> updated every time there is a package that requires a specific newer version -
>>>>> like swift would, as mentioned by Alsey.
>>>>
>>>> In addition to the Swift package mentioned by Alsey, there could be custom
>>>> packages added by Buildroot users with external trees. This is what I am
>>>> currently doing.
>>>>
>>>>>     What is the bug you were facing?
>>>>
>>>> Our custom package uses a feature which was buggy:
>>>> https://gitlab.kitware.com/cmake/cmake/-/issues/18299 (it is also mentioned
>>>> in the submitted patch). This bug was fixed in CMake 3.20.
>>>>
>>>>> Perhaps backporting its fix is appropriate?
>>>>
>>>> If the proposed patch with v.3.22 does not introduce any regression, then I
>>>> personally do not see any reasons for backporting. 3.18 is two years old and
>>>> it might be beneficial to switch to a newer one.
>>> Backporting the cmake fix alone would not help hosts with cmake version
>>> 3.18 installed. With current BR2_CMAKE_VERSION_MIN set to 3.18 Buildroot
>>> will not build the fixed cmake host package, but rely instead on the
>>> buggy host installed cmake.
>>
>>   So we have 3 options:
>>
>> - Keep the current situation, which creates problems for some external packages.
>> - Update cmake but not BR2_CMAKE_VERSION_MIN, which is nice for keeping cmake
>>    up to date but doesn't solve anything for people who run into the bug and
>>   have CMake 3.18 or 3.19 installed.
>> - Update both cmake and BR2_CMAKE_VERSION_MIN, which basically means that
>>    everybody has to build host-cmake unless they have a really bleeding edge
>>   distro.
>>
>>   There is a fourth, much more complicated option, which is to allow individual
>>   packages to define the minimal cmake version. Then a package that actually
>> runs into the problem can force BR2_CMAKE_VERSION_MIN. Of course we'd also
>> need to change cmake.mk to use that config-dependendent cmake version. And
>> we're in a bit of a tricky situation with the patch version - we'd prefer to
>> set BR2_CMAKE_VERSION_MIN to e.g. 3.22, not 3.22.3, so people who have 3.22.1
>> installed on the host don't need to build host-cmake. And there's a problem
>> with cmake.hash that needs to contain the hashes of many different versions.
>>
>>   So overall, nothing good :-(
>>
>>   With all of the above, I'd say we bump to 3.22.3 (this patch) and set
>>   BR2_CMAKE_VERSION_MIN to 3.22. What do others think?
> 
> The bug that Andrey encountered is fixed in 3.20. So updating
> BR2_CMAKE_VERSION_MIN to 3.20 should be enough, I believe.
> 
> Is there a reason to keep BR2_CMAKE_VERSION_MIN and cmake package
> version in sync?

  I think the only reason not to keep them in sync is to increase the exposure 
of possible defective cmake versions in the autobuilders. If we set 
BR2_CMAKE_VERSION_MIN to 3.20 and CMAKE_VERSION to 3.22.3, then if there is some 
issue with either 3.20 or 3.21, it will not be caught by the autobuilders, 
unless one of them happens to have one of the defective versions installed.

  But I see now that this didn't use to be the case. Fabrice started to align 
them in Nov 2019, but before that the host-cmake version was indeed ahead of 
BR2_CMAKE_VERSION_MIN.

  So I guess this patch is actually good to go. Updating BR2_CMAKE_VERSION_MIN 
can be done in a separate patch (but isn't strictly required).


  Regards,
  Arnout


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
