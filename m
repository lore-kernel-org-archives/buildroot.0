Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63EFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62FFC83260;
	Tue,  1 Feb 2022 21:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qah_luOr0SBm; Tue,  1 Feb 2022 21:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 909788322A;
	Tue,  1 Feb 2022 21:46:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A47CD1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92C028322A
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16cQ777BWRFl for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 21:46:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 313B283227
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 21:46:23 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p12so37330440edq.9
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 13:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p0nIYyuNeAxS4J4Rx1UJOxf1YFY1MTT9j/JVcOGpCfo=;
 b=PEib+canngOdfsWZt8j6od0vNH42mwOQjWqF+hScn1KZPJqVjcLHQEW2sRu9Q/QFTk
 yHPtVdn0CUO3eb0zjNgrp9n7ErkIIs1SppYNrHQ9NsEiVoQSSNNUJ8Mvz1vZJoQYQgbd
 ZV0lbJeg+boQzv+b71qvhWcwQm4MskPhhVWL9uO4hsHkc8CaMLsP9gjpFD3KpHb4byl1
 /MNlHewhBo0EJE0e/ruKI3WKmrBEMpQ4tUTqYmRFZWi9J14IWCfINXIXgZQS17XCmkaE
 +SaWdLl7FR0GC9xHbzcSBjRiJ8pGj1Ql+Hm6BM9rqKQmsAdf8VBFY49q02fJMJba/5Xu
 +uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p0nIYyuNeAxS4J4Rx1UJOxf1YFY1MTT9j/JVcOGpCfo=;
 b=Bm7WMs9mZdvJu3yyYjjGIU5XKZWyWUCdG6w387eBgDkMgy/Dag3mIDTE8iebVL7Ow9
 8tyPcsANr51xK2iMbvJwfMOKNQeQ+/dIeechlWDxgykUlyHTeEPqU54tLkpM8h74tJHh
 e7iinTfALmrhijQvpUISrS29mqr5v0MmMfQFcRcj3twNk5itUqxsURGnf2F5xGJHccbR
 Erz/ubxx3X+qj9UNzwFfferl/IbAu1fk3+5kB4wpYpMmHgAlaKMd8P+eIi6Cyr4LDQjq
 nAMbJdxaaC0VaMMH4ZBdEm8PrPe0GPN+hmdlDUEawAKs9ioDL1ztJk4H1xHgnQsto2il
 bS0g==
X-Gm-Message-State: AOAM5302HMTc7dgdvER6S0Oe2FZwPVoHQxgO5knXSUxSc8eoxirpVjnX
 5NtaTw3J8JkuOLdAPEHYf10gIQ==
X-Google-Smtp-Source: ABdhPJwmdYfVd7y/lvCKG0mC1AA4P5rDptbBkzfKrVLEBUbA46e1X6qmWf8hfBJKkc18lRfDS47T2Q==
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr26825324edo.131.1643751981474; 
 Tue, 01 Feb 2022 13:46:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bx18sm16666809edb.93.2022.02.01.13.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:46:21 -0800 (PST)
Message-ID: <e94e8288-9585-8f02-8e30-fb88dc7a13c5@mind.be>
Date: Tue, 1 Feb 2022 22:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220115150610.2084070-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220115150610.2084070-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: fix build with libexecinfo
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2022 16:06, Fabrice Fontaine wrote:
> Fix the following build failure raised on uclibc and musl since the
> addition of libexecinfo package in commit
> eea8ba446c10701a273432552108d80fb2224ef4:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: tests/fs-tests/integrity/integck-integck.o: in function `check_failed.constprop.0':
> integck.c:(.text+0x96c): undefined reference to `backtrace'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9409ebf6517db87672f3f4df5909a8ac4abfe8af
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mtd/mtd.mk | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 9f4cc27ef1..45e7c0c61c 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -13,6 +13,15 @@ MTD_CPE_ID_VENDOR = mtd-utils_project
>   MTD_CPE_ID_PRODUCT = mtd-utils
>   MTD_INSTALL_STAGING = YES
>   
> +MTD_LDFLAGS = $(TARGET_LDFLAGS)
> +
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +MTD_DEPENDENCIES += libexecinfo
> +MTD_LDFLAGS += -lexecinfo
> +endif
> +
> +MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
> +
>   ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
>   MTD_DEPENDENCIES += zlib lzo host-pkgconf
>   MTD_CONF_OPTS += --with-jffs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
