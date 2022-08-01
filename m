Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB5BC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17056072A;
	Mon,  1 Aug 2022 18:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E17056072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5q8OlWbyPCGY; Mon,  1 Aug 2022 18:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F005E605B5;
	Mon,  1 Aug 2022 18:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F005E605B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73FC71BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BC2C605B5
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC2C605B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKmTifGOeJ7F for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:53:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28B26605A4
Received: from delivery26.mailspamprotection.com
 (delivery26.mailspamprotection.com [185.56.85.152])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28B26605A4
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 18:53:26 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se26.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oIaXY-0000BH-L0; Mon, 01 Aug 2022 13:53:23 -0500
Received: from [127.0.0.1] (port=31586 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1oIaXW-000BfG-Ia; Mon, 01 Aug 2022 18:53:18 +0000
MIME-Version: 1.0
Date: Mon, 01 Aug 2022 21:53:18 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220722225120.2472bbab@windsurf>
References: <20220614192445.2390329-1-ben.hutchings@mind.be>
 <20220722225120.2472bbab@windsurf>
Message-ID: <b4e1a3f6777f709531b2619e0136a971@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.05)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/punAH+4+sTc9Iy2XnXwxYPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zHcgQ1GLCGZipGdBYX2IdejIhOyETOLJV5VgRmbWjZJbyi
 BzP+GhcIfQHbATYPLaf2RzUtF3sGx1OL1gSuiUFzpsTXNfl2OTzOk92IQdWevo8wUiRihvC73ecr
 qaqBbHB9tIxEz54OpJ3WlNIBVDXiBMmyNbDn7R5kilAhwr3KtE82Y55K6y9ZgAjMP1BdBtH99j24
 fCKFjJ00TfwRkP5Nim7uLhpYYJK3x23WQwPUUy7K60IW4/F/dWke8muiACEDtkk3QQOVL9hnwCPn
 of/p12Kq0X+vYLUKAMtfkvFCdcJd2gOf7PmKQDdYkFqWLMVaG2Xk5Dlma9rwsgne6VKzz+hXY236
 UJ7NMFIpB2psCWeupYYdzPm7YfRDaULOU2kfgMf4XRgCk/48zRqgqXKN2lJzhbC5sYrXgIPy4N0E
 H/ShdP00nxzh/m35ytL/WYih7iAUACC9x9WSYyrCeKS5bUjJJPVsoak2L6UN8XlZCQoCGrlIzmqo
 F6CrEjw8HUvhPepG2LHjJMOL7cEyEf/vUmqtf6x3rmjgUk0qjhwi16md5hc1genUt5SKamQF/bmi
 FMJX/lb6Jg9m3TrkqSdymVC7P8f8ImOGzkFR/x9EEDwX8glEDxkXwLkCckHFIUNOB2XvjaW5uTwP
 c8WgwrrudZBcpDAIWdCADSwEOtnmZWoMdUyXUOAkAA03/kA2wnXIHYi/jghIJpVkvIZQze0Bvz75
 tgYDfBFwFCAEbR5DfsTCxFvcxYv7uZXgUgSusGRX0RoiO3m12ZhcmBL3vZzFL4ZtKqHqj8IV0jkI
 hjPbZ0QahySd4u/u/+AtakUCzjdApyh/zCpmuDVeP4FW1xtfJOS5h+TTw0EG3/H9PQJ+BpPIh5PA
 FNig8x78dPTncSuSKVM5sn/V80FEjDhvbJroiWrFfcvTzpdI3AEG059XQQ6vSZVIoXNyXOAkCXnq
 yUl3OnKG9eRDP2/Ogb+c8D2ouQcPlXheOO7LhmKiyWvN6lRwU7KthS1ONjXrKvAIshoKMxok0xbe
 7OP4XRubBt5odkikeAaZM4DPxsqVMpYXkjkPLSQifVL7ETp0RrghNI74wgLK6zscwmSrWmL+3Klk
 FyrtVW4KaRSURqFyxA+5hyiCBqrB4vMmHpjmx6wTDBzM6OBIiRlZBT2QtsvZWZbMVzPVNsBDv2tx
 UnzopboTLg==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nSYANd3YHrThoFDYifnRy/DaKY05Z7eXh3F+QOZb1B0=; b=CsNoEmGu8ZT3+sXREMM02J63Hc
 +Zifa0PI8iz15cagcHlaj1MIXBpZaZrCI/E8mSV9oemgrJ57yyhWWkJW3FJeMkOuy9/uBb8z/Ukxd
 dRbQYXNetBqNMe87e/j1AkfrYcKWIgQBcMp04cege7qDoZFU5OrudisY8D4MYqR05v3iGgqFK2Xkj
 Lqx9kSmkiyIEc9G7uYwd8Kea34hKNOLNnac/uipAF1x48qq4SNxT5vaQjJKxaxMsWSx2mY/GgSewq
 sJ2OgVUhPAto79g1NsNQqnGXIKBKNbGMxzx36wIhb/31/3LUIOaA57O928+/kQE9D+UExCcPYiEcA
 3eFf0jNQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=CsNoEmGu
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: Re: [Buildroot] [PATCH] package/wolfssl: Disable broken asm
 implementations on 32-bit Arm
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
Cc: Ben Hutchings <ben.hutchings@mind.be>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,,

