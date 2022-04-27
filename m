Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AACC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE07740448;
	Wed, 27 Apr 2022 07:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xoi1C8CZfZDD; Wed, 27 Apr 2022 07:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A58A840192;
	Wed, 27 Apr 2022 07:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAC8A1BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B98CE40192
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MuQ9c82OVAYX for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:33:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7299C400E7
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:33:21 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id r13so1658785ejd.5
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ik0nWffR6jCrQpLRPxYy4ydrcRZx65oLj1ZrsGcbJG8=;
 b=KBOtVPMXYfo/wR/Xjy7f4UgOkb8IycSoOHbYtXHDzwS7jO0nfyBGDCgrw8/n/sdJeq
 RDM7UabzjU0jPuaEcBb6M4InPtjQ2qlTCTg2cC3bHyOF/skVXJq5xFPphCckxmoy0yKW
 hFTwBTct+gBUkKEpL2N8in8AxmptRZ42ZdDZ63e3B6CEHtQMAKyS+V0R5hvYGEi4rw4u
 lz6HAsjVr3LJNQvF57wA7UsUkyXo+sXkXYJ8ntAy83VE9EZyMHJnUDo3rRhAbMxyXlzK
 GZpTi5qLPRJ0X0jgbv/Mw1Kh+a+1FRzSNZNoLYl7PcGxWdoIZkLum2/3owQgHWMwqhMG
 idcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ik0nWffR6jCrQpLRPxYy4ydrcRZx65oLj1ZrsGcbJG8=;
 b=n5VYqnVBnvrzWPVwM3XCxu+vXBsU9IXGiAIpK1j+YZNfjeEWldn1uipDlc4tcO7yDK
 rhuR9hpZzepgAVYXAbCR/zePTWvVNzxljVyzUKx3/1VJKVuyznSfWqzmbdNUqLuHd5N3
 eCbQUwB6ZtguvzRNv24aKVYFDoiXDhmrpW6pSBCcnKlsx3XsGeladxmhiqbGIpK07rP9
 oHg6+2JH9t9Hk4Aa6YCKqjH7SEryYinaRAQeI5hwflht5Gw+rMccBv7fOdKa6XqX0spK
 98Qas+hecC6VDXb5RbwqBbsUwIfOqzYtSHSNJtCGBWzxuJf1vvfyePEiSvTT691GgqkN
 2shQ==
X-Gm-Message-State: AOAM531MaPNXh/XUnPe51Q2SkOV4juoXwsBWigCEXV1GJQKfZVeuHo9F
 11ojabZsj7aGZKLrj+pAfGYypw==
X-Google-Smtp-Source: ABdhPJwRJs1qpXoawkglW0z6pGLi1UnLz4ZNk25TBooNZ6J6CnxNe3jUEZictO+21cEa+J8ADNZTDg==
X-Received: by 2002:a17:907:5010:b0:6f3:9f0c:3ca with SMTP id
 fw16-20020a170907501000b006f39f0c03camr11492970ejc.532.1651044799483; 
 Wed, 27 Apr 2022 00:33:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a17090632d400b006f3a60598easm2857658ejk.129.2022.04.27.00.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 00:33:18 -0700 (PDT)
Message-ID: <2c4e6c15-2dbb-6945-4348-c9094392eb24@mind.be>
Date: Wed, 27 Apr 2022 09:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>
References: <20220401063930.2158692-1-alistair.francis@opensource.wdc.com>
 <CAKmqyKMZGTL2SY6+d6vv=WpqpdcV0Ze+90pi=X7A=8Q8hVdw1g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAKmqyKMZGTL2SY6+d6vv=WpqpdcV0Ze+90pi=X7A=8Q8hVdw1g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] boot/opensbi: Bump to version 1.0
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 07:41, Alistair Francis wrote:
> On Fri, Apr 1, 2022 at 4:39 PM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
>>
>> From: Alistair Francis <alistair.francis@wdc.com>
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Ping!

  This patch didn't make it to patchwork, and I also don't find it in my 
mailbox. Maybe it didn't even make it to the mailing list?

  Can you resend please?

  Regards,
  Arnout

