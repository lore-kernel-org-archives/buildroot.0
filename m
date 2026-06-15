Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3662CCD98C5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0487D6146E;
	Mon, 15 Jun 2026 17:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NqWMBshESIn; Mon, 15 Jun 2026 17:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B572F61470
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781545633;
	bh=zGAznw+k9UT7MKsYT++SEw8O23M2vLNQjdja6Fuzos0=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=qgic94yD6gUlCanmjpBIIHH+x6rrU+3I+6vDDgcUqf427UTFv1cBPM2hSQGFkeH7g
	 HDOaeUW8U3CKYJ8g5r1A+OBtE2Ya3KSSHEDC/z1R/tFm7bkG0pMzj7okpnDUaeTue8
	 SXNOvOFZwe3UQ7s5SfraumNU/38ENxz3TKN3vglBg0Iqbvc4cOVq/u+2IrtwO7r9Vu
	 obU2KN3RpdOro/Us6pFqk3VA+/pgQL+U/ouy49Q4+TvarTUPgT3CkHghKhFOeKOmzK
	 m40yOL4jzrFsHQdCTmvgOh0wUZs6Vr+BlJfL89NQLX3ciU3MOVJw0mm5crzojJL3Sl
	 RTA3SQm4evRag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B572F61470;
	Mon, 15 Jun 2026 17:47:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 433AF2F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29D396146F
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWTcOK8wquEl for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 17:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B4516146E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B4516146E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B4516146E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:47:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4A36513F8A9;
 Mon, 15 Jun 2026 19:47:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 19:47:05 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 19:47:05 +0200
To: Michele Comignano <mcdev@playlinux.net>
In-Reply-To: <2c8f5ad9-1917-450c-a899-3bcdc130453b@app.fastmail.com>
References: <20260613215558.978962-1-mcdev@playlinux.net>
 <87wlw1l9cx.fsf@dell.be.48ers.dk> <2c64e76850f28ec44af165e020424b0a@free.fr>
 <1d266f71-792d-4785-af20-aa53fc858325@app.fastmail.com>
 <2c8f5ad9-1917-450c-a899-3bcdc130453b@app.fastmail.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <f177ac01cfd1e52af17e06a2a44950df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781545628;
 bh=76IP1FIzuV5D1oOYnDepZF+sm5mUFbWjmP7M9nPSwzs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=crHjH6htIEKUMFzLmeIQtJwqwE4lok1P1OtJ6tLdp0pqHrmy1L99l8kZu74MWEqvA
 ndffzasxtLxgRFWnRtJN0we+SXtcmJm+wg3L36P+H/euPry/WxCCBOOaAiwSuGRijE
 3oOfhCyx8XGx7dTDCZ2rzIn1jCwrRvSQYemFGCsfoyK3yPulUIbcnpWSIr52cFlu3m
 3OAz/DzwtHoG8MWy/Q8Pw/Bk93jD7l+S/jS12jgM2IbzlUaGePXim1WgmLlr8XAADb
 O1AcAxFBNoHd/h2WH4hIUP+fmk480MrAfam4b9pxM/sAQhfBE7/duGDzhurCXW8kPr
 m3QmgsOeZu5LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=crHjH6ht
Subject: Re: [Buildroot] [PATCH] package/opus: don't use vcvtaq_s32_f32 on
 32 bit ARM
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michele,

On 15/06/2026 11:38, Michele Comignano wrote:
> Just noticed that I linked the wrong rust arm intrinsics docs.
> The right link is
> https://doc.rust-lang.org/core/arch/aarch64/fn.vcvtaq_s32_f32.html
> which matches gcc observations (arm 64 only).
> As for clang, the example code used another intrinsics, here is one
> using exactly vcvtaq_s32_f32 https://godbolt.org/z/31f1xnjvz, which
> also works.
> 
> Kind regards,
> Michele
> 
> Il Lun, 15 Giu 2026, alle ore 11:23, Michele Comignano ha scritto:
> 
>> Thanks for all the hints! I tried going a bit deeper.
>> 
>> Looking at GCC arm_neon.h
>> 
> (https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/arm/arm_neon.h;h=6785dd2578a8ee0fd28b04d30934b764ea5fff3e;hb=HEAD),
>> vcvtaq_s32_f32 is not present, though the arm instrinsics search
>> suggests it is supported for the reference arch combo
>> 
> https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiessimdisa=[Neon]&f:@navigationhierarchiesarchitectures=[A32]&q=vcvtaq_s32_f32
>> [1].
>> 
>> In a way, the ifdef from opus seems to match arm documentation,
>> though GCC is not making it available.
>> 
>> According to
>> https://gcc.gnu.org/pipermail/gcc-patches/2016-January/439845.html
>> the intrinsics vcvtaq_s32_f32 was added in circa 2016 to arm_neon.h,
>> yet reported as missing in circa 2020
>> https://gcc.gnu.org/pipermail/gcc-bugs/2020-May/703594.html.
>> The latter led to the creation of a GCC issue at
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95399 which still sits
>> new.
>> 
>> Interesting enough, rust (I wanted to check some other compiler)
>> seems to match arm docs, though arm instrisics are deemed as
>> experimental
>> https://doc.rust-lang.org/core/arch/arm/fn.vcvtq_s32_f32.html.
>> Clang as well seems to support vcvtaq_s32_f32
>> https://godbolt.org/z/xsMfSz (link taken from from gcc bug at
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95399).
>> 
>> So the problem seems to be GCC only.
>> 
>> After all the research, the problem arguably sits in either upstream
>> gcc or opus, but as a matter of fact opus package build through
>> buildroot is currently broken on 32 bit arm neon.
>> 
>> Do you think my proposed patch could apply as a buildroot-only quick
>> fix?

 From Arm documentation, Armv8-A Aarch32 does support vcvtaq_s32_f32.
