Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEDDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 16:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B748D400AF;
	Sun, 13 Feb 2022 16:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNfAWJ8yXkD5; Sun, 13 Feb 2022 16:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF1040116;
	Sun, 13 Feb 2022 16:39:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 119BF1BF421
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F410A60B50
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_ycVsruDANN for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 16:39:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C324E60AC0
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 16:39:47 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id fy20so32691863ejc.0
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dm09qefu0kLg8fETd209VZJXkq9AsPkgkr64Xyz/+LI=;
 b=g+4pxL7ueANWEbn+wQLAJQwR/hkQHlKujVldHt8Pqi45zimUbB+gQ5QCM2ecoNUDeW
 pdtpNM0PDu8H/CZbihoWyk135h3jUibFecMBnD4jR/eXZV7/NVbCttHpvsjMo4VRWe7u
 KANy5rG+hF/Eww1v6hbdKHZI8Rmo81XC7NSNMrMoRIS5tSuBDUdj4EfsmyLdhkhDes6R
 2VQm22jRMC3g8NAuAX9U9oZW9yB/b2ZX++1iKNtrIQKCRGdhfA32KIjBtdfA2WNPgHxg
 4xdzv0fGFPeNBPJT6AsOZ1qhdk9iJLLsRqg0cUxVfvr+IN58cX3P3Rkcqzm369UeSVyL
 MhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dm09qefu0kLg8fETd209VZJXkq9AsPkgkr64Xyz/+LI=;
 b=tqU+kHMH+n5HUdSjLyLuBJfnb2inkmebHczeG3Glqq/mcMO4o0WIQcTpLxdFPruWZ9
 iNhrzId5qnMfeTpMNbbN2fXqtqVZaOQLCIoC6fznpdgKNGdVjbRW3FviOnhVB2mR+nGa
 g4J+U7aIDR37XpzRBtGEjK08GIfAUtuntswGSSbIy0b+wODzOgUyxs3yR5Y266bR3k7E
 +9OcHT5jgvxD2IK20Cjn5eTXzT5B+abza7CBLrN2BCHus28yxt2+etY/LGgoedvx/BrY
 jL4xpp6pSzP16Ubm7nGujluGc2ejcSAV4neVqzIoFzQJvf/Uwes9vNlyOMtDsUXoXTPq
 MYFg==
X-Gm-Message-State: AOAM531QvCX0Uw3fyic12S04LypiwVgJSL5H3C5Tpai5y0f0tceh1HU/
 vmRrrfQBEa9Ive9eCAtBumTHXw==
X-Google-Smtp-Source: ABdhPJy3xX/GfyC1Msz/knhVcTDb/JOHWc3gdbSjKaFx2oLcrQR/3dKge4YGJofMAn9Qncay9WWdDg==
X-Received: by 2002:a17:906:7a43:: with SMTP id
 i3mr1463497ejo.371.1644770385886; 
 Sun, 13 Feb 2022 08:39:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 9sm1391559ejj.51.2022.02.13.08.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 08:39:45 -0800 (PST)
Message-ID: <fdd1b3e0-801e-ec71-67c6-6d9a8ba43a85@mind.be>
Date: Sun, 13 Feb 2022 17:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-4-james.hilliard1@gmail.com>
 <20220213150621.GD4462@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213150621.GD4462@scaer>
Subject: Re: [Buildroot] [PATCH v6 4/8] package/qt5/qt5base: enable ccache
 via configure option
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 16:06, Yann E. MORIN wrote:
> James, All,
> 
> +Arnout
> 
> On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
>> This should be cleaner than editing mkspecs/common/g++-base.conf.
> 
> Is this actually fixing something? Is ccache as we sue it badly handled
> by the qt5webengin buildsystem somehow?
> 
> Thomas, Arnout: IIRC some time ago, there were talks about using the
> compiler wrapper also for the host compiler. Maybe this would solve this
> kind of situations?

  Yes it would. However, it would be pretty much the only thing handled by that 
wrapper, so I don't know if it's worth the bother. If we want to do that, it 
would probably be better to use the symlink approach for ccache, i.e. create a 
gcc->ccache symlink in HOST_DIR/bin and set HOSTCC to $(HOST_DIR)/bin/gcc.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> ---
>>   package/qt5/qt5base/qt5base.mk | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index d8a0bf1d16..4b7a2a937d 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -289,10 +289,9 @@ endef
>>   endif
>>   
>>   # This allows to use ccache when available
>> -define QT5BASE_CONFIGURE_HOSTCC
>> -	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
>> -	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
>> -endef
>> +ifeq ($(BR2_CCACHE),y)
>> +QT5BASE_CONFIGURE_OPTS += -ccache
>> +endif
>>   
>>   # Must be last so can override all options set by Buildroot
>>   QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
