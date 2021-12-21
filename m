Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E5BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 21:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20A7181773;
	Tue, 21 Dec 2021 21:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQHJ5o6b_t26; Tue, 21 Dec 2021 21:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911B28148B;
	Tue, 21 Dec 2021 21:47:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C99B1BF40B
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F1040469
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQ-buN9lYFJM for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 21:47:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F17C40124
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 21:47:20 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m21so1789066edc.0
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 13:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F4fSMOo+GzUger7+3NJ1vbNYjvAjNpdkSD2NAp/giJk=;
 b=hYNvLiJiO4J9J4QMtnXHJLWMOJi9MoTIER7pSXDADb1u8c55j5TROIz4nnSQ1/SbGb
 jt//cDRjJE0sV0sCN+IuDIqItvi511fMMJsAg1oCV9UYsHHWeG/VWZpiJOwekPXs8iIm
 9p0x1v7FByO73ZaywGi8QGj+Upe2yMhY0Pf3jDmvo557rEYlxrt6sFuWnBbKMwHTK5BY
 oKdQYtqU+8gZre3lF7DdeGDwTkTQaPagbDB3vtM67ZFvUQx0kNAk1uYyyP+GPYZv5PzT
 O+8dJjjZipzSJmupe+qP8LpX1Tk58RIdgh4vpbszehd6Jg4+UoSF4/Qv6yg49R6ShPpM
 +bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F4fSMOo+GzUger7+3NJ1vbNYjvAjNpdkSD2NAp/giJk=;
 b=zV6OWZORJ+UHuKB9yHUt0gzxE1Ns1R336yTfPvzRTGnReCWo2+zWw3xg73E2RNyq48
 3ulZGPw5tK9by2qKE+/sWE3DlQ4XkUsqP0/mJaPgiITQh8MpnO1MRnAD5CvcU6y93sqV
 O4vhmZF67o/AoHXu/PZ0TOI0Vr2lJeisMmzY8plkjoujakRTUMF1vZkagVloc2aKitqG
 tpXaJKlnsCGgtVDw38ckMNv3Ib1Qzvt9grNHWdmQynuUvnLZMmqfjDB7SsG8rI6t/elS
 d2ZnCswmRn4cukJVzP1G95olGQwSgYpkCv23jm1fdqc1O9GftqnydbHvmaS37scRoLn8
 KDZw==
X-Gm-Message-State: AOAM533VGgsqvx1JLNBwuUXw/P0BvFwY1awvD2i2YPl0z8cfzE+4GgGJ
 s1nCydIctyatLiYLxDVQdsMKFw==
X-Google-Smtp-Source: ABdhPJy3ZHLb1N0/AsJ4BGQpejf0iHbRr12UM7JsoGTrB1M6qM17T22mOcp8S8LSUkPk0rF6NjQGLg==
X-Received: by 2002:a17:906:5d0e:: with SMTP id
 g14mr204453ejt.620.1640123238604; 
 Tue, 21 Dec 2021 13:47:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hp35sm32008ejc.88.2021.12.21.13.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 13:47:18 -0800 (PST)
Message-ID: <6cca2e39-f15a-c453-0226-7d02f055e3ea@mind.be>
Date: Tue, 21 Dec 2021 22:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20211220084645.28659-1-james.hilliard1@gmail.com>
 <7f99f3a3-cc60-a874-afbf-8f89259f63ff@mind.be>
 <CADvTj4rb=3jCU6+bBOM7GEt2Cym5pSTJELWcAiwN-Uup+LxwQA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4rb=3jCU6+bBOM7GEt2Cym5pSTJELWcAiwN-Uup+LxwQA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/connman: add iwd support
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
Cc: Martin Bark <martin@barkynet.com>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/12/2021 20:07, James Hilliard wrote:
> On Mon, Dec 20, 2021 at 3:34 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 20/12/2021 09:46, James Hilliard wrote:
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>    package/connman/connman.mk | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
>>> index e5e596c973..d3ebb40a1c 100644
>>> --- a/package/connman/connman.mk
>>> +++ b/package/connman/connman.mk
>>> @@ -85,6 +85,13 @@ else
>>>    CONNMAN_CONF_OPTS += --disable-wispr
>>>    endif
>>>
>>> +ifeq ($(BR2_PACKAGE_IWD),y)
>>> +CONNMAN_CONF_OPTS += --enable-iwd
>>
>>    No need to add iwd to CONNMAN_DEPENDENCIES?
> 
>  From what I can tell iwd is only needed at runtime.

  It helps if you mention that in the commit message :-)

  Regards,
  Arnout

> 
>>
>>    Regards,
>>    Arnout
>>
>>> +else
>>> +CONNMAN_CONF_OPTS += --disable-iwd
>>> +endif
>>> +
>>> +
>>>    define CONNMAN_INSTALL_INIT_SYSV
>>>        $(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
>>>    endef
>>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
