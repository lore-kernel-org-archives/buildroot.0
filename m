Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F672C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 451E640B48;
	Tue,  3 May 2022 20:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVf_sIccstom; Tue,  3 May 2022 20:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6225540B37;
	Tue,  3 May 2022 20:29:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BB071BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3742140B37
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHrSptyGdkS1 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:29:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86F7040528
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:29:56 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m20so35517876ejj.10
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3mvvYy7/+v+aXOIoeeYjCTD09i370+DRSokKRKmV4CQ=;
 b=WoI5dF/tgGwaP/OCHnZ9KmIGs/ZaBcZcQBqql9M+6Itf6zyrApmNaDrIIzKROJCtce
 zUr88bu65t4kr5bRYeFgmirnzJPahzc9mhhcDYFVhx1YHReuNvex0axEwcP5sDwXV0wV
 kgb0hNwSPzg50rjkKwzC3wbp24gXjHEB6Wl3aSTwLFPbJfy5fal31grkJUxwqb/FbFr7
 9rDaK0hBcq0kzcn3Xdnp1MChmgbtOe9gsLV0po2rR3zQpQF4ZzYcd8YLegSivo5HJP+O
 gGOTCaeFH7Rmwdvp5r9hjs2EAP8lkYVnZ1qPr49GEKto0lIyB8H8n++OnC7jrgYLHGAZ
 xSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3mvvYy7/+v+aXOIoeeYjCTD09i370+DRSokKRKmV4CQ=;
 b=Q5k6dNyBJRtT1x+JMAF2HDwUSBuNM90T79QmJ2E0RuXy+1pIVKd8A2sD31PqYeiqka
 YYCHjWhqpTW+LPpWgWIY0BUw/dMnYhvpaQN3JSkXapd8wkFJ2XKTqAfC9Cinud+VGE0z
 7ru/yCAdjeHQ4MbaJGaeh7ZpgraevGxAlxsCL0JsLFPz7e75PcRkPPB9uhduy+VVFJ0q
 WZn8Yve9L/LE938qpbZQv5TkOCevhtxLfYP/qOvkeBezPA1lOFRIzdhJcErlYaozaAWm
 b9HrcDFst9n34ZyVALvNj3lDoMTWt32e4DLt3Xg2BAF9VdQGvrCVO4ALiJOxFTLiptMf
 nKYg==
X-Gm-Message-State: AOAM531PQuLdltC5xmhtu0uG7RVmJrYA+Q/B6Qou9l9Xuv+pOu0WUzk4
 kZKfJCQ7VbUdXFFUBnyLy6SN2Q==
X-Google-Smtp-Source: ABdhPJyzPrvW0fe7+OHfZeEFlSJwF73uF2FSCOmybt4AlYlREFjh3g6n3MKFxKuvz9dc7osH1fcqhA==
X-Received: by 2002:a17:907:3e07:b0:6f0:270c:1121 with SMTP id
 hp7-20020a1709073e0700b006f0270c1121mr13632124ejc.137.1651609794705; 
 Tue, 03 May 2022 13:29:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jz28-20020a17090775fc00b006f3ef214e40sm4922494ejc.166.2022.05.03.13.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:29:54 -0700 (PDT)
Message-ID: <de87d7cd-45d4-1dd5-578a-c61c59ae7c09@mind.be>
Date: Tue, 3 May 2022 22:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220503023117.266256-1-james.hilliard1@gmail.com>
 <82d1991b-48c4-c767-dfe3-b28264eca4d0@mind.be>
 <CADvTj4qXE3v_OrFT7m-M0qWnV7L7Tfa5eeM=7idg-Fpi8S_Afw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4qXE3v_OrFT7m-M0qWnV7L7Tfa5eeM=7idg-Fpi8S_Afw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add DTS cuimage
 fixup
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2022 13:16, James Hilliard wrote:
> On Tue, May 3, 2022 at 12:41 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 03/05/2022 04:31, James Hilliard wrote:
>>> If we don't have a DTS name or path we need to also disable cuimage
>>> to disable DTS support as BR2_LINUX_KERNEL_CUIMAGE requires DTS
>>> support.
>>>
>>> Fixes:
>>> linux/linux.mk:591: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings.  Stop.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>    utils/genrandconfig | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/utils/genrandconfig b/utils/genrandconfig
>>> index 70af84f002..b821e60114 100755
>>> --- a/utils/genrandconfig
>>> +++ b/utils/genrandconfig
>>> @@ -381,6 +381,9 @@ def fixup_config(sysinfo, configfile):
>>>            if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
>>>                configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
>>>                configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
>>> +        if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines:
>>
>>    Similar to the previous patch (only fixup host uboot tools ...), should this
>> be done only if no DTS is given? I.e.:
>>
>> if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines and \
>>       ('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines or \
>>        'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines):
> 
> Should be ok already due to parent match conditions covering the invalid case.

  No, what I mean is: it is only needed to remove the line if DTS is not set. If 
either DTS_NAME or DTS_PATH is set, there's no need to remove the CUIMAGE config.

  This is similar to the patch you submitted for 
BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE and _SCRIPT: they only need to be removed 
if the corresponding _SOURCE config is not set.

  Regards,
  Arnout

> 
>>
>>
>>    Regards,
>>    Arnout
>>
>>> +            configlines.remove('BR2_LINUX_KERNEL_CUIMAGE=y\n')
>>> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
>>>            if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
>>>                configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
>>>                configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
