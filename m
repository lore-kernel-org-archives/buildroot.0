Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7534AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0075D605A5;
	Sat,  8 Jan 2022 19:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFD9wU2aYBym; Sat,  8 Jan 2022 19:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2623E605BE;
	Sat,  8 Jan 2022 19:41:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1141BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 594F04046D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cD3r7ZYtOaie for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:41:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DF7F4043D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:41:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so3241644wme.2
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VxbCzn7TqYUCTTkaWVSIjHFY0EIQj/vd8TQiDGARjpo=;
 b=gOmnYgiL4oM4mC7mFryJXg8T0u8unu6aB1iY+Ayg4F9wYdoJNPZTrcUpBvCz92lVSw
 uvh7DZ9F4VQcKyHDg40BDJQTnlbJ522hSTLMm7gxmcSb1HlE9SyWrUMLNVZSgR32AK8Y
 YGWMsaL97K8VCUiXMhFREeNxIid3MQMgnBi6FhU9N4m/QJoDSaSndq1B10LNR9cmxX0G
 rulokEplGXqU9/I8ZGHFySwfxHwbJnzNAKwJRebFtJ7StalZ7LwftDiPJuELFYQMBIik
 qC04r/kO1PVISGCfnf4HABQlGTVBiMvbs0asQJ/7ntDAVxji4AsL6YCarJYKG00Tq3u+
 E19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VxbCzn7TqYUCTTkaWVSIjHFY0EIQj/vd8TQiDGARjpo=;
 b=YGClWDzEMbHlUZjrT99MyYawmSOc5gPRSGj32JEnkcC9gX7Lic4IBNGB3TO3Jva5IT
 4hEv7vSMdcGYOs7YMBWt9cZI/isTu53frfmlrXwiZMaxiCg0+WuGtqULWn1CLaDwtY45
 2Sn1m5MBY4hoxkXvwb/z8Wmr/vqzTuMFpKDRj0ZASLVjQswG9ASt+MWflNyRh1DiRaQJ
 nKcV9uILwu7Kc+gXQlVvGjQmB6ykgB7bCWnwojNtYo8cg0RU+vB9/uSXfWOXqvfUAaVy
 fBK6lLgf9mOfxEQTytiUr3QZ7YSeE5UEfAIARxYjuMFgMGhtiHAbtvyGQXRYzTNZuN/E
 J0WQ==
X-Gm-Message-State: AOAM533xs7wA9uTcPBg0xx+9eMYO+gj6v5UonZD+K9RQ37lJgZuZZOA4
 15fJiDNm01LWf+dp90K/AToDWvjxv2/YYY1p
X-Google-Smtp-Source: ABdhPJzfjav7sUwqaMyAb5W+NCiNMunuTl1hMONRDj4gIIr6w8dy9w0TkNhWy+SoTEWcT13CEcl/jw==
X-Received: by 2002:a1c:7909:: with SMTP id l9mr11903438wme.143.1641670890240; 
 Sat, 08 Jan 2022 11:41:30 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l26sm2484943wms.24.2022.01.08.11.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 11:41:29 -0800 (PST)
Message-ID: <eae1a293-c218-3527-db3b-cd71c94135b3@mind.be>
Date: Sat, 8 Jan 2022 20:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20201126144745.502228-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20201126144745.502228-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/systemd: add support for
 creating journal catalog DB
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Norbert,

On 26/11/2020 15:47, Norbert Lange wrote:
> journald supports catalog files, or rather a binary database of
> those.
> Functionality added includes:
> 
> -   A config option allows enabling the binary database.
> 
> -   if the option is enabled, the database is built and moved to
>      /usr/share/factory. A symlink is created in /var pointing to
>      that file.
>      If BR2_ENABLE_LOCALE_PURGE is enabled, the catalogs not in the
>      language whitelist are deleted first.
> 
> -   the service normally used for creating the DB during boot,
>      and the catalog source files used as input are deleted.
> 
> The move to /usr/share/factory is helpful for having /usr as whole
> system distribution.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  I was going to apply a second time, but then I noticed that I made some 
comments on v2 [1] that you haven't answered to and I still think they're valid. 
So I've marked this patch as Changes Requested.

  If you respin, please also include in the commit message the additional 
explanations you made in reply to Romain.

  Regards,
  Arnout

[1] https://lore.kernel.org/buildroot/1d09c49a-6d08-1cd7-9785-92b56c17ae06@mind.be/


> ---
> v1->v2:
> -   Moved all logic into systemd.mk
> -   solved the LOCALE_PURGE order that way
> -   use the factory to store the file
> -   option to enable the DB (similar to udev HWDB)
> -   cant be anabled with !ROOTFS_RW, tons of
>      issues with that one
> v2->v3:
> -   use backticks instead of $$()
> -   be more explicit about what happens in
>      SYSTEMD_LOCALE_PURGE_CATALOGS
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   package/systemd/Config.in  | 14 +++++++++++++
>   package/systemd/systemd.mk | 41 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 55 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index ec34478e3d..d576e6035b 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -269,6 +269,20 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
>   
>   	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
>   
> +config BR2_PACKAGE_SYSTEMD_CATALOGDB
> +	bool "enable journal catalog database installation"
> +	depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW # conflicting tmpfiles magic
> +	help
> +	  Build and install the journal catalog database.
> +
> +	  catalog files are used to provide extended and potentially localized
> +	  messages for the journal.
> +
> +	  The original catalog files will be built into a DB at
> +	  /usr/share/factory/var/lib/systemd/catalog/database.
> +
> +	  https://www.freedesktop.org/wiki/Software/systemd/catalog/
> +
>   config BR2_PACKAGE_SYSTEMD_LOCALED
>   	bool "enable locale daemon"
>   	help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index cb12f667d6..ae99c02abf 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -613,6 +613,47 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
>   	$(SYSTEMD_INSTALL_NETWORK_CONFS)
>   endef
>   
> +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> +define SYSTEMD_LOCALE_PURGE_CATALOGS
> +	# go through all files with scheme <basename>.<langext>.catalog
> +	# and remove those where <langext> is not in LOCALE_NOPURGE
> +	for cfile in `find $(TARGET_DIR)/usr/lib/systemd/catalog -name '*.*.catalog'`; \
> +	do \
> +		basename=$${cfile##*/}; \
> +		basename=$${basename%.catalog}; \
> +		langext=$${basename#*.}; \
> +		[ "$$langext" = "$${basename}" ] && continue; \
> +		expr '$(LOCALE_NOPURGE)' : ".*\b$${langext}\b" >/dev/null && continue; \
> +		rm -f "$$cfile"; \
> +	done
> +endef
> +
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_LOCALE_PURGE_CATALOGS
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD_CATALOGDB),y)
> +define SYSTEMD_UPDATE_CATALOGS
> +	$(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
> +	install -D $(TARGET_DIR)/var/lib/systemd/catalog/database \
> +		$(TARGET_DIR)/usr/share/factory/var/lib/systemd/catalog/database
> +	rm $(TARGET_DIR)/var/lib/systemd/catalog/database
> +	ln -sf /usr/share/factory/var/lib/systemd/catalog/database \
> +		$(TARGET_DIR)/var/lib/systemd/catalog/database
> +	grep -q '^L /var/lib/systemd/catalog/database' $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf || \
> +		printf "\nL /var/lib/systemd/catalog/database\n" >> $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf
> +endef
> +
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
> +endif
> +
> +define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> +	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
> +		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/*/systemd-journal-catalog-update.service
> +endef
> +
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> +
>   define SYSTEMD_PRESET_ALL
>   	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>   endef
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
