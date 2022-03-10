Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1288C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DA0540B8B;
	Thu, 10 Mar 2022 21:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GcNiOmPfv8YO; Thu, 10 Mar 2022 21:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3622540B76;
	Thu, 10 Mar 2022 21:03:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 002C51BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1153600D4
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6t42TE-ED1C for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:03:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C39B1600C9
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:03:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x5so8546783edd.11
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2JZqR0i/JdHzlo2N0O5iv47UdeBCMAlYPD3+f7e0zJE=;
 b=JXGnJvvVdea4dM3/p829687RPjs1rdX0xUAGoXo4QhyL1pmfaPRWabfNGON6PtEerA
 eGEMHL9YvN0Zm7uINysh11+uVuxn5nWPANDWyjxYS4PZdpSmxbZYY/GhmYPj5ddlhl+n
 sW+1NlRUp67JVa5tMhTM8yJBdZZRuoLlEdq7x1RyH7ss+ngomc1ogJ4Bk5nEeAB5Gab9
 eKjhZ2kCu+OF+WxKxTcZS4JzdCnid/OFdlCYHGXwMKUmNX0KiH6c59GOxnPIywjQtGJ7
 q3t4wfljiL1pDcy3xYYD8X74KLcv4f4ye8eaJKCAu1odY5VIdGEpZpynU4CFT5cQ/29g
 8Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2JZqR0i/JdHzlo2N0O5iv47UdeBCMAlYPD3+f7e0zJE=;
 b=CUM7pGMaI3nVFk1XQOaSdGahTFgqek1bK080TW9N6zK5X3JF9cK2+RhM3JvxIuUrkA
 0p8EPR9arNB4Wsx6Jh3mYwr90usHtFrvGm+qJOm9hcGrD24I8mnyZTZIg5u8Rdxi8oUw
 1y4w+75fXW9wywWMTx1zuESpmBIIcBKs3UKxxJhEn4qCtG/h0v5f/gzLZbeDdtueyP5j
 Sxg1yAe5l3pPHZK1Y5KCpzH+5sexbPI1RSLuA8nIzjeuLSHznXQvK0YYNMjkcm2Zch1D
 I/OUseGRgjTJIlMEgBRCTambBwIwCPthSoC9H49AsybUpw+FiJ7cp1ZGXwXin3kgSLgr
 rQ+g==
X-Gm-Message-State: AOAM533nrmCTFgsTzi0sikrM9A3mZCqjSh34zVti3wfxkygpmov9VS9h
 yH8EedPYIfdkJSs4rtEvd5KrGraGvvr0JA==
X-Google-Smtp-Source: ABdhPJzNiN8exB32Ne7PK0843LR/mcb5OrhGwTSuM6xMAC57p9PaPf1CDSkNc5mhCT5Vk6bU05y23w==
X-Received: by 2002:a05:6402:5256:b0:416:97d1:a6a2 with SMTP id
 t22-20020a056402525600b0041697d1a6a2mr6176176edd.280.1646946204782; 
 Thu, 10 Mar 2022 13:03:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056402271200b0041697d1a691sm2424250edd.33.2022.03.10.13.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:03:24 -0800 (PST)
Message-ID: <c5548e2e-8cd5-141e-3f8a-060127e43540@mind.be>
Date: Thu, 10 Mar 2022 22:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, John Keeping <john@metanate.com>
References: <20220310140350.1955655-1-john@metanate.com>
 <20220310213840.32655ec7@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310213840.32655ec7@gmx.net>
Subject: Re: [Buildroot] [PATCH] package/openssh: backport upstream fix for
 32-bit
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/03/2022 21:38, Peter Seiderer wrote:
> Hello John,
> 
> thanks for the patch, some minor nitpicks...
> 
> Better patch subject would be:
> 
> 	package/openssh: add upstream patch to add seccomp ppoll_time64 support

  Applied to master with this changed.

> 
> On Thu, 10 Mar 2022 14:03:50 +0000, John Keeping <john@metanate.com> wrote:
> 
>> sshd is broken on 32-bit systems because ppoll_time64 is used by the
>> application although it is not allowed by the seccomp filter.
>>
>> Apply the upstream patch to fix this.
> 
> Better:
> 
>    -add upstream patch ([1] to add seccomp ppoll_time64 support

  Since the subject now already says that it adds seccomp ppoll_time64 support, 
this is redundant. Since I'm lazy :-), I didn't change this.

> 
> [1] https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch

  There's already a reference to the upstream commit in the patch itself, so 
this is not really needed.

> 
>>
>> Signed-off-by: John Keeping <john@metanate.com>
>> ---
>>   ...llow-ppoll_time64-in-seccomp-sandbox.patch | 31 +++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>   create mode 100644 package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
>>
>> diff --git a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
>> new file mode 100644
>> index 0000000000..34b309bd9a
>> --- /dev/null
>> +++ b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
>> @@ -0,0 +1,31 @@
>> +From 284b6e5394652d519e31782e3b3cdfd7b21d1a81 Mon Sep 17 00:00:00 2001
>> +From: Darren Tucker <dtucker@dtucker.net>
>> +Date: Sat, 26 Feb 2022 14:06:14 +1100
>> +Subject: [PATCH] Allow ppoll_time64 in seccomp sandbox.
>> +
>> +Should fix sandbox violations on (some? at least i386 and armhf) 32bit
>> +Linux platforms.  Patch from chutzpahu at gentoo.org and cjwatson at
>> +debian.org via bz#3396.
>> +
> 
> Missing:
> 
> [Upstream: https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch]

  Except for the signoff, the patch is literally the upstream patch, including 
the sha1 in the From line. So an upstream reference is not really needed. Still, 
it's useful so I overcame my laziness and added it.

  Regards,
  Arnout


>> +Signed-off-by: John Keeping <john@metanate.com>
>> +---
>> + sandbox-seccomp-filter.c | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
>> +index 2e065ba3..4ce80cb2 100644
>> +--- a/sandbox-seccomp-filter.c
>> ++++ b/sandbox-seccomp-filter.c
>> +@@ -276,6 +276,9 @@ static const struct sock_filter preauth_insns[] = {
>> + #ifdef __NR_ppoll
>> + 	SC_ALLOW(__NR_ppoll),
>> + #endif
>> ++#ifdef __NR_ppoll_time64
>> ++	SC_ALLOW(__NR_ppoll_time64),
>> ++#endif
>> + #ifdef __NR_poll
>> + 	SC_ALLOW(__NR_poll),
>> + #endif
>> +--
>> +2.35.1
>> +
> 
> With this fixed you can add my
> 
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> 
> Regards,
> Peter
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
