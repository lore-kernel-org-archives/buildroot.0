Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90C2C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ECB8402E7;
	Sat,  8 Jan 2022 19:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsBsy5GU3LAD; Sat,  8 Jan 2022 19:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B90CE40296;
	Sat,  8 Jan 2022 19:12:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBEEA1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD5C3607C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2rIuEFzS-G8 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:12:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D5F860797
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:12:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k18so18052286wrg.11
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+unW6tsrEN9kLPQRptstO6GxJ+7jvtqEYqmGxVf9qEw=;
 b=Tq9T/4S64iI2qyU8E7LCq4mSmtSIpf2br1bSU/jNL3INFq2WRLGgPgU6m6kMUwdnZ8
 tBsVViPieyg71v03jzpIGCQR7/8V0O7cjuYiLVnhUTj0wanhRySRbW7xyiMc4lYKbBYq
 OcW+FOWCths4f10s/6HH9QEU8Npo31iVApJro6nw4YKlXL0s4mz0Hbkn7iMw55NoPuVh
 XkSYVvU2vmapdEKUJilBfimre0Dq803jeQrqCo/ypEyoB9zXM8G6FyyMzIRbsRQQI4V8
 KEtV6JDzffhWRBLR6EMLu7Jml9/tkk0bH4ino1zP/8JU878g2Wi4+OIrWEE+BbpQUZkS
 M0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+unW6tsrEN9kLPQRptstO6GxJ+7jvtqEYqmGxVf9qEw=;
 b=LX/A/x6PIV47ehP7xgK2uCDC1MpBdSGpJnoNdfSK6y/BnGGiZ+5y3eDguN2YakkeUc
 yJe2uVYFP3QmugA1zXj7Lm9/w1ctGcVUL2Kd+WeA1k2sW9jjXAJpBVzZKtHzUxQRWm6N
 iC8tGGFmXHouDK6J3zYkUXMbFiP53iuyuhh7QW0OdDVDccCH6imKV0o99HUEySt8Nk+N
 MP4sB3NPIWjj1qEWJBkp0CyT5NzFQliMPQEqUTtnBJ89v+osEZD1XUzfWSN68yl9TZUY
 4CM1doWLmIM2eucmplUUwStGV2kHlAk9EgOYN8jaI/N+jf7JyWcnFYBs4L3NP+52k8tz
 TeoA==
X-Gm-Message-State: AOAM533lfnevaL80sP55SPl9ttIFPBmqkwt0fJK4R416pLi+cbvxwOsQ
 gBMuK/KE+w/jyJq94jYRs8AtaAgM9qeML179
X-Google-Smtp-Source: ABdhPJwMFSKZKFhrebFTqaP6IkHqX/cSOAXc4+Hb6G2BtWzgE20OuS4FmaLbjLDKcR3Tw++X9ko1uw==
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr59496655wrz.706.1641669137354; 
 Sat, 08 Jan 2022 11:12:17 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id s1sm1006249wrv.38.2022.01.08.11.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 11:12:17 -0800 (PST)
Message-ID: <8bcace28-352f-1da3-51c6-0de868fa429f@mind.be>
Date: Sat, 8 Jan 2022 20:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
References: <20200825000246.4035-1-joseph.kogut@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200825000246.4035-1-joseph.kogut@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] systemd: ensure tmpfiles.d/legacy.conf
 is installed
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/08/2020 02:02, Joseph Kogut wrote:
> Systemd doesn't install tmpfiles.d/legacy.conf when sysv compatiblity
> isn't enabled. This config sets up /var/lock, which many programs such
> as uboot's fw_printenv/setenv still depend on by default.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

  After all the discussion, I did finally apply to master, thanks.

  For Norbert: we simply have legacy packages that write to /var/lock instead of 
/run/lock. In an ideal world, we'd patch all of them to do the right thing. 
However, that's not realistic. So let's enable this legacy stuff to make sure 
that those legacy packages don't actually write to disk.

  We could indeed instead enable sysv compatibility, for maximum support of 
legacy packages. What exactly would be the effects of that?

  Regards,
  Arnout


> ---
>   package/systemd/systemd.mk | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index e356cb1add..8454993823 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -512,10 +512,18 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
>   	touch $(TARGET_DIR)/etc/machine-id
>   endef
>   
> +# systemd doesn't install legacy.conf without sysv-compat
> +# This config ensures /var/lock is created
> +define SYSTEMD_INSTALL_LEGACY_CONF_HOOK
> +	$(INSTALL) -D -m 0644 $(@D)/tmpfiles.d/legacy.conf \
> +		$(TARGET_DIR)/usr/lib/tmpfiles.d
> +endef
> +
>   SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>   	SYSTEMD_INSTALL_INIT_HOOK \
>   	SYSTEMD_INSTALL_MACHINEID_HOOK \
> -	SYSTEMD_INSTALL_RESOLVCONF_HOOK
> +	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
> +	SYSTEMD_INSTALL_LEGACY_CONF_HOOK
>   
>   define SYSTEMD_INSTALL_IMAGES_CMDS
>   	$(SYSTEMD_INSTALL_BOOT_FILES)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