Gcc apparently does not support it in 32-bit, but clang does.

Since it seems it is just the gcc support which is missing, maybe
your patch could changed for upstream as:

/*
  * 32bit Arm gcc does not support vcvtaq_s32_f32()
  * See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71233
  */
#if defined(__aarch64__) || (defined(__ARM_ARCH) && (__ARM_ARCH >= 8) && 
defined(__clang__))
...

It does not really change anything in Buildroot, since there is
only Gcc. But for opus upstream, it will still allow other users
to keep using this on Armv8-A Aarch32.

Also, we try to avoid carrying Buildroot-specific package patches,
so it's better the fix is accepted upstream (your initial proposal,
or a revised one).

>> Best regards,
>> Michele
>> 
>> Il Dom, 14 Giu 2026, alle ore 18:58, Julien Olivain via buildroot ha
>> scritto:
>> 
>>> Hi Peter, All,
>>> 
>>> On 14/06/2026 12:11, Peter Korsgaard wrote:
>>>>>>>>> "Michele" == Michele Comignano <mcdev@playlinux.net>
>>> writes:
>>>> 
>>>>> From: Comick <mcdev@playlinux.net>
>>>>> Upstream issues is waiting for feedback.
>>>> 
>>>>> See here for details:
>>>>> https://gitlab.xiph.org/xiph/opus/-/work_items/2397
>>>> 
>>>> 
>>>> Hmm, indeed - There is no vcvtaq_s32_f32 intrinsic in
>>>> gcc/config/arm/arm_neon.h but there is in
>>> gcc/config/aarch64/arm_neon.h
>>>> but I do not understand the finer details - Julien?
>>> 
>>> Armv8-A Aarch32 is in fact a superset of Armv7-A. This is why
>>> there
>>> is few 32bit Armv8-A instructions which are not available in
>>> original
>>> Armv7-A.
>>> 
>>> See the column "Supported architectures" in the following table:
>>> 
>> 
> https://arm-software.github.io/acle/neon_intrinsics/advsimd.html#conversions
>>> 
>>> vcvtaq_s32_f32 is maked "A32/A64", whereas, for example
>>> vcvt_s32_f32 is marked "v7/A32/A64".
>>> 
>>> There is also a search engine for intrinsics available at:
>>> 
>> https://developer.arm.com/architectures/instruction-sets/intrinsics/
>>> 
>>>>> Signed-off-by: Michele Comignano <mcdev@playlinux.net>
>>>>> ---
>>>>> ...use-vcvtaq_s32_f32-on-32-bit-systems.patch | 26
>>>> +++++++++++++++++++
>>>>> 1 file changed, 26 insertions(+)
>>>>> create mode 100644
>>>> 
>>> 
>> 
> package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>>>> 
>>>>> diff --git
>>>> 
>>> 
>> 
> a/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>>> 
>>>> 
>>> 
>> 
> b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>>>>> new file mode 100644
>>>>> index 0000000000..ddd572921f
>>>>> --- /dev/null
>>>>> +++
>>>> 
>>> 
>> 
> b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>>>>> @@ -0,0 +1,26 @@
>>>>> +From 321532001d59367466a6a4a60f5c6f0fe5fa2176 Mon Sep 17
>>> 00:00:00
>>>> 2001
>>>>> +From: Comick <mcdev@playlinux.net>
>>>>> +Date: Sat, 13 Jun 2026 21:48:00 +0200
>>>>> +Subject: [PATCH] celt/arm don't use vcvtaq_s32_f32 on 32 bit
>>> 
>>>> systems
>>>>> +Upstream: N/A
>>> https://gitlab.xiph.org/xiph/opus/-/work_items/2397
>>>>> +
>>>>> +---
>>>>> + celt/arm/mathops_arm.h | 2 +-
>>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> +
>>>>> +diff --git a/celt/arm/mathops_arm.h b/celt/arm/mathops_arm.h
>>>>> +index b1f9169..c612dae 100644
>>>>> +--- a/celt/arm/mathops_arm.h
>>>>> ++++ b/celt/arm/mathops_arm.h
>>>>> +@@ -37,7 +37,7 @@
>>>>> +
>>>>> + static inline int32x4_t vroundf(float32x4_t x)
>>>>> + {
>>>>> +-#  if defined(__aarch64__) || (defined(__ARM_ARCH) &&
>>> __ARM_ARCH
>>>>> = 8)
>>>>> ++#  if defined(__aarch64__)
>>>>> +     return vcvtaq_s32_f32(x);
>>>>> + #  else
>>>>> +     uint32x4_t sign = vandq_u32(vreinterpretq_u32_f32(x),
>>>> vdupq_n_u32(0x80000000));
>>>>> +--
>>>>> +2.54.0
>>>>> +
>>>>> --
>>>> 
>>>>> 2.54.0
>>>> 
>>>>> _______________________________________________
>>>>> buildroot mailing list
>>>>> buildroot@buildroot.org
>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>> 
>>>> 
>>>> --
>>>> Bye, Peter Korsgaard
>>> 
>>> Best regards,
>>> 
>>> Julien.
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> 
> 
> Links:
> ------
> [1] 
> https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiessimdisa=[Neon]&f:@navigationhierarchiesarchitectures=[A32]&q=vcvtaq_s32_f32

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