Sorry for my late response, it seems my email filters are not properly 
set for buildroot.

My domain expertise is with wolfTPM and the related wolfSSL 
capabilities, such as crypto callbacks, AES CFB, etc.

I can only assume that the optimization was designed for a specific SoC 
and later generalized.

Thanks,

Dimi

On 2022-07-22 11:51 PM, Thomas Petazzoni wrote:
> Hello Dimi,
> 
> Could you give some feedback on the below patch that touches wolfssl?
> Do me it looks good, but perhaps you want to improve something in
> upstream wolfssl in relation to this issue, such as detecting the CPU
> architecture capabilities automatically?
> 
> Best regards,
> 
> Thomas Petazzoni
> 
> On Tue, 14 Jun 2022 21:24:45 +0200
> Ben Hutchings <ben.hutchings@mind.be> wrote:
> 
>> wolfSSL has ARMv8-A assembly implementations of some functions for
>> both A64 and A32 ISAs.  However, some of the A32 versions use r11,
>> which is usually not allowed:
>> 
>> wolfcrypt/src/port/arm/armv8-aes.c: In function 'wc_AesCbcEncrypt':
>> wolfcrypt/src/port/arm/armv8-aes.c:3303:5: error: fp cannot be used in 
>> 'asm' here
>>  3303 |     }
>>       |     ^
>> 
>> That can be fixed by adding the compiler flag -fomit-frame-pointer,
>> but then there is another failure:
>> 
>> /tmp/ccV19DQV.s: Assembler messages:
>> /tmp/ccV19DQV.s:248: Error: first transfer register must be even -- 
>> `ldrd r11,r10,[r14,#4*14]'
>> make[3]: *** [Makefile:5858: 
>> wolfcrypt/src/port/arm/src_libwolfssl_la-armv8-chacha.lo] Error 1
>> 
>> This is definitely not a valid instruction in A32, which suggests that
>> this code isn't being tested at all upstream.  So disable it here.
>> 
>> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
>> ---
>>  package/wolfssl/wolfssl.mk | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>> 
>> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
>> index 58b6f296ab..ff6a65c397 100644
>> --- a/package/wolfssl/wolfssl.mk
>> +++ b/package/wolfssl/wolfssl.mk
>> @@ -33,14 +33,12 @@ WOLFSSL_CONF_OPTS += --disable-sslv3
>>  endif
>> 
>>  # enable ARMv8 hardware acceleration
>> -ifeq ($(BR2_ARM_CPU_ARMV8A),y)
>> +ifeq ($(BR2_aarch64),y)
>>  WOLFSSL_CONF_OPTS += --enable-armasm
>>  # the flag -mstrict-align is needed to prevent build errors caused by
>>  # some inline assembly in parts of the AES structure using the "m"
>>  # constraint
>> -ifeq ($(BR2_aarch64),y)
>>  WOLFSSL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -mstrict-align"
>> -endif
>>  else
>>  WOLFSSL_CONF_OPTS += --disable-armasm
>>  endif

-- 
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
