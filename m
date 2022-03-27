Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FF0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 19:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B5760F33;
	Sun, 27 Mar 2022 19:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UCL4DREbu7rw; Sun, 27 Mar 2022 19:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08EDF60D59;
	Sun, 27 Mar 2022 19:32:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6E361BF386
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9481C40111
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQRyTK8w7Xju for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 19:32:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EF41408F5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 19:32:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a8so24578891ejc.8
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 12:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+yxNlGYDOBGZ2GKLqi+TRwmI8lwmrVRPKaRkYU42GTw=;
 b=V8piKGHclbBR6Re5HiDLdiTB2/qgA8+lrnyJSdlkGke7gi+g/YoFWpkI2JROMHrLLH
 shGYYfmG9AHbFObQNwvOSGUXqZsZZ++4OUZgdALiVA3Ka5xlE6XJ5KF1V599wmwCB/p/
 AhhwRd0vXeY3Z+8BKs7l9LooJUKgyjhKHB2VUBV1ZG1a8LIns4/Gj1jRYoCHqQ4jbjcA
 C6FBz9E3rO1BQcD6oyv12vsETqqajM1H6D2v5Bh+72/BSLppYVPzjruWO3mtQ2rou71V
 6fIgtRveHfwrKKPXtU7JxG91/GFzfwpfMD0NrUbF7Ru6Sr8KjE+SE+yofiUYEj6DEr7l
 eMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+yxNlGYDOBGZ2GKLqi+TRwmI8lwmrVRPKaRkYU42GTw=;
 b=zlEGHXtnq6xC1v37KYrZbcAkJKrSZoNVJk+t4Uf7DUIUi79C+WlvRXg7t+EWRJ6AIT
 iiytaFwh7wEd8ez1kK0hUywn0JmOH7lD/qNiJZFczcrymyxCVdc3EH9yTVtIDQs4wU6L
 vj7Q517wos8aHANHDvLiE2idnzcpy0neiWhU08B+vBKHO4Fp6XIKUg1PDeMvVSAuLxa8
 oAj84vXzdvOsV9j6qkXARBmpf/x0sY7qnrZe2RdIVuHbrkUAthsmIVp7GoKWwlA64Suf
 sMKMOEoXMWPYvc7MI7n2fzja21v3fA/EOLZDf9e/z0Ye7+RPAnHD6+XGmBdM9GEk72Jg
 fTUw==
X-Gm-Message-State: AOAM532DVX7C6qKSHk2vd8lGl+4wNzSGWo3b1Z9QlXj29Es4P+/NOKvt
 UggqTNYAwse7MH/fe2KuC0sUZA==
X-Google-Smtp-Source: ABdhPJzhGE6QJWEAQ3JS2aGL8XAQsw1AidRabye9y41kEqecB/5+MQnzSPEvG3gd3r6TT8MBryzu9g==
X-Received: by 2002:a17:907:c082:b0:6df:bc66:93f0 with SMTP id
 st2-20020a170907c08200b006dfbc6693f0mr22897246ejc.190.1648409525585; 
 Sun, 27 Mar 2022 12:32:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a170906771600b006cf8a37ebf5sm4941288ejm.103.2022.03.27.12.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 12:32:05 -0700 (PDT)
Message-ID: <8a31bb3a-8530-ad05-08df-4589a01cb7ae@mind.be>
Date: Sun, 27 Mar 2022 21:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220325212405.25243-1-james.hilliard1@gmail.com>
 <5e27550c-7c02-3f0d-54b4-4cc515efe970@mind.be>
 <CADvTj4rY9k2P5wag9Y72g6CvEU_HtCZ7fJYc36a2ARJ6j0e_0Q@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4rY9k2P5wag9Y72g6CvEU_HtCZ7fJYc36a2ARJ6j0e_0Q@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.4
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 19:37, James Hilliard wrote:
> On Sun, Mar 27, 2022 at 10:23 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 25/03/2022 22:24, James Hilliard wrote:
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>
>>    Applied to master, thanks.
>>
>>    Although honestly, there's not much point updating a host-only package unless
>> it actually fixes an issue.
> 
> There are usually minor fixes in each release with meson.
> 
> Mostly I like to keep this updated since doing so helps catch upstream
> regressions.

  But the updates are coming somewhat ridiculously fast... We're almost tracking 
master :-)

  Regards,
  Arnout

> 
>>
>>    Regards,
>>    Arnout
>>
>>> ---
>>>    package/meson/meson.hash | 4 ++--
>>>    package/meson/meson.mk   | 2 +-
>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
>>> index d909709b24..8389adb243 100644
>>> --- a/package/meson/meson.hash
>>> +++ b/package/meson/meson.hash
>>> @@ -1,4 +1,4 @@
>>>    # Locally calculated after checking pgp signature
>>> -# https://github.com/mesonbuild/meson/releases/download/0.61.3/meson-0.61.3.tar.gz.asc
>>> -sha256  9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b  meson-0.61.3.tar.gz
>>> +# https://github.com/mesonbuild/meson/releases/download/0.61.4/meson-0.61.4.tar.gz.asc
>>> +sha256  4e3733ddc66bac38e38c63b739c9b8b8fc5a866de5333396b0c85c2b144ddee9  meson-0.61.4.tar.gz
>>>    sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
>>> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
>>> index 4615e839fe..e9c3145183 100644
>>> --- a/package/meson/meson.mk
>>> +++ b/package/meson/meson.mk
>>> @@ -4,7 +4,7 @@
>>>    #
>>>    ################################################################################
>>>
>>> -MESON_VERSION = 0.61.3
>>> +MESON_VERSION = 0.61.4
>>>    MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>>>    MESON_LICENSE = Apache-2.0
>>>    MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
