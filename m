Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18C7C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54066410B7;
	Tue,  4 Jan 2022 17:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kei1eELkPf-7; Tue,  4 Jan 2022 17:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2E740352;
	Tue,  4 Jan 2022 17:13:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEC61BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C18B8267C
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nt4NRPWq8w2H for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:13:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15B1E81412
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:13:19 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id bm14so151109338edb.5
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8cvSzfwsEJvC4dbJwsqkWBAIfLN3FqLHcTymdgJ5wao=;
 b=EoMLAY6LykBB9xWmw7PVIFzT6Bm46QGLi24F0PsT4CiTlh0XPypKcrt0IUlNJpAQsk
 OrwdVybT9fT3MIdLYW4M6nIFj30LsklAyhekirylS8Eviqvo2On6Fth+kTHPcl5EFFLA
 ekmzUpUi9CIAIbZ0nQp5W/0TxFNxFc0FnXKGqFKJwEKro9QjFdtpASNg2u4DQV6MZiz+
 2Gf4jqhYNfoNURYAnPuv2zfN0byeoC6HCnpEAyNAzdch66SyWPUG7k8aUcCslMrgKaOc
 duNK4Y1WfLmHhCbuE76eOyazubl8NIWnTuN+1GaUZH2K2zrbnBFmax3W3gvEkJnL3/AJ
 t0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8cvSzfwsEJvC4dbJwsqkWBAIfLN3FqLHcTymdgJ5wao=;
 b=FICdO6U2XU0pzU4uhMNU31r0teuNqOpD9JfC78lA7+l9kKj498a7w36xbqeGzB0C6c
 1WD2hr+oJ4b/h7MNJ2vZNVfbfOIqnwd4jvbq6B3KARd2A+9PUOg/36S0Vud8tWfiLCy6
 DpPhrbJlSfPpE/CTQ/T7lDsRTrNRCmqU1Id0AIY3zeyI+FRNW7iE8YWwXn+KEtbmnTkU
 GsWlwzOoz8//nR7qxx3DhRmxcaviSKhsbpPoiUC87mn1ZsD96Ck8F1Kl7E5vWs/jpJcM
 8a4lWQnwr1g1IzJhGX3pOT8NkfXQTr3sO4zp4PWYZxjdtYqko8NJsIIJSgfSu/wB6xa+
 656A==
X-Gm-Message-State: AOAM532scWipOEvP6BrJfEv1vY0Gyw+4kFjssVJkfLh5U7vSjhPeCi5b
 dBDS585frOKu2RapxVfHwJ0bp6TpLMV1LQ==
X-Google-Smtp-Source: ABdhPJx5Isn18pUiWy6ja7qrzI4PgxZFyIU1lPQkGAMzCfu3uH1nwujDxrVOYIrRvOS1TngcZYebWQ==
X-Received: by 2002:a17:907:da1:: with SMTP id
 go33mr41291204ejc.280.1641316398272; 
 Tue, 04 Jan 2022 09:13:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cb3sm14896544edb.35.2022.01.04.09.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:13:17 -0800 (PST)
Message-ID: <4cf4ec18-f0eb-e14b-927a-1512157c795b@mind.be>
Date: Tue, 4 Jan 2022 18:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101170938.1866790-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101170938.1866790-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.23
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



On 01/01/2022 18:09, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> https://www.spinics.net/lists/kexec/msg27693.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...move-duplicate-definition-of-ramdisk.patch | 32 -------------------
>   package/kexec/kexec.hash                      |  2 +-
>   package/kexec/kexec.mk                        |  2 +-
>   3 files changed, 2 insertions(+), 34 deletions(-)
>   delete mode 100644 package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
> 
> diff --git a/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch b/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
> deleted file mode 100644
> index 173323bff8..0000000000
> --- a/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 5e7ce27626a44428c01e0e5ab3fe60ef98ca788c Mon Sep 17 00:00:00 2001
> -From: Petr Tesarik <ptesarik@suse.cz>
> -Date: Mon, 26 Apr 2021 15:29:51 +0200
> -Subject: kexec-tools: Remove duplicate definition of ramdisk
> -
> -The ramdisk variable is defined in kexec/arch/ppc/kexec-ppc.c. This
> -other definition is not needed and breaks build with -fno-common.
> -
> -Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> -Signed-off-by: Simon Horman <horms@verge.net.au>
> -[Retrieved from:
> -https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=5e7ce27626a44428c01e0e5ab3fe60ef98ca788c]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - kexec/arch/ppc/kexec-elf-ppc.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/kexec/arch/ppc/kexec-elf-ppc.c b/kexec/arch/ppc/kexec-elf-ppc.c
> -index ad43ad1..4a4886e 100644
> ---- a/kexec/arch/ppc/kexec-elf-ppc.c
> -+++ b/kexec/arch/ppc/kexec-elf-ppc.c
> -@@ -33,7 +33,6 @@
> - static const int probe_debug = 0;
> -
> - unsigned char reuse_initrd;
> --const char *ramdisk;
> - int create_flatten_tree(struct kexec_info *, unsigned char **, unsigned long *,
> - 			char *);
> -
> ---
> -cgit 1.2.3-1.el7
> -
> diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
> index 1cf860d85e..05eb9e3d02 100644
> --- a/package/kexec/kexec.hash
> +++ b/package/kexec/kexec.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
> -sha256  96c97f49ed86049f8b72722cb53e7fe3693e5a4f31e78a3a6249e3d18dac49c2  kexec-tools-2.0.22.tar.xz
> +sha256  aa63cd6c7dd95b06ceba6240a7fdc6792789cada75a655e6714987175224241b  kexec-tools-2.0.23.tar.xz
>   # locally calculated
>   sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
> diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
> index 81d35815d8..b3b4e56546 100644
> --- a/package/kexec/kexec.mk
> +++ b/package/kexec/kexec.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KEXEC_VERSION = 2.0.22
> +KEXEC_VERSION = 2.0.23
>   KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
>   KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
>   KEXEC_LICENSE = GPL-2.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
