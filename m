Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB7EC0219F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F048C4022E;
	Sat, 14 Sep 2024 15:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjwPXAyRkHwk; Sat, 14 Sep 2024 15:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB6834245A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB6834245A;
	Sat, 14 Sep 2024 15:21:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD9E41BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D97E24010C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5LdTsHv_sY0 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36B21404EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36B21404EB
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36B21404EB
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:21:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cb57f8b41so25345265e9.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726327265; x=1726932065;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=evAYrI8durPTmvROnWU3x+IfZDWgGSFHTjpqGJVD5tY=;
 b=H1iETdbVCmZG+erPHDCxnrHOBvdPl2I3EPz05DvKfjHkNkz5QeGsTmEm1yr+p5SL4B
 iIQtqc44HOwhHbwd+YIBXO+fMnxcHZGJ0/tWdOwwAf6LomACFEdUI3LznhqsvGvn3UMN
 /+NIVZlQcJptx/jUqnJS2Dy3Zwbr+CnfwsFLbpAGvu3l3pwOV2X+JhfhH527d4r6vqMi
 Tybjb+mY5W0O0aXxRRrrMu1MDk7jLocpK0MQVI5zBBUIh5LCZCRksrRf6J4/jI7KLjs4
 bqWdWElx7gE7pgmgB2owv33jQzLVCIb+44aSeAFt9/OAk/JlYFkfMAe5hNEPWCzrTC2N
 pn4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7zhKJ4P5AKiz20B1O4gsjvMFEHsYZ9zkNV63JoGAMf70WFRHeob5hz2QgkSFW3eudXqOIN2Ovr5Y=@buildroot.org
X-Gm-Message-State: AOJu0Yy0t9y3ATLR1yEXubrmGA2tVJz427WPXBAWADXgzqZ3jjJvkUUt
 ZOXPqX+txt1X6vUbEsIpGT5QVTmMowrS04fD3lpqrzeGxv4DwzEw5nYmJLkfQ+xOB4L7cItByBe
 QS2TJiA==
X-Google-Smtp-Source: AGHT+IEwv6UstiKm1SarQkBDJlr0PRldrbb0tkknBxIG2ix9KgvLa/7SftH+gQqf1XLLYJsjSqz8EQ==
X-Received: by 2002:adf:e849:0:b0:374:c55c:562 with SMTP id
 ffacd0b85a97d-378d62374acmr5294620f8f.42.1726327264742; 
 Sat, 14 Sep 2024 08:21:04 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e780016asm2087149f8f.85.2024.09.14.08.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 08:21:04 -0700 (PDT)
Message-ID: <b2958571-b301-4ac6-9da3-4f3b2d34b931@mind.be>
Date: Sat, 14 Sep 2024 17:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZswD9wfhJbZprySD@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <ZswD9wfhJbZprySD@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726327265; x=1726932065; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=evAYrI8durPTmvROnWU3x+IfZDWgGSFHTjpqGJVD5tY=;
 b=HsvmiZKyDx+LTUcqLp4k0FOL6/Ly/1nqOkhGncd5MkTmSp5n3s/78RRVi3HyoIGoV3
 qiXWFTF7f2njBdNN6zJOOz32dCTuopJvlkhhSfEeyiOJvc1vG9/B577z7VjpSVbF6XH2
 qyEqCiPs/38t2Vmj1ho0A3XcqD0pwh19Us+oyYSq9xPnLH3EQ/Rf9ZuLVM1z2gkzgVi6
 AQLSegUG2ZYZGB+vBE0vFr3VzJ6nI3yI95LHDqvMd7o7s56EuU7FK9EwT3ZnHdJt4yrb
 acUevt/5wlwe5SlD0Is2zD2JprYlCFZ3Ri9kt6bXQINoQY4B5wtW8MYAjSefCqh3Qp/g
 L2VA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HsvmiZKy
Subject: Re: [Buildroot] [PATCH next] package/evilwm: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/08/2024 06:26, Waldemar Brodkorb wrote:
> Nice small and very fast Xorg windowmanager:
> https://www.6809.org.uk/evilwm/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>   DEVELOPERS                 |  1 +
>   package/Config.in          |  1 +
>   package/evilwm/Config.in   |  9 +++++++++
>   package/evilwm/evilwm.hash |  3 +++
>   package/evilwm/evilwm.mk   | 21 +++++++++++++++++++++
>   package/evilwm/xsession    |  2 ++
>   6 files changed, 37 insertions(+)
>   create mode 100644 package/evilwm/Config.in
>   create mode 100644 package/evilwm/evilwm.hash
>   create mode 100644 package/evilwm/evilwm.mk
>   create mode 100644 package/evilwm/xsession
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2b64ee5c6..8117e485d9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3298,6 +3298,7 @@ N:	Waldemar Brodkorb <wbx@openadk.org>
>   F:	board/qemu/riscv32-virt/
>   F:	configs/qemu_riscv32_nommu_virt_defconfig
>   F:	package/asterisk/
> +F:	package/evilwm/
>   F:	package/fbv/
>   F:	package/libjwt/
>   F:	package/mksh/
> diff --git a/package/Config.in b/package/Config.in
> index 07bd1499d8..77121612db 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -438,6 +438,7 @@ comment "X window managers"
>   	depends on BR2_PACKAGE_XORG7
>   
>   	source "package/enlightenment/Config.in"
> +	source "package/evilwm/Config.in"
>   	source "package/fluxbox/Config.in"
>   	source "package/matchbox/Config.in"
>   	source "package/metacity/Config.in"
> diff --git a/package/evilwm/Config.in b/package/evilwm/Config.in
> new file mode 100644
> index 0000000000..86cc17dc76
> --- /dev/null
> +++ b/package/evilwm/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_EVILWM
> +	bool "evilwm"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	help
> +	  A minimalist window manager for the X Window System
> +
> +	  https://www.6809.org.uk/evilwm/
> diff --git a/package/evilwm/evilwm.hash b/package/evilwm/evilwm.hash
> new file mode 100644
> index 0000000000..7fede9641f
> --- /dev/null
> +++ b/package/evilwm/evilwm.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  d5945b20b12c91db2412fac0dbda3fb9c3ec8debb8e1b109838992b2b1bbe5d4  evilwm-1.4.3.tar.gz
> +sha256  e98134d702e297c35e2b1150918a2b0cffea523f67644fa64e8dbb823fb55986  README
> diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
> new file mode 100644
> index 0000000000..8d9df47e5d
> --- /dev/null
> +++ b/package/evilwm/evilwm.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# evilwm
> +#
> +################################################################################
> +
> +EVILWM_VERSION = 1.4.3
> +EVILWM_SITE = https://www.6809.org.uk/evilwm/dl
> +EVILWM_LICENSE = MIT
> +EVILWM_LICENSE_FILES = README

  What is written there doesn't look like MIT. It's actually 3 licenses stacked 
on each other, and none of them look like any license I can readily recognise. 
So I've changed the license to "evilwm license".

  Applied to master with that fixed, thanks.

  Regards,
  Arnout


> +
> +EVILWM_DEPENDENCIES = xlib_libX11
> +
> +define EVILWM_INSTALL_XSESSION_FILE
> +	$(INSTALL) -m 0755 -D package/evilwm/xsession \
> +		$(TARGET_DIR)/root/.xsession
> +endef
> +
> +EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
> +
> +$(eval $(autotools-package))
> diff --git a/package/evilwm/xsession b/package/evilwm/xsession
> new file mode 100644
> index 0000000000..9892af719d
> --- /dev/null
> +++ b/package/evilwm/xsession
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +exec evilwm -term xterm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
