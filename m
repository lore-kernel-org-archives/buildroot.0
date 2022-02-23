Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D57C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E59415EC;
	Wed, 23 Feb 2022 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7GXsVKqKQJe; Wed, 23 Feb 2022 20:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12EDC4156E;
	Wed, 23 Feb 2022 20:25:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 832741BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FBB94156E
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CoPkUax_3HPX for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:24:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B0124156D
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:24:57 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id vz16so54973104ejb.0
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h7lfD1jD1qgK0+Hj4q/KE8UdldXwSQT9jKk9Av59HMM=;
 b=hLL8ojUIMOiGjcEA1wP87pv0LXAEw36fd3tAP+KLOOwBwMHpGLoXZetAOdZ0p2S/9e
 2BfafUPH14dsp9AKHNfre82cI5cIh50wqwj3zyFwFDvGLK+zCAV5H0w+hhVZpqh9wvnt
 abRABO5V/erWl00j+yIFrLR3Yus3Pxe1nUq+/A4MWnTlQ51WDXoflSTAsuDdW3kmn9Zd
 H9nPS0OdGEe363KVRZqI/8RRtpTRukDri1PqjSQa0dNAR8nH1bxVEs6yaP/co6C1RMUh
 3tCM+XfbtqldWMBGogsCIT9b/8emuDpci63KnCRw8eqTat0bhbEZG7VnpN8rbxu8kSxk
 JDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h7lfD1jD1qgK0+Hj4q/KE8UdldXwSQT9jKk9Av59HMM=;
 b=i+KqKealzKq/PkMdWBwimTuuWBSouJkYm1/hXpXpZ8V0M+Uum8CZsWg2eZrwsYTqsE
 r1X0kj21KNc0Zjssnp8Rl1/czDwu+Ub52WX210tu2pClAtRLqgZb+lVfkn+w6iMpX+Nq
 bipnOD7M8GRQG7j6IIs3aLqel7kUFe80aQ9Jrax8dEcARGigpmxIK7H5c73EbIhBbjlG
 k5uwWFWkDMqbuiYgdxxA07bEoNkqy4SY0LDrSrzOHp/7Qt9D+eLj/xllydiqcvNEbuVo
 +v8ssGMDa05LVQXpqdTe5yThogB8LUJNj30varn2x/yE9bCQieEriE+G+lCuz9e1WtFT
 lHcg==
X-Gm-Message-State: AOAM533OAWrVQuJnBUfNdlmL4VWbKyk9nf4gYMWTuNc+HoMlKZg9zuuQ
 /EzZIDyMsPIJq9jxHpop9OQj5A==
X-Google-Smtp-Source: ABdhPJzgEB7Tel4VV7W/C+6fOnCUAXuUCQ5YhEsBQBcXk3eVuGQNmFHkxtSz5xbM9J6wv8z40wYdqA==
X-Received: by 2002:a17:906:6d09:b0:6b9:2e0e:5bdd with SMTP id
 m9-20020a1709066d0900b006b92e0e5bddmr1008975ejr.246.1645647895317; 
 Wed, 23 Feb 2022 12:24:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ka26sm273983ejc.170.2022.02.23.12.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:24:54 -0800 (PST)
Message-ID: <4ed0a044-0d93-8dca-8a13-312c85a5be79@mind.be>
Date: Wed, 23 Feb 2022 21:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220216142213.1472039-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220216142213.1472039-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: set FRR_XREF_NO_NOTE
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/02/2022 15:22, Fabrice Fontaine wrote:
> Set FRR_XREF_NO_NOTE to avoid the following build failures with
> microblazeel, nds32 and xtensa raised since bump to version 8.1 in
> commit ca2753fd47d47e5ad0eec16ea62f7b7f096331b6:
> 
> _clippy.ELFAccessError: virtual address (538157256) not found in program headers
> 
> [...]
> 
> /tmp/ccFGv94v.s:13: Error: can't resolve `__start_xref_array' {*UND* section} - `L0' {.note.FRR section}
> /tmp/ccFGv94v.s:14: Error: can't resolve `__stop_xref_array' {*UND* section} - `L0' {.note.FRR section}
> 
> Here is an extract of
> https://github.com/FRRouting/frr/blob/7347a4859d4b984cea0aef769a16622d3f02e44f/lib/xref.h:
> "FRR itself does not need this note to operate correctly, so if you have
> some build issue with it just add -DFRR_XREF_NO_NOTE to your build flags
> to disable it."

  There's some more text a bit higher up that says that it actually *is* needed 
for "external tools reading xrefs out of an ELF shared library or executable". 
But it seems pretty unlikely that this is going to be an issue in Buildroot 
context. So I just extended the commit message with that and applied to master, 
thanks.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/3cdb50f5e5a1b3f37a6edcd4276fcbf015e28828
>   - http://autobuild.buildroot.org/results/a3cc0b5090a1faa2bca9c8dfe0fec9b6a918ba4d
>   - http://autobuild.buildroot.org/results/694cc65478a82ec93d2074252892036855cdc49d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/frr/frr.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index cc83016f9f..0e6ab7a815 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -17,7 +17,9 @@ FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
>   
>   HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
>   
> -FRR_CONF_ENV = ac_cv_lib_cunit_CU_initialize_registry=no
> +FRR_CONF_ENV = \
> +	ac_cv_lib_cunit_CU_initialize_registry=no \
> +	CFLAGS="$(TARGET_CFLAGS) -DFRR_XREF_NO_NOTE"
>   
>   FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
>   	--sysconfdir=/etc/frr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