> 
> Alistair
> 
>> ---
>>   ...Makefile-Don-t-specify-mabi-or-march.patch | 37 -------------
>>   ...Makefile-unconditionally-disable-SSP.patch | 53 -------------------
>>   boot/opensbi/Config.in                        |  4 +-
>>   boot/opensbi/opensbi.hash                     |  2 +-
>>   4 files changed, 3 insertions(+), 93 deletions(-)
>>   delete mode 100644 boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
>>   delete mode 100644 boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
>>
>> diff --git a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch b/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
>> deleted file mode 100644
>> index 5f554a6c24..0000000000
>> --- a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
>> -From: Alistair Francis <alistair.francis@wdc.com>
>> -Date: Fri, 15 Feb 2019 14:57:41 -0800
>> -Subject: [PATCH] Makefile: Don't specify mabi or march
>> -
>> -To avoid
>> -    can't link double-float modules with soft-float modules
>> -errors when building 32-bit openSBI don't specify mabi or march.
>> -
>> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ----
>> - Makefile | 2 --
>> - 1 file changed, 2 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index ae68f55..10851fc 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -145,7 +145,6 @@ GENFLAGS   +=      $(firmware-genflags-y)
>> - CFLAGS                =       -g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
>> - CFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>> - CFLAGS                +=      -mno-save-restore -mstrict-align
>> --CFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>> - CFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>> - CFLAGS                +=      $(GENFLAGS)
>> - CFLAGS                +=      $(platform-cflags-y)
>> -@@ -158,7 +157,6 @@ CPPFLAGS   +=      $(firmware-cppflags-y)
>> - ASFLAGS               =       -g -Wall -nostdlib -D__ASSEMBLY__
>> - ASFLAGS               +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>> - ASFLAGS               +=      -mno-save-restore -mstrict-align
>> --ASFLAGS               +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>> - ASFLAGS               +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>> - ASFLAGS               +=      $(GENFLAGS)
>> - ASFLAGS               +=      $(platform-asflags-y)
>> ---
>> -2.20.1
>> -
>> diff --git a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch b/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
>> deleted file mode 100644
>> index c4edd37f1a..0000000000
>> --- a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
>> +++ /dev/null
>> @@ -1,53 +0,0 @@
>> -From e389d5fbc296e496db15368b2b621e0f178f7f34 Mon Sep 17 00:00:00 2001
>> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> -Date: Sat, 8 May 2021 21:28:10 +0200
>> -Subject: [PATCH] Makefile: unconditionally disable SSP
>> -
>> -Though -nostdlib is passed in {C,+AS,DTSCPP}FLAGS, -fno-stack-protector
>> -must also be passed to avoid linking errors related to undefined
>> -references to '__stack_chk_guard' and '__stack_chk_fail' if toolchain
>> -enforces -fstack-protector.
>> -
>> -Fixes:
>> - - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
>> -
>> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> -[Upstream status: https://github.com/riscv/opensbi/pull/211]
>> ----
>> - Makefile | 6 +++---
>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index eeffe6b..1419360 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -203,7 +203,7 @@ GENFLAGS   +=      $(libsbiutils-genflags-y)
>> - GENFLAGS      +=      $(platform-genflags-y)
>> - GENFLAGS      +=      $(firmware-genflags-y)
>> -
>> --CFLAGS                =       -g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
>> -+CFLAGS                =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
>> - CFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>> - CFLAGS                +=      -mno-save-restore -mstrict-align
>> - CFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>> -@@ -217,7 +217,7 @@ CPPFLAGS   +=      $(GENFLAGS)
>> - CPPFLAGS      +=      $(platform-cppflags-y)
>> - CPPFLAGS      +=      $(firmware-cppflags-y)
>> -
>> --ASFLAGS               =       -g -Wall -nostdlib -D__ASSEMBLY__
>> -+ASFLAGS               =       -g -Wall -nostdlib -fno-stack-protector -D__ASSEMBLY__
>> - ASFLAGS               +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>> - ASFLAGS               +=      -mno-save-restore -mstrict-align
>> - ASFLAGS               +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>> -@@ -236,7 +236,7 @@ MERGEFLAGS +=      -r
>> - MERGEFLAGS    +=      -b elf$(PLATFORM_RISCV_XLEN)-littleriscv
>> - MERGEFLAGS    +=      -m elf$(PLATFORM_RISCV_XLEN)lriscv
>> -
>> --DTSCPPFLAGS   =       $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
>> -+DTSCPPFLAGS   =       $(CPPFLAGS) -nostdinc -nostdlib -fno-stack-protector -fno-builtin -D__DTS__ -x assembler-with-cpp
>> -
>> - # Setup functions for compilation
>> - define dynamic_flags
>> ---
>> -2.30.2
>> -
>> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
>> index f1443498d9..1e1bdc344b 100644
>> --- a/boot/opensbi/Config.in
>> +++ b/boot/opensbi/Config.in
>> @@ -19,7 +19,7 @@ choice
>>            Select the specific OpenSBI version you want to use
>>
>>   config BR2_TARGET_OPENSBI_LATEST_VERSION
>> -       bool "0.9"
>> +       bool "1.0"
>>
>>   config BR2_TARGET_OPENSBI_CUSTOM_VERSION
>>          bool "Custom version"
>> @@ -57,7 +57,7 @@ endif
>>
>>   config BR2_TARGET_OPENSBI_VERSION
>>          string
>> -       default "0.9"   if BR2_TARGET_OPENSBI_LATEST_VERSION
>> +       default "1.0"   if BR2_TARGET_OPENSBI_LATEST_VERSION
>>          default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
>>                  if BR2_TARGET_OPENSBI_CUSTOM_VERSION
>>          default "custom"        if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
>> diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
>> index 3b6d97c42d..1a626e6357 100644
>> --- a/boot/opensbi/opensbi.hash
>> +++ b/boot/opensbi/opensbi.hash
>> @@ -1,3 +1,3 @@
>>   # locally computed
>> -sha256  60f995cb3cd03e3cf5e649194d3395d0fe67499fd960a36cf7058a4efde686f0  opensbi-0.9.tar.gz
>> +sha256  a5efaeb24f5ee88d13d5788e4e00623ff312ee12c0bf736aa75a6ad9a850fb76  opensbi-1.0.tar.gz
>>   sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
>> --
>> 2.35.1
>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
