Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A75C433FE
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 17:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 094FE409FC;
	Mon,  3 Oct 2022 17:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 094FE409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Xeyqlqf_GFG; Mon,  3 Oct 2022 17:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BE7D409E0;
	Mon,  3 Oct 2022 17:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE7D409E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 572D51BF2B9
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 17:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 326B0408F5
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 17:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 326B0408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eB1wMf4rHpiz for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 17:21:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5436408CA
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5436408CA
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 17:21:55 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id c11so6737694qtw.8
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 10:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=uWTNVaZpn+qWWmNJPIgkofOmRLAAG3u68SpMAVhTB7Q=;
 b=epu1WYcWrLhk8LBmeU4jaCkngXOoR0f6Vr1DVpAldOKV8bPpIMHdHwe5nMwVGvFQ/M
 9+Zn7KB5WyVOt7DJ3IyEV8aEgePkjzi60TWliJZ+6qngMqfTZll9/T5FVAKlli7PZ91Y
 Oz5DJWFBFAyDaoM/Al0HQNEohoZ9wTgXODW62KMZT3QI81IczODFWZIHdPvx1J3dNhjD
 m8La51hyJ5v59ZHFLrHQ4BoWKJY1dokr9GhyXAO00OPSnFj8gIlQaLKzyp9t2Sx7TdaJ
 Iwa3lvp8UXvWfgQi7Mzh8eu4aEUt0fkUkA7XKj0PYWXVHwo6Mq4z5EpkTEAQZFilBt6b
 4gjQ==
X-Gm-Message-State: ACrzQf0wE/SFB/WQewWTDn/UUGhiOaBm2jB7in1Tus3m0QHwOs51Al+2
 8RytkrLgpQcRfrkyffGlxygayFD23aI=
X-Google-Smtp-Source: AMsMyM5HQxUMVeE5C4mNYLz8ECxkxr2ktIwzvt3YSd48PVO4D90f4Tx6CfFyt//dzyFNhqZ+8x1dPA==
X-Received: by 2002:a05:622a:58a:b0:35d:451a:39f8 with SMTP id
 c10-20020a05622a058a00b0035d451a39f8mr16477888qtb.321.1664817714483; 
 Mon, 03 Oct 2022 10:21:54 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 b8-20020ac844c8000000b0035d57445127sm9843191qto.47.2022.10.03.10.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 10:21:53 -0700 (PDT)
Message-ID: <ee93a0b3-3743-3fbc-f34e-995178d429d8@gmail.com>
Date: Mon, 3 Oct 2022 10:21:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
 <20220928233856.77bb191c@windsurf>
 <dda7b7d2-4846-6623-5ca7-39799015a138@gmail.com>
 <20221001190702.GQ30794@scaer>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221001190702.GQ30794@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=uWTNVaZpn+qWWmNJPIgkofOmRLAAG3u68SpMAVhTB7Q=;
 b=Gh+EuDq5yFn6pRCmeAKqOoYG3aFWVFra6aTuIKRHAGL7AXmR7pznsHv4cJYzaSfjlR
 nAs7aekwGRs41wjvqi6jpKmXKj/l8Uc0rq32cfw3xXB8XYYfcPRO9McoayH6lXU6nh4j
 EjQOLmIL9M9HOt5GlpMnxd5RbDqHFcHINJkm8JEivue7T5es8Lmcbn/IQRHoCGT5iUDq
 +2IVcE8dTFpOQ4c/jSynlcUJ8Rh6Z42NCAzX87bviS1fG5v3FlLJz40oLB/5CH/yrVlA
 9ETk4V5ZdewFtuQZEPl64me9rqfXMB4ZWJKrNoQpFDsVVF7uY9aTCszhwPPfaNRwPc5D
 nf0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gh+EuDq5
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/1/22 12:07, Yann E. MORIN wrote:
> Florian, All,
> 
> On 2022-09-28 15:28 -0700, Florian Fainelli spake thusly:
>> On 9/28/22 14:38, Thomas Petazzoni wrote:
>>> On Tue, 27 Sep 2022 15:11:33 -0700
>>> Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>> Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
>>>> ("perf tests: Add test for PE binary format support") present in >=
>>>> v5.10 there is an unconditional installation of PE binaries which will
>>>> be rejected by the check-bin-arch script.
>>>>
>>>> Make sure that these binaries are excluded from being checked to allow
>>>> the installation of the perf tests.
>>>>
>>>> Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>
>>> Thanks for the patch! Before merging it, I'd like to understand a
>>> little bit more how readelf behaves for these PE files. Indeed in
>>> check-bin-arch, we are doing:
>>>
>>>          arch=$(LC_ALL=C ${readelf} -h "${TARGET_DIR}/${f}" 2>&1 | \
>>>                         sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1)
>>>
>>>          # If no architecture found, assume it was not an ELF file
>>>          if test "${arch}" = "" ; then
>>>                  continue
>>>          fi
>>>
>>> for a PE file, I would expect readelf to badly fail, and therefore
>>> ${arch} to be empty, and the file simply ignored.
>>>
>>> What is the behavior/output of readelf on these PE files?
>>
>> If I use my host system readelf which is packaged from
>> binutils-x86-64-linux-gnu, I get no output and all is well, however when
>> check-bin-arch is called and it uses $(TARGET_READELF), I do get:
>>
>> ./host/bin/aarch64-linux-readelf -h
>> build/linux-custom/tools/perf/tests/pe-file.exe | sed -r -e '/^ Machine:
>> +(.+)/!d; s//\1/;' | head -1
>> IMAGE_FILE_MACHINE_AMD64 (0x8664)
>>
>> which is what prompted me to issue this patch in the first place.
>>
>> I should mention that the readelf binary in this case is the LLVM Object
>> Reader and it does support PE/COFF which is probably why it even remotely
>> attempts to parse the file.
> 
> OK, but isn't that flawed? It is named 'readelf', so I would expect it
> to not report on non-ELF files, at least by default (i.e. unless a
> specific option flag is passed).
> 
> If a readelf tool does not behave like a readelf tool should behave,
> isn't that a bug in that specific readelf tool to begin with?

Markus can correct me but it seems to me llvm-readelf is LLVM's own 
doing and aliases to llvm-readobj, given that PE executable support was 
built into the toolchain, it happily went into parsing the PE files. I 
suppose that in premise llvm-readelf should retrict itself to parsing 
ELF files, clearly LLVM developers thought differently.

> 
> Otherwise, it is very intriguing how you managed to have a toolchain
> without gcc et al, be usable for Buildroot that only knows about the GNU
> ecosystem.
> 
> Is that a publicly available toolchain? 

Not yet, but soon.

> Can you share the recipe how that toolchain was generated?

Yes that will be done.

> Do you have special, local changes in Buildroot to accomodate that toolchain? Will you submit those changes?

Yes a few and yes we will, provided there is interest from the buildroot 
community to have support for a GNU-free and musl-libc based toolchain. 
The approach we took for now is that we provide a GNU-compatible wrapper 
and set of executable names such that you build with clang/LLVM but you 
don't really need to know about it, except where it matters.

> 
> That would allow adding more testing to avoid such issue in the future.
> Otherwise, I am not fan of adding such exclusion for private cases that
> we can not (easily) reproduce, as those cases are not supported.

Fair enough, how about we make sure the toolchain is available, can be 
re-created by anyone who desires so and then we submit the changes to 
buildroot that we have so you see the full picture?
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
