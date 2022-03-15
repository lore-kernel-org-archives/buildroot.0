Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A868C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A29C4056A;
	Tue, 15 Mar 2022 21:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4C_WCsYJO9c; Tue, 15 Mar 2022 21:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 231D740287;
	Tue, 15 Mar 2022 21:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C46D1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B06C40287
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVllJUwJQruz for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:13:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5432740246
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:13:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r13so279702ejd.5
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+YAhOJmMbD7tGpwx19+7PyAQM6drlb7s6ZPCM4Bf1/8=;
 b=ZFYbXBa05dKAFu+ABQrWp5Uw10jNeP//7Ev5fYjH+TCZ0XWJ2vrakxF6QIKJpunNUg
 wTOXB78eaASrgaW7MQPy48JEb3RvJf6kPdA3q+S7tmIvOTB+vpEO24DtvBexNgC+ESQa
 Yi0ODE70orSHlFzAF20xtMH9MR9Seo9ZX5uSRdq/gKfYr5XMIzYHzg9X7Ys0Fn3CHDSJ
 lczzMrkVWxUX58Vf+wq/W8uuu+o9ebf6hPVzoNdfShEdtnObdQ2P9piiXN6//SxGDLG1
 kZ5bvlHrKIR6+1Y197Z54eyOXSPOMGoJfYZK+/L27uVaaYAEe1q+lCHnqxAx6IlYl4s+
 hEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+YAhOJmMbD7tGpwx19+7PyAQM6drlb7s6ZPCM4Bf1/8=;
 b=lp1mP76HowzRPh4uYLootC0QUaait46pRQVm5omBX4vHMmk5txeH8aI5ZN4S4WOn6W
 vl41n7MQmE0vrufa+y8lBqaOXLnWwh0S22UGfeP0LoSrpCQMGA6qxfq0wBzdUPzA4Inx
 rajQkm4L8URVcE+20n9x+OrBrk9WwTGNgNIbR3rN9GnZwv5VUEZ6SSQEwEwZFyBHMLQr
 ZkkVn+/9GyYSqP0wgvLB2dvHqzyolXg9HTOAcqBtDPL0GCsHka1zix2NSKcj+9H2TpuF
 pj/3SrNdsnV3SMFsStsRZPufuHHGPBac0O/di8XYfRUP/SkyJv9mWIX5ZRGerubOfXEO
 fMiA==
X-Gm-Message-State: AOAM5316M+dFVjpgsUzw+jsQfPKJ5RDIxqbt1VyiIfiWMwOFSJdfK6IX
 eGLZ3yR/eCqDvPx/0r9UMTDfDA==
X-Google-Smtp-Source: ABdhPJwUsU5leoZ51nVGDijTpjax6HfgF79aJT0ZdvmeibCPEvqZfjO8dnRW5Mh3jWIRWLEsAg0Vjw==
X-Received: by 2002:a17:907:7b9f:b0:6d7:a24:8cbd with SMTP id
 ne31-20020a1709077b9f00b006d70a248cbdmr24445526ejc.588.1647378821543; 
 Tue, 15 Mar 2022 14:13:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm56961ejc.161.2022.03.15.14.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:13:41 -0700 (PDT)
Message-ID: <ab7e4eef-a4b0-4479-60c1-d5fd574eabc3@mind.be>
Date: Tue, 15 Mar 2022 22:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220301223416.947624-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220301223416.947624-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/ace: bump to version 7.0.6
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



On 01/03/2022 23:34, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ace/ace.hash | 5 ++++-
>   package/ace/ace.mk   | 4 ++--
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ace/ace.hash b/package/ace/ace.hash
> index 92fd42e131..2387927879 100644
> --- a/package/ace/ace.hash
> +++ b/package/ace/ace.hash
> @@ -1,3 +1,6 @@
> +# From https://download.dre.vanderbilt.edu/previous_versions/ACE-7.0.6.tar.bz2.md5:
> +md5  d1656851619aff15365270ccf2d56c6e  ACE-7.0.6.tar.bz2
> +
>   # Locally Computed:
> -sha256  a28339750620c70cd29a8a7088a4bc6ebaf1ff7ba667498a0279ac97f0e32e01  ACE-7.0.1.tar.gz
> +sha256  4a0cd7da4851f769fddfcf33f663eba4afad824efeff9f59f134c4640ee80216  ACE-7.0.6.tar.bz2
>   sha256  687bf9d16119e0caf6fb5c18214928fd6ea0da10df91e906255b7613af8061d8  COPYING
> diff --git a/package/ace/ace.mk b/package/ace/ace.mk
> index 8df89d8c6f..7299f0d40c 100644
> --- a/package/ace/ace.mk
> +++ b/package/ace/ace.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -ACE_VERSION = 7.0.1
> -ACE_SOURCE = ACE-$(ACE_VERSION).tar.gz
> +ACE_VERSION = 7.0.6
> +ACE_SOURCE = ACE-$(ACE_VERSION).tar.bz2
>   ACE_SITE = http://download.dre.vanderbilt.edu/previous_versions
>   ACE_LICENSE = DOC
>   ACE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
