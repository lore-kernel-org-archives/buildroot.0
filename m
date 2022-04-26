Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A24C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 22:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32E7840BB0;
	Tue, 26 Apr 2022 22:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ygAZUxXO0u8X; Tue, 26 Apr 2022 22:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3253540BA0;
	Tue, 26 Apr 2022 22:32:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 619D11BF951
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C1C141980
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4GOaJ0PZLe0 for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 22:32:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B0604197F
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 22:32:46 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id j8so32555pll.11
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 15:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2okEuoKmTyK34X7tAXTynJwLtsoAopluMsdu/vyAjn4=;
 b=esY64czVuIyBwc45wZ9Xd8mQKy5yvhgkYn5TVZ3EToj581ZRQUIE91VigNG6GFdUSj
 wBoDyFiPpIIQF6NoKDipE/arfIwr+0O8IH+CAplbVrSSmb5qd7LOVDEI5HphI27THBNi
 6YJO03vBdYakzIk9dTuGVGZPERyNbijgC/Pyl48kTd6VQjSbKxJdMBcyfakpEP7PxJAr
 VZlMy7PKadG9RtSgCBjnSQR1BwB0aiumVqsFWWCqwNaTJNMEpm0eN82yEtDzXCggxHjz
 z5tCMkvDkQ54NK+McqW7wdM/y0RVwX90BZ++CelssWa8sEtJnneCKIrkHDlAKf0k0qpr
 W1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2okEuoKmTyK34X7tAXTynJwLtsoAopluMsdu/vyAjn4=;
 b=DOrooBT/qpbLOJC/clwJz95iCR3WhCObhzLqln03fMVM9p/lDQhRMgJykNcVhCbx2H
 oSrV0ETb0kapBsqCEhiwSYPPIa4hEAzhCBQbDTsrq1aHmJEVI7maR7y9b7WfDrYS8M9j
 /rvtYqE2zGmkafIsjwi8yN2SrNZmZ90Gqg7NrIF82LZK/AQtXrZABXb2RgLlDhC26Ntw
 0JiNx5tqnV3haLznUxZL+5vbZIP80SWL4IM7OdhaJGZAXK2BJBv0EvAvWWqToZJvyXmF
 uWt+lkId0nR4Kfdp+FoBwHAOFpf6rCdxGkHzyzHIJzL0BIq5eBK4OMV8f2d+VSZQMl/a
 x1uQ==
X-Gm-Message-State: AOAM530bprzdvSnlRZINW9fxSXtI+LlPBSDau8JH0YD73Bnl9rvH0ecT
 xE5rDKONkk6SDL2k4Jgiji0=
X-Google-Smtp-Source: ABdhPJyTUFDpo0dKVU+oPs06OkgNR+APlpU5W8RWzyHAvYU4kpj5GF9naBO+jCwJ9tm31bYnP02zRQ==
X-Received: by 2002:a17:903:213:b0:156:7efe:4783 with SMTP id
 r19-20020a170903021300b001567efe4783mr25582864plh.126.1651012366393; 
 Tue, 26 Apr 2022 15:32:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 s22-20020a17090ad49600b001cd4989fee1sm4097611pju.45.2022.04.26.15.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 15:32:46 -0700 (PDT)
Message-ID: <6422cb5a-913c-88e4-16b2-aa27bb5a3ddc@gmail.com>
Date: Tue, 26 Apr 2022 15:32:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220426173211.64840-1-f.fainelli@gmail.com>
 <20220426173211.64840-2-f.fainelli@gmail.com>
 <20220426204233.77ed8bc5@windsurf>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220426204233.77ed8bc5@windsurf>
Subject: Re: [Buildroot] [PATCH v2 1/2] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_12 blind option
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
Cc: opendmb@gmail.com, mmayer@broadcom.com, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 4/26/22 11:42, Thomas Petazzoni wrote:
> Hello Florian,
> 
> Thanks for the patch! I hope you're doing well :-)

Doing alright thanks for asking.

> 
> On Tue, 26 Apr 2022 10:32:10 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> In order to add gcc 12 support for internal and external toolchain
>> in follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_12 symbol.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   toolchain/Config.in | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>> index d2c81217c84a..b572a89f2f85 100644
>> --- a/toolchain/Config.in
>> +++ b/toolchain/Config.in
>> @@ -117,7 +117,8 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
>>   	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
>>   		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
>>   		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
>> -		BR2_TOOLCHAIN_GCC_AT_LEAST_11
>> +		BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
>> +		BR2_TOOLCHAIN_GCC_AT_LEAST_12
>>   
>>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
>>   # longer exists in gcc 8.x.
>> @@ -150,7 +151,8 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
>>   config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
>>   	bool
>>   	default y if BR2_sh
>> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11
>> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
>> +		   BR2_TOOLCHAIN_GCC_AT_LEAST_12
> 
> Did you verify that these two bugs still affected gcc 12.x ?

The bug tracker entry for 
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744 does not seem to show 
a resolution for this bug so I am assuming that it is still active since 
it was not fixed in GCC 11.

Similarly it seemed like 
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143 was still not quite 
fixed.

Do you read the comments differently?
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
