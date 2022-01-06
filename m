Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99295C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2221A400E5;
	Thu,  6 Jan 2022 20:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzuMAn-YAuKo; Thu,  6 Jan 2022 20:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 385CB404BD;
	Thu,  6 Jan 2022 20:34:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B91A1BF3A4
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 20:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0900460C2F
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 20:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjBYmva0cJjP for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 20:34:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0454D60B3F
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 20:34:55 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso3833586wmj.2
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 12:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FXYPOY+B0oeKdW6/t5s1+sM39/GVwtn+6eJqz8Mn5pk=;
 b=B2acXNFd7DMmwEgD7HLE6Rgn53ADSTV1g3QiX+H/QyiG4YXnHY33CWkBQuAOwsa4CD
 HlDjL/5vg4duJGI+z/pIclB4hy1ptbdd5gBRiV9xzIChV1QUri8Lioxqf0ffn3MbW4Aw
 uQZ4j+4XpEyYhdw9Bc0Q4+KS103bJ0jzfAmxBd8knaZRmggxaxLftFOUiw2dZHtjUk1u
 m34qbvWMywGUQQLevxtNGQeqCCjaJYAUipzQSXgyI2Bx5eKPsBMNlDMvyqrEzcw2J7Iv
 KWIPfqgp6tAyo1LXoVF1eO8W2tJ8p96IRlXjp6+h12sCGgRveoiWMTvnYTPcijzLdEOk
 JE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FXYPOY+B0oeKdW6/t5s1+sM39/GVwtn+6eJqz8Mn5pk=;
 b=VwAcJpHAkCnE3Xpi/spivI2spj3Nay9EXqCyvbHe4WVSK7LBJZ0jiW/YyVgConHrHT
 THCnEvdbmaF0KHPwnvkNbldvwlZqIPOl1Fi59mrZmy56g1B+X4IZwDmbInx3HCtWlo6c
 J1iuCokWLT0+qVfVX7nXInNw3Hb/Am7nhOzsX2zmnPRoLwOzMMpE8zrG0S+isftWNr3l
 UTxE5DpQF5ESmihQZ8impFVxHQP75HF91F2KUOAM0q85ur6cp7U/c8YHRVLe2dEKI0Bh
 MEljnVaBjr51/T+ZzPFWN5facNvkDsgCER6y28snQqs60kk/pjG1S6eKJ1B0+SUHN3YF
 bIXg==
X-Gm-Message-State: AOAM530lH8GHAu8DGxnwr4rFKqEdV4Ok5UVi9lf+dlBWCtp8zEM+tsIq
 dwn1c/YHNRWWvU0al0faole2sA==
X-Google-Smtp-Source: ABdhPJz1Vr1jBsSVxqYD45IZ9O8FNRDDbvlEQLTy/XC7Uf2G/UtMxwrBvtGRZ6BQZ7eYdUULR4ji4Q==
X-Received: by 2002:a05:600c:1d12:: with SMTP id
 l18mr8376607wms.192.1641501294035; 
 Thu, 06 Jan 2022 12:34:54 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l4sm3397669wry.85.2022.01.06.12.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 12:34:53 -0800 (PST)
Message-ID: <1b8ece72-bfa0-e320-df9c-4991a143d90e@mind.be>
Date: Thu, 6 Jan 2022 21:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
 <20220106062407.3131530-3-james.hilliard1@gmail.com>
 <a491140e-465d-b739-8d6f-1bf0b23ef046@mind.be>
 <CADvTj4q77LimfgnAwHfoyzH=W09FoQ9_o33vbfhGhbjrD28cDw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4q77LimfgnAwHfoyzH=W09FoQ9_o33vbfhGhbjrD28cDw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 3/4] package/qt5/qt5webengine: bump to
 version 5.15.8
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/01/2022 20:23, James Hilliard wrote:
> On Thu, Jan 6, 2022 at 1:13 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 06/01/2022 07:24, James Hilliard wrote:
>>> We need to switch to the kde upstream as the existing upstream no
>>> longer updates the qt5 branch for most packages.
>>>
>>> We need to add a separate package for the chromium submodule so that
>>> we can apply patches for python3 support to it and replace catapult
>>> with a python3 compatible version.
>>
>>    Creating a separate package that does nothing more than download something
>> that is later copied into another package's subdirectory is not the right
>> approach. For this, we have FOO_EXTRA_DOWNLOADS, which can be followed by a
>> _POST_EXTRACT_HOOK to graft it in.
>>
>>    So what I think you should do is download both chromium and catapult with
>> QT5WEBENGINE_EXTRA_DOWNLOADS, then remove the directories in POST_EXTRACT_HOOK
>> and untar the download over it.
>>
>>    That would vastly simplify this patch as well...
> 
> One reason for doing this approach is that the available patches for
> adding python3
> support to the qt5chromium-webengine tree apply to that dependency rather than
> the parent qt5chromium.

  My eyesight is getting worse because I can't see those patches :-) The only 
thing I see in this series is that you download and extract catapult, then 
download and extract chromium, then remove catapult from it and overwrite it 
with the catapult sources, then download and extract qt5webengine, and finally 
remove chromium and overwrite it with the chromium sources (including catapult). 
All of that can be done (and easier) with _EXTRA_DOWNLOADS and _POST_EXTRACT_HOOKS.

  And if there is some upstream patch to catapult that you need to apply, it's 
really easy to edit the patch manually. Just search/replace \b\([ab]\)/ with 
\1/<path>/


  Regards,
  Arnout


> 
>>
>>    Regards,
>>    Arnout
>>
>>>
>>> There are python3 patches available that apply to this version with
>>> minor modifications(to be added in a future patch).
>>>
>>> We need to set QT5WEBENGINE_SYNC_QT_HEADERS = YES as we are building
>>> from a repository archive instead of a release archive.
>>>
>>> We need to add some new required dependencies to qt5webengine so that
>>> it will build.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>    package/qt5/qt5.mk                            |    5 +-
>>>    .../qt5webengine-chromium/chromium-latest.inc | 1257 +++++++++++++++++
>>>    .../qt5webengine-chromium.hash                | 1256 ++++++++++++++++
>>>    .../qt5webengine-chromium.mk                  |   22 +
>>>    package/qt5/qt5webengine/Config.in            |    2 +
>>>    package/qt5/qt5webengine/chromium-latest.inc  | 1000 -------------
>>>    package/qt5/qt5webengine/qt5webengine.hash    | 1001 +------------
>>>    package/qt5/qt5webengine/qt5webengine.mk      |   30 +-
>>>    8 files changed, 2561 insertions(+), 2012 deletions(-)
>>>    create mode 100644 package/qt5/qt5webengine-chromium/chromium-latest.inc
>>>    create mode 100644 package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
>>>    create mode 100644 package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
>>>    delete mode 100644 package/qt5/qt5webengine/chromium-latest.inc
>>
>> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
