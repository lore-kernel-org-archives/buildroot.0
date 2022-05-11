Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39991C433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 17:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF73241797;
	Wed, 11 May 2022 17:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfOkETRIN-0c; Wed, 11 May 2022 17:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7020041927;
	Wed, 11 May 2022 17:24:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2271D1BF402
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DC9440291
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTpjFg5aU2lR for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 17:24:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F307E40135
 for <buildroot@buildroot.org>; Wed, 11 May 2022 17:24:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id kq17so5460502ejb.4
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uaM5DO7uKUM3X5gYR2SClVMQw4gqPiluNdJl1OUMCOA=;
 b=RVib33GZ4GnZFucmWCIn8H8W3z39t8WT+BkY97JPPnCRDGZRHXXWJjovs21RUnN8I5
 +bWjbuPEiRMa96ONsIu5HmLl79rwls384gP/7uPCb6e7c/BQ4zqQvM6xu2llKd+XgxTN
 F9LDM7Tb9U3vxBqm/Wy7X3DqgZUBtFM5ISQCbgq5PigMX+uNmtvs2XW1A077hmW3wWoJ
 nnaax8AjCivIGjHLW3OEckEHfq1weFYudNUfdfwlAHcPeDbzDS1qu/2zQaHKKqFuY7wd
 XrM+mRYbNZN5IHVoO5FQ2uoSJoVFlGLoSr2B4RuelSuQeqLE8omWZMkUh1QoVgv20Gz+
 njcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uaM5DO7uKUM3X5gYR2SClVMQw4gqPiluNdJl1OUMCOA=;
 b=RvYHhN2oh+KUqYBoCkZn5POOr0VnyuPJzjKKJGk3nl4qBXl/20rBbjqEBTXq9cF/F4
 j13v3qDspHlPswWgfm9f79Ed85uuTEYevJJrLPS2kIiipJ4YZPsgfXsKTaiHwMySW6VK
 9gL8yGn64KqBFfGQ79DR5AaAM85vVZXhc8ZKivRjw8FYxnloQqkdtduvgRpDOIRfw1JJ
 tgD33lqR8WWWyWsV77B2zWm2QFJAyuVB603+tKyfkCTsAeIyTITJzTAPASsrwl9mtj8d
 IBkxVbEkP80eVTFCwcCTEJHUkks1KEmKQncQdcQkYRsrfGB7MR2tmFb0sWVX7Iz7+wVp
 WY+Q==
X-Gm-Message-State: AOAM533IG00hW9DKAOhHOqSzXqQr/mN/ltFd2rOECrqmlkoftVIA8qnw
 3lXxeSEViNqj/bN2O6IMNVImOg==
X-Google-Smtp-Source: ABdhPJy3pPHKGooWvkBRFtexkarhJ/F+iDgBDd2AvneuwKST6XV3pIPzRjeedBASMW5lbi9X+vSmfQ==
X-Received: by 2002:a17:907:1c20:b0:6f4:639e:9400 with SMTP id
 nc32-20020a1709071c2000b006f4639e9400mr25291474ejc.485.1652289878937; 
 Wed, 11 May 2022 10:24:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a170906941400b006f3ef214dd1sm1219117ejx.55.2022.05.11.10.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:24:38 -0700 (PDT)
Message-ID: <82370296-a5c0-fa25-1993-1c4a885af02c@mind.be>
Date: Wed, 11 May 2022 19:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>,
 Andrey Nechypurenko <andreynech@gmail.com>
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
 <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
 <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
 <878rr88joi.fsf@tarshish>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <878rr88joi.fsf@tarshish>
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
Cc: Alsey Miller <alseycmiller@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/05/2022 12:06, Baruch Siach wrote:
> Hi Andrey,
> 
> On Wed, May 11 2022, Andrey Nechypurenko wrote:
>>> On 10/05/2022 17:20, Andrey Nechypurenko wrote:
>>>>>> I am just curious if the following patch will be accepted for the
>>>>>> upcoming release?
>>>>>
>>>>> What about bumping it to 3.23.1?
>>>>
>>>> At the time I submitted the patch (29.03), v.3.22 was the latest one. It
>>>> also fixes the bug I was facing. So it is good enough for me and definitely
>>>> better than v.3.18 currently used by Buildroot. If you would like to submit
>>>> another one for v. 3.23.1 it would be great.
>>>
>>>    Up to now, we've always kept the cmake version in sync with the value of
>>> BR2_CMAKE_VERSION_MIN (defined in support/dependencies/check-host-cmake.mk and
>>> updated every time there is a package that requires a specific newer version -
>>> like swift would, as mentioned by Alsey.
>>
>> In addition to the Swift package mentioned by Alsey, there could be custom
>> packages added by Buildroot users with external trees. This is what I am
>> currently doing.
>>
>>>    What is the bug you were facing?
>>
>> Our custom package uses a feature which was buggy:
>> https://gitlab.kitware.com/cmake/cmake/-/issues/18299 (it is also mentioned
>> in the submitted patch). This bug was fixed in CMake 3.20.
>>
>>> Perhaps backporting its fix is appropriate?
>>
>> If the proposed patch with v.3.22 does not introduce any regression, then I
>> personally do not see any reasons for backporting. 3.18 is two years old and
>> it might be beneficial to switch to a newer one.
> 
> Backporting the cmake fix alone would not help hosts with cmake version
> 3.18 installed. With current BR2_CMAKE_VERSION_MIN set to 3.18 Buildroot
> will not build the fixed cmake host package, but rely instead on the
> buggy host installed cmake.

  So we have 3 options:

- Keep the current situation, which creates problems for some external packages.
- Update cmake but not BR2_CMAKE_VERSION_MIN, which is nice for keeping cmake up 
to date but doesn't solve anything for people who run into the bug and have 
CMake 3.18 or 3.19 installed.
- Update both cmake and BR2_CMAKE_VERSION_MIN, which basically means that 
everybody has to build host-cmake unless they have a really bleeding edge distro.

  There is a fourth, much more complicated option, which is to allow individual 
packages to define the minimal cmake version. Then a package that actually runs 
into the problem can force BR2_CMAKE_VERSION_MIN. Of course we'd also need to 
change cmake.mk to use that config-dependendent cmake version. And we're in a 
bit of a tricky situation with the patch version - we'd prefer to set 
BR2_CMAKE_VERSION_MIN to e.g. 3.22, not 3.22.3, so people who have 3.22.1 
installed on the host don't need to build host-cmake. And there's a problem with 
cmake.hash that needs to contain the hashes of many different versions.

  So overall, nothing good :-(

  With all of the above, I'd say we bump to 3.22.3 (this patch) and set 
BR2_CMAKE_VERSION_MIN to 3.22. What do others think?


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
