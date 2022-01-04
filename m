Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2737FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB0C9400FB;
	Tue,  4 Jan 2022 18:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1RtuO8NFjCS; Tue,  4 Jan 2022 18:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C61A840236;
	Tue,  4 Jan 2022 18:00:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9432D1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81219400FB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18evnj-eyJk9 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:00:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B38C540236
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:00:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q14so143786275edi.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gH4aIwfYir90YM3h3lpdE2zWJ2osyBf3ybkGHwRJn1A=;
 b=XIcERMo5xDrQnZebRDbZvB58+BAB+14y8iqLuErz6OVN1NmLH/8zhKrlrTUGl7bF2L
 GnzA6waS7sWgSB9avNx0MVWAktgTHb49SEiGvmk8VNG180YXXBVRyiZM+TGz4VndKllP
 SDnM7DFb9ItB/b0MYGXiZ7klpa70ex428MCYKju4QKdMzPfZErMIL89K8iqZRVT57OcE
 QQbgfkTYfOU2Nry3X9x/fV3iaUYrhvaiB6zBVbTfl6D0HTAeDjccyzD6lQHFpCmxkXl1
 leGd7JQXS85aVuJrF4GuBKAr7AG2J98E/9JGrEZVbV6hnz4EC+nZojQl+frw1idnDQ9s
 +h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gH4aIwfYir90YM3h3lpdE2zWJ2osyBf3ybkGHwRJn1A=;
 b=gQQHSaoakri+t5ros7Iu0rroNx6mf1HSEc09uXhvD9JUVsWx95wZ5BQPKAm/HeJDKW
 SkOk0SBWLHGbkecUV0FN5edJ4r5GM/Tnaa3ePdm6isAYgxlXM/ITXxrsbSC91NDs3yPY
 44SbSySIH3i5a3XAlIvKwnBDcWBGR2EUXOztNpGJ8hve2VVrvKvgLUUXN9UVMqdrt5/p
 KyruQcGPt6B5ellMXdZoSFYbYdu7YUAXr5Dmbw/EDRjivtrKRBoAOo3c3cYcMqsUNsPO
 cdyPFVmHAY46q+UoZ/BzXkxG/5JcNT6fqweluq1NLOmq4CTl8EEIGGaYokGOUOFWMYWD
 MFPw==
X-Gm-Message-State: AOAM531q0ovEvCFoR60e9vLP+HOOdygS+kIycd+z+jXWj8OkfouB7kKg
 8E3abNCz7pQOyv3PRCAP16/LLw==
X-Google-Smtp-Source: ABdhPJygWJt2HjlwVJLy5NPLZE3fME5BFPdBFfNqD6KZcFVkTRQkhiqMziLwmht2If23C4aw168sZw==
X-Received: by 2002:a17:907:96a6:: with SMTP id
 hd38mr39918989ejc.479.1641319201967; 
 Tue, 04 Jan 2022 10:00:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id oz7sm11611483ejc.81.2022.01.04.10.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:00:01 -0800 (PST)
Message-ID: <05f28cff-efc0-0ac8-4219-055c39a807f3@mind.be>
Date: Tue, 4 Jan 2022 19:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220102174501.2824124-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102174501.2824124-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: fix uclibc-ng build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2022 18:45, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of the package
> in commit 663f39c88c01593855c18355a4decdceeffd884b:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../libfreeipmi/.libs/libfreeipmi.a(libfreeipmi_la-ipmi-kcs-driver.o): in function `_ipmi_kcs_test_if_state':
> /home/buildroot/autobuild/instance-1/output-1/build/freeipmi-1.6.8/libfreeipmi/driver/ipmi-kcs-driver.c:537: undefined reference to `inb'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/13f58266f7747c183033c811a4e8ca6fa30b6f4d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0002-check-for-inb-and-outb.patch         | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 package/freeipmi/0002-check-for-inb-and-outb.patch
> 
> diff --git a/package/freeipmi/0002-check-for-inb-and-outb.patch b/package/freeipmi/0002-check-for-inb-and-outb.patch
> new file mode 100644
> index 0000000000..3bc006acc7
> --- /dev/null
> +++ b/package/freeipmi/0002-check-for-inb-and-outb.patch
> @@ -0,0 +1,50 @@
> +From 47249279f3ef2c1fcfc312294f1c98c35232aed0 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 2 Jan 2022 10:37:00 +0100
> +Subject: [PATCH] check for inb and outb
> +
> +Check for inb and outb before using them to avoid the following build
> +failure on uclibc-ng:
> +
> +/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../libfreeipmi/.libs/libfreeipmi.a(libfreeipmi_la-ipmi-kcs-driver.o): in function `_ipmi_kcs_test_if_state':
> +/home/buildroot/autobuild/instance-1/output-1/build/freeipmi-1.6.8/libfreeipmi/driver/ipmi-kcs-driver.c:537: undefined reference to `inb'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/13f58266f7747c183033c811a4e8ca6fa30b6f4d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/50]
> +---
> + configure.ac                         | 2 +-
> + libfreeipmi/driver/ipmi-kcs-driver.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 711b27674..bcc4156ff 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -476,7 +476,7 @@ AC_CHECK_FUNCS([memcpy mempcpy memset mlock])
> + AC_CHECK_FUNCS([getline getprogname])
> + AC_CHECK_FUNCS([strerror strerror_r])
> + AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
> +-AC_CHECK_FUNCS([iopl])
> ++AC_CHECK_FUNCS([inb iopl outb])
> + AC_CHECK_FUNCS([asprintf])
> + AC_CHECK_FUNCS([cbrt])
> + AC_CHECK_FUNCS([getmsg putmsg])
> +diff --git a/libfreeipmi/driver/ipmi-kcs-driver.c b/libfreeipmi/driver/ipmi-kcs-driver.c
> +index c212887c0..a9d4b2e96 100644
> +--- a/libfreeipmi/driver/ipmi-kcs-driver.c
> ++++ b/libfreeipmi/driver/ipmi-kcs-driver.c
> +@@ -162,7 +162,7 @@
> + #if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
> + # define _INB(port)  inb (port)
> + # define _OUTB(data, port)  outb (port, data)
> +-#elif defined(HAVE_IOPL)
> ++#elif defined(HAVE_INB) && defined(HAVE_OUTB)
> + # define _INB(port)  inb (port)
> + # define _OUTB(data, port)  outb (data, port)
> + #else
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
