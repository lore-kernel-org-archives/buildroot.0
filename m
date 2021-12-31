Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E90C433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 10:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F1028125B;
	Fri, 31 Dec 2021 10:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-yDfKCD0uFh; Fri, 31 Dec 2021 10:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE50280C80;
	Fri, 31 Dec 2021 10:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27E0A1BF359
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 10:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 166FB80C80
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 10:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQdtNth3dNql for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 10:46:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 526FB80ABA
 for <buildroot@busybox.net>; Fri, 31 Dec 2021 10:46:37 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p13so23340919lfh.13
 for <buildroot@busybox.net>; Fri, 31 Dec 2021 02:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JQA7TdXEWT+JaJ7Ed1iE8nIj2iGTpRzyTih4u1k4hW4=;
 b=df36RlnYMihFjXKRZ8oBNOJqMhdtbg2gqsKTXidyaIUGJ24U0nS3FJTagrzBrNj5Il
 6F/oENAFgsFOutfGY28Ylm6DyaEJ+qWZryDf053I0zgRi1YpsfJ0fMJQt/iOEW4m1GS9
 acX39oERhTQL8ZYCmlIGfJcTD7ru4yjb1PfTA7jygSXan8wPa88gkF3n4TGO2EN4nc0+
 i69akiEd069fMzbYA+yaLPv1Qbn/FZuGU32wXWkds0zw3r6oOX9G4BzOil7aBtc/yWsG
 Y4jjPaJDbsiYPeVMfmAVCfEx38i4W3OUSgEqQJ7Xh2erTGWDCmLWo+7/zdjtVMsPeWG8
 aABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JQA7TdXEWT+JaJ7Ed1iE8nIj2iGTpRzyTih4u1k4hW4=;
 b=TC2hLTHMg3XsDa+pSybQU+4FQl4a32YAUvqXugvBq3HRp5282zc4m567/t35BMCuHw
 LIe7Ji54v1QaHPf1cl5ADoFAroR1D+s61fdYlkXk/mx931JswXg8yPimOSBPCp6Iky6p
 f/4v8X8q86JT2uZB35myILVIJGh0grGCAjHzdxDhOz+lb3xocEMKDiWX/8A5+sha1Rlj
 6msqpFas9Yo+FwiOZpjA3V8E3L7PtLbymbOeFQBH9nqdy7fTMA+1VKacC6t2nc62biq2
 Pxm4KksrGHCDuaqb+FolH5/uJF4yV8gplYLu5s5EZfeniCSNGSgsMlmwmsoQpcH5t70j
 O9Vg==
X-Gm-Message-State: AOAM533PDcFhujTzQv3hgJp1XYWEjPTeFNCgDb9o4V14UWd6d6DMzvCz
 rrVYAQEI48B/keHckhdoHU1ZqhFdUpI=
X-Google-Smtp-Source: ABdhPJwmyV+GfNHHbil2GT5k9snrEYTF6CeCqQUIIH9GcMCcQm3+CeHISXWazkvo8CXhg2uqU4xn3A==
X-Received: by 2002:a05:6512:3d9e:: with SMTP id
 k30mr31546877lfv.184.1640947594608; 
 Fri, 31 Dec 2021 02:46:34 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.201])
 by smtp.googlemail.com with ESMTPSA id k32sm2739257lfv.196.2021.12.31.02.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 02:46:34 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20210317222849.1658538-1-masahiroy@kernel.org>
 <20210317222849.1658538-3-masahiroy@kernel.org>
 <20210320225648.5c8d0cb4@windsurf.home>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <afafa25f-5c4c-75e5-7dfb-da8f93204701@gmail.com>
Date: Fri, 31 Dec 2021 11:46:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210320225648.5c8d0cb4@windsurf.home>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 3/4] Rename custom kernel defconfig files to
 *_defconfig
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

On 3/20/21 10:56 PM, Thomas Petazzoni wrote:
> On Thu, 18 Mar 2021 07:28:48 +0900
> Masahiro Yamada <masahiroy@kernel.org> wrote:
>> There is no consistency in file names for
>> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE. Some are suffiex with "defconfig",
>> and some with ".config".
> The *vast* majority of them are named .config. Only three use
> -defconfig or _defconfig. Please normalize on .config, not the opposite.

just to tie up some loose ends.  In
CAK7LNARM_nzn39T0v46XWmLYE1u-DHi65Odm_w9+vxhc6c0x6Q@mail.gmail.com, (Re:
[Buildroot] [PATCH 1/2] qemu_arm_versatile: switch to in-kernel
defconfig + fragment) ...

On 3/16/21 3:55 PM, Masahiro Yamada wrote:
> Maybe we can give _defconfig suffix to
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE,
> and .config to BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES.
>
> This goes along with the naming rule in the upstream kernel.

If I understand correctly, in Buildroot we have sort of standardized on
.fragment for .config fragments, both for Linux and BusyBox.  But it may
be a bit confusing, since this nomenclature is not used consistently.

From a single linux.config file in board/ it's currently not possible to
know if it's a full kernel .config or a .fragment without looking in the
corresponding Buildroot _defonfig for that target.

So we should try to clean this up a bit, but what should it be?

  1. Enforce current best practices, or
  2. Radically rethink our current nomenclature?

Personally I rather like Masahiro's suggestion to follow Linux kernel
naming rules.  A linux.defconfig (or linux_defconfig) might be better
than linux.config, which in turn would allow us to use linux.config for
fragments.  The same could apply to BusyBox configs as well.  In either
case we should probably update examples and/or add a section on naming
things (policy) to the manual.

I can help out here with both tasks, take over Masahiro's patch series
if necessary, and suggest additions to the manual.

What do you think list?


Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
