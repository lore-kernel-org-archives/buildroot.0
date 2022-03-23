Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789D0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BED418E3;
	Wed, 23 Mar 2022 20:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zW9UaIa5Oosl; Wed, 23 Mar 2022 20:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F2D41B7B;
	Wed, 23 Mar 2022 20:26:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 897251BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8392E40FD4
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfARNwFNR3o5 for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:26:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5177440CBE
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:26:05 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id c62so3247582edf.5
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7GXk/+Nd0d7PhDu2qwkTZ86Dhpdfg0lPdVNxvLcn6Jw=;
 b=e+JzV6gAgAKgCyu7/uw/t8uoIPzn2tKfclm9P0+NsgFpsehoMv5tt7A5FRL0sRJ9Pq
 LBFIO56ZtDb4QlPtysndXzw+EJd+5vWzFv+eRTKrvmgRR+srgoVZ1ee3GXNRaXd/4JMs
 YxdFYfnlt3gyNKjDtI21m6j/mXSwE/At9kOCu5KvcfXxOn0qNiAqzZ5oK6n8sW9NVa6m
 cEDYxhhU0Eu08ETrsZaXbHbd/PkUxwwNNW3T/Kdk410uvl6EYn/vE/fziAOLze+jwB3n
 c77ACA+/PfZIu14jxB8Y6FZkD8q9Zrq0vpgBuLG9pxD8VXMprNsYV+me6Ath7k5w9W+Q
 vxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7GXk/+Nd0d7PhDu2qwkTZ86Dhpdfg0lPdVNxvLcn6Jw=;
 b=ECmBSRZtKj2z9UrbOBBMsbF4Bt4Xp5H3+jLTccxgOY5HJgup8it41VxEPOBZZzBVNJ
 DU3g+AgQGfso5ErHjptR2l+LutfOP/bHgmr8wLrq0VkrqR66K6Pi8JcOSzPUcnSb9CXK
 SVzPywdoJI0O8NUTz5meGBUTKQdvqQWeltBhrQ9Cqz4/Du/M7vqRHuGQN4/TjyUmmc8Q
 LnhdPsUGG7XFe+4eEFDU9XrWQ2/awWsxi3FTAPPLaAw39q5KLolbRamQqBDN0Mp5vvfz
 l7fwUfFOzAVT2HXHHHu5CDY+GsMwXJnx50g0kDJE6j5POaQ8UoSzOXk60Q+W7NGOxSZq
 bX3Q==
X-Gm-Message-State: AOAM531XNrwzbRy5I03zG7/LYNAw+uJApF3tdhCw/LAD2/vAsVwKisbl
 u/hpcj6xxdnPzeXD2Qf43E3WFQ==
X-Google-Smtp-Source: ABdhPJxi4cNNXFqxc/4+maSVzW8/DS/jKBtnaESyhJaAhsOL543Z/1Ou+1Uyz1PYpu66zjCp0pVAHg==
X-Received: by 2002:aa7:dc4e:0:b0:419:407b:6bff with SMTP id
 g14-20020aa7dc4e000000b00419407b6bffmr2472587edu.158.1648067163499; 
 Wed, 23 Mar 2022 13:26:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056402440e00b00416046b623csm477835eda.2.2022.03.23.13.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:26:02 -0700 (PDT)
Message-ID: <29dfce7f-a6f5-415b-aaf0-3efca36fa8d8@mind.be>
Date: Wed, 23 Mar 2022 21:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313113333.1125977-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313113333.1125977-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/nbd: security bump to version 3.24
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 12:33, Fabrice Fontaine wrote:
> Fix CVE-2022-26495: In nbd-server in nbd before 3.24, there is an
> integer overflow with a resultant heap-based buffer overflow. A value of
> 0xffffffff in the name length field will cause a zero-sized buffer to be
> allocated for the name, resulting in a write to a dangling pointer. This
> issue exists for the NBD_OPT_INFO, NBD_OPT_GO, and NBD_OPT_EXPORT_NAME
> messages.
> 
> Fix CVE-2022-26496: In nbd-server in nbd before 3.24, there is a
> stack-based buffer overflow. An attacker can cause a buffer overflow in
> the parsing of the name field by sending a crafted NBD_OPT_INFO or
> NBD_OPT_GO message with an large value as the length of the name.
> 
> https://github.com/NetworkBlockDevice/nbd/compare/nbd-3.21...nbd-3.24
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Tag as a security bump and add CVEs
> 
>   package/nbd/nbd.hash | 8 ++++----
>   package/nbd/nbd.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
> index f0df35bc27..f58a89bf9a 100644
> --- a/package/nbd/nbd.hash
> +++ b/package/nbd/nbd.hash
> @@ -1,7 +1,7 @@
> -# From http://sourceforge.net/projects/nbd/files/nbd/3.21/
> -md5  c51c4c500fe1ed84c3d5d5dd2ca71d23  nbd-3.21.tar.xz
> -sha1  88c3296d43d20d7bda97e0f1bab0243a4f6fa880  nbd-3.21.tar.xz
> +# From http://sourceforge.net/projects/nbd/files/nbd/3.24/
> +md5  a6d9e7bbc311a2ed07ef84a58b82b5dd  nbd-3.24.tar.xz
> +sha1  72c59ef5186ae355de6f539a1b348e18cbb8314e  nbd-3.24.tar.xz
>   
>   # Locally calculated
> -sha256  e7688af39d91733bbcd2db08062c44fe503d004e51528740139c44aff6a6bef9  nbd-3.21.tar.xz
> +sha256  6877156d23a7b33f75eee89d2f5c2c91c542afc3cdcb636dea5a88539a58d10c  nbd-3.24.tar.xz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
> index 0a7f08b2cf..f0fb23910e 100644
> --- a/package/nbd/nbd.mk
> +++ b/package/nbd/nbd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NBD_VERSION = 3.21
> +NBD_VERSION = 3.24
>   NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
>   NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
>   NBD_CONF_OPTS = --enable-lfs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
