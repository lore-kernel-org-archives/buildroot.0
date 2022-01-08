Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E46BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE4BC81453;
	Sat,  8 Jan 2022 18:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KITAJu83c07; Sat,  8 Jan 2022 18:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 453A081450;
	Sat,  8 Jan 2022 18:50:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDBAF1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA32C81450
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcYb1MAMJdll for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3BB08144E
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:50:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o3so18003309wrh.10
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=chzDOJwtX5XUOnOCvYysXama0xmOqk3/DFv2VGCacXs=;
 b=LDqHlsdmvzZop1vh4ItIz+f5y4MDiUhIrcZxSUVcIIEdWjy3O4b2fpx203spNON3QW
 kWd7y48YBYXv/s6+6PdOQCE0QnMhbt5Xj893Os2EtyQL/aiLGuwV7reEO3PdNlI3BRr2
 eEAFBX0FpZrQDTY7BQq7Ek/A46jXPqoNzYpDQogw80jPosckGU8k1cHoGG8QUExSTrpu
 937yq7i85ube4zojiZmitKzr7aLqNmIz+A/HTFwSk0QqeRGbQvU/ek1d+wTMqo55Jmxx
 ZcIf6jUb3yeh9g0qYSUBUvX2Bds4jkmujKsf5YulHQWOhIHF6vl+L3GISzgBGcQxxDAh
 Wrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=chzDOJwtX5XUOnOCvYysXama0xmOqk3/DFv2VGCacXs=;
 b=erZSVfkXlbGfAMgrWS+pQfu3jDUCC6XbCgfXl7xDxgdHPypG5AD+h8/eVItlzo4474
 vdPi+11Z6/2Nk2QaAjGHf3XGo2/uCSkPUEegTlqLpMn0t7wW7d0t+8sRc/abjkvMA0Gw
 4RSI/BfufvfZcFTs245FInMocp+R/POHQBsbsMyLJjsWnQeL3NvPQPLDkAIhyeg4HkHn
 +3l0jzxZZPLdf95m3N0SliECW8rh+c5MQCFI2CjHJeXk8Rf8TOHBQHqxoLUOFAEM4yC2
 7dcCxapqjNvhxi1aXZkl78FWfinAdHIVEuLxTSM8vtGlVIQfLlk2ff3Y6l1dTTRlfDlf
 I3hQ==
X-Gm-Message-State: AOAM530FeT9lnpewUJSDV80bIXe3+SIZGuZRGrMki4W8G11n0Z55XOr+
 W/AGBnUdYT6fNmux4bbOAJYril89BNjPvlLe
X-Google-Smtp-Source: ABdhPJz9MN1rUZxZ8gYPPg7Mz+wfD2l77fJnfMtYhxLksjMSpiJAIVP1yuhbSQqvMvdx0NF47fXZ0A==
X-Received: by 2002:adf:e68a:: with SMTP id r10mr10146053wrm.368.1641667813307; 
 Sat, 08 Jan 2022 10:50:13 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id bg12sm2863682wmb.5.2022.01.08.10.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 10:50:13 -0800 (PST)
Message-ID: <b78ed45f-2483-9ae2-179f-a30664001bb2@mind.be>
Date: Sat, 8 Jan 2022 19:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>
References: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
 <20220108115140.760e195f@windsurf>
 <CAPi7W82_k_toe+-1DdZv8wr2ArKjeZfb9qdarm5oewv52vsh4g@mail.gmail.com>
 <20220108183919.238c1885@gmx.net> <20220108193800.5f91ac3b@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108193800.5f91ac3b@windsurf>
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/file: fix build with gcc 4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 19:38, Thomas Petazzoni wrote:
> On Sat, 8 Jan 2022 18:39:19 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
>> The difference seems to be:
>>
>> 	$ diff -ru file-5.38/configure.ac file-5.41/configure.ac
>> [...]
>> @@ -88,7 +88,7 @@
>>   AC_SUBST(WARNINGS)
>>   
>>   dnl Checks for programs.
>> -AC_PROG_CC_STDC
>> +AC_PROG_CC
>>   AC_USE_SYSTEM_EXTENSIONS
>>   AM_PROG_CC_C_O
>>   AC_C_BIGENDIAN
>> [...]
>>
>> According to [1] AC_PROG_CC checks/enables c89 and AC_PROG_CC_STDC checks/enabls C99 (or
>> use AC_PROG_CC_C99 to be more explicit)..., note that with AC_PROG_CC the ac_cv_prog_cc_c99
>> feature is gone (still used for target/host in package/file/file.mk)...
> 
> But why the solution we use for the target package doesn't work for the
> host package?
> 
> Or perhaps we're no longer testing the target package with gcc 4.8 ?

sourcery-arm*.config uses the CodeSourcery toolchain which has gcc 4.8, so yes 
we should be testing it with gcc 4.8...

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
