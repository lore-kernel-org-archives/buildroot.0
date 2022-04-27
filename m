Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7857660F05;
	Wed, 27 Apr 2022 07:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2DHbS6kI1EH; Wed, 27 Apr 2022 07:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF2C60EDE;
	Wed, 27 Apr 2022 07:19:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC7D1BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AF2F41920
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flS-n6WrcplT for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:19:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA32A41730
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:19:11 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id j6so1533620ejc.13
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BFakUbRW510RAMDc9+GFaw6Xd9RfkrecrvVI3il8xzk=;
 b=Q8suSNBGbs9nLu3rHoOQhvktlfDyk6Cxsm5d78f1olJCuQ6pbqwq2YMj4rqQL3Y4+k
 61kvUmSlOoqh57bjswjIJF3jtOIUPgu0AwbkdmL5sWKcwaPkkrY35iOBFgJN5NHzX/LK
 32W64vGFhj0gi/sYrV93XEqmpiv3uywxUNmYGV+m48vl7DRgk0R+gstgGqBTlLwOESeu
 pwyrtvpA1IkSXazYx7VxLzDjkKPHbbBTVWavSWz9YDU52k6jmX95OjDIgdDD/OsEC56L
 W5DayMM2+cj+2wCkhQ7dVB1e+YS7U4VyBk+pZD5+5CtKJBW41X8GFXzRCm6vQXd8mmFt
 O3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BFakUbRW510RAMDc9+GFaw6Xd9RfkrecrvVI3il8xzk=;
 b=haW8d3h2+YPMa9tvX7avxJn0llRGrQC5mm1ZzfyJlvllfOOHlPRVYfUJ31iQRW7qQ6
 YZ78LAIQb8mNK8GAC8WBIz5APTFEb8bp5J6LxshSvA+OKaPeg3eI1TZ+TjRyLLgFnZrJ
 mkF9lhx7qrUS2oQAia665mw2+CgCgN8GKKnCEjhVRFP39u59aCF5ulOSx3qIjC4yT5qp
 IS0EjMrFsxiEPbMb7SZnHPjmafRI2wOmUQweEpX7IQrSeC5Atc/92rouX6naFBj0hMdS
 741KZdD+4k9SRzpYW337EIpDA8hwRm0zHJ4Zqqb7lBKzn42nlq/qJKPU0c601GtRS+cr
 +9Dg==
X-Gm-Message-State: AOAM533uxB957XW5598XEeoQH+85M+UBrTN0OaTotYaoluR84x7c0g8F
 vREhBnqtQ9ZakT4+JV3HeBgi3g==
X-Google-Smtp-Source: ABdhPJwpKEN6Vzawj4LOnfYLK6ZEgbXgBOxUVmL5rA+f3h8VMuwmKvm45yO8OHhoBnp0omtWJo3QcA==
X-Received: by 2002:a17:907:2d1e:b0:6f3:6717:5f38 with SMTP id
 gs30-20020a1709072d1e00b006f367175f38mr21590845ejc.732.1651043950078; 
 Wed, 27 Apr 2022 00:19:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 22-20020a508e16000000b00425c9d1704bsm6727509edw.4.2022.04.27.00.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 00:19:09 -0700 (PDT)
Message-ID: <3cb2c8da-dcb7-3898-c73f-b6e919cf857c@mind.be>
Date: Wed, 27 Apr 2022 09:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220406172934.4009018-1-fontaine.fabrice@gmail.com>
 <9406710d-ed6f-d0cd-4a7a-60480a4d4872@mind.be>
 <87bkwnk1tp.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87bkwnk1tp.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: drop versioned layout
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 22:49, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>   > On 06/04/2022 19:29, Fabrice Fontaine wrote:
>   >> boost.m4 embedded by cc-tool is not able to find boost libraries when
>   >> they are versionned (e.g. libboost_program_options-gcc9-mt-sd-1_78.a):
>   >> configure: error: cannot find the flags to link with Boost
>   >> program_options
>   >> azmq and i2pd also have the same issue:
>   >> CMake Error at
>   >> /nvmedata/autobuild/instance-8/output-1/host/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:165
>   >> (message):
>   >> Could NOT find Boost (missing: Boost_INCLUDE_DIR system date_time thread
>   >> chrono random) (Required is at least version "1.48")
>   >> So drop versioned layout option
> 
>   >  This is probably going to cause problems for some custom packages
>   >  that have a simple build system that assumes the versioned layout. Oh
>   > well, bad luck.
> 
> So what do we do for 2022.02.x? We presumably have the same issue
> there. Drop it as well?

  I wouldn't do that. People already using the option now apparently don't have 
a problem with it, so we're not fixing anything for them. People who don't use 
the option will not run into the problem either.

  So the only problem is for people who are starting a new project based on the 
LTS branch. For them, perhaps we can just update the prompt with " (broken, do 
not use!)" ?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
