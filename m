Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06ABC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 15:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D3F440912;
	Mon,  4 Apr 2022 15:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHWZ-j3rChoH; Mon,  4 Apr 2022 15:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2241F4019E;
	Mon,  4 Apr 2022 15:12:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8067C1BF3D0
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 15:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7808A828A5
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 15:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3AFAZiU4koY for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 15:12:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7706581C04
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 15:12:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n6so6578011ejc.13
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/9Kp8sKnIhDWPNPFdmvM7FWQqDVtcOM5DG+OkEzBOKg=;
 b=eg/I02UlL07glKS3HdFXCwo6ukMfpoRjQBya47C+BsIf+uxjxoylOzLVljQ5j8RHvS
 zxsEfsO5nlRaaLH0HYwJHmaE3LXZPgrEfkr/YXD8bvtFoOxy6GlRKvCh6Uzehju3eou3
 FqGx2MY6Ty/rrikG64ecWWFDkVSaCTDStGipXdZnd5hKGcG5hzE1LcEpXDtCKjsLkeUI
 O9F2mODoCyqBdnQK5VFbVVndyMtznU+WRW2b9gYAYinIfL4VZfglje+/moTzvaZmpe0c
 XLwkHFAzBGcy7NRM5ty8ncidUkT7l6J6WUSpnyfbElh/pRbX5UbCLJ5WMphLsUd2nhj+
 s3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/9Kp8sKnIhDWPNPFdmvM7FWQqDVtcOM5DG+OkEzBOKg=;
 b=2ezYeausEX+8UoNOnyXEBUb5684mLR6i8xNF2vYghV3lYv4k2iqkkp1YrDTsO42Qc/
 aopXWp/so7lwSzBt6o/MhmyDJRzsv3PX+Zs/R3rByEGEHwIxRCkcAbX7E41wxXVn4xOZ
 m6hcwhBXKEDAKMmDODmbjiQqm86mE9F/czSvMlMO8u2/zqRvWhIO+I1pN0dL9sOe1zIf
 0iSuDnImYa7z/3O3zEvtaI/WRusfIwlEVSLey39Q+IiEjA7Yoi3LCtOcFthX1wZblLV8
 82sJ3VUBgpwqudMd6MPSuxbhjCJ4HCrGVc1g0bUNzXD9gmCLKBQ4i0RQsmuFwp7tjO7f
 EIRw==
X-Gm-Message-State: AOAM532aRYK7xTlOMrOcnoaJOlCTKkEQt2Xb0R0m3+0qDjMsVWaaL6UT
 ItCKVEasb7kJ+3Rn+qcFqxoobw==
X-Google-Smtp-Source: ABdhPJy45KmCuEUl+1HIcO+UrIe8Diw5jfOByN4xBtJjsS2+l9/J+qYY7SaQQihY0SUjxTqrrnjJJg==
X-Received: by 2002:a17:906:7952:b0:6da:94c9:cccb with SMTP id
 l18-20020a170906795200b006da94c9cccbmr511074ejo.469.1649085150544; 
 Mon, 04 Apr 2022 08:12:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056402190600b00413d03ac4a2sm5591449edz.69.2022.04.04.08.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:12:29 -0700 (PDT)
Message-ID: <13ee969c-e0cd-7029-5853-cc3cbd5baa06@mind.be>
Date: Mon, 4 Apr 2022 17:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: David Laight <David.Laight@ACULAB.COM>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220403185306.928833-1-fontaine.fabrice@gmail.com>
 <20220403201530.GB2354230@scaer>
 <01a5ba2d-a511-5322-5406-d1bc9bc95347@mind.be>
 <5771e60200854118a380e4b47b540f68@AcuMS.aculab.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <5771e60200854118a380e4b47b540f68@AcuMS.aculab.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: fix build with
 libressl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 10:41, David Laight wrote:
> From: Arnout Vandecappelle
>> Sent: 04 April 2022 08:35
>>
>> On 03/04/2022 22:15, Yann E. MORIN wrote:
>>> Fabrice, All,
>>>
>>> On 2022-04-03 20:53 +0200, Fabrice Fontaine spake thusly:
>>>> Fix the following build failure with libressl raised since bump to
>>>> version 6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31 and
>>>> https://gitlab.com/fetchmail/fetchmail/-/commit/340d00bf9910ed55163be26435f70baf65a64f9d:
>>>>
>>>> configure: error: fetchmail cannot legally be linked against LibreSSL for lack of GPL2 clause 2b
>> exception. See COPYING.
>>>
>>> This sentence is incorrect. It is legally not possible to *distribute*
>>> fetchmail when linked against LibreSSL, as the GPL conditions in that
>>> case only trigger at the moment of distribution.
>>>
>>> So, there should be no issue with linking fetchmail to LibreSSL for
>>> private use without redistribution.
>>
>>    It would be nice though if this could be mentioned in legal-info.
> 
> ISTM that the default needs to be to disable the build.
> Requiring 'hoops be gone through' for a private build.

  The "hoop" is to use openssl rather than libressl. Doesn't sound too complicated.

  Regards,
  Arnout

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
