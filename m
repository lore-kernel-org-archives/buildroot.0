Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F109C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09C89400E3;
	Sat,  8 Jan 2022 18:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_b7fEDedEaH; Sat,  8 Jan 2022 18:29:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF8D240127;
	Sat,  8 Jan 2022 18:29:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 578EA1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46A734042F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGmj8KchyPbe for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:29:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 716B140400
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:29:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a5so14007775wrh.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V5zINhiZN9rZZpRD27KFIdgL1RRiy1UC+XYY4MWluLE=;
 b=Qn0fGuvVCiDo+QhNFGS9l0/ZiwHrJFwqeWFBBVkJQpMU24lg9eQAGsIE4/gOa/RheI
 dVglQSNE8cDLJ32Xn3cTunjnByLvayDMoF3x8oAddzK6zNyv62XsmAERe7UHcDNCFRm0
 NGDlFiWr134YEXObM9k9n4ooUGnQJoBKV+MJCLW0txLC1bm1BIZcUKtJKS3cnX81gART
 GsG73LyH1Qiqvbs9EY4LSKzE9ILkVOt4XdKHsGUDOjNxu7x9wO7NIcdePNDu9eqW4Ez2
 UiyzOWLxwTHsCq0rJpc8cl4OWGaCiyJXXgTab6RffVmNeIfJO9ZvUhOuiluF5ihC6ly3
 KL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V5zINhiZN9rZZpRD27KFIdgL1RRiy1UC+XYY4MWluLE=;
 b=cW6BtzVgygRcbsXSj7inRPui0GqPQfDIJG0x3WtQmfWeJZu3Oe8naLxQPyKhMOTSLP
 hGHnQXHYg+GNN70WcsOH7G9oPRDCDxEn7vTLeWOcnwHyPNtURuf1HK3FKNLoN91Ez3Na
 nbKcysj66yvbOHPQjKJ5u3v5yrpEBIqpu7AHomYPSAtWwQsB3Ng315o+ePHiChcnvhy+
 HYo76HeeHBE+UwnDqeVtwNqc0WDSaD2Bh1zhmvnRecGfccwJuXuzvgvyutSGkoyCQe7g
 vtDm5sfHXZ6l23VI6yhx5K9JzCf0h06tvrHhEixmaV13W+7s+L/BdkAoSDWmSF/Grrwj
 Gnzw==
X-Gm-Message-State: AOAM533dFPfLzWu5RrRC6JKMpdL1TP/ACWnDnwVEdBSjw1tWdBdFWYPo
 fq87Cct2nw7jWKVqwyu0LekdOg==
X-Google-Smtp-Source: ABdhPJxythKXjtWg8JOcN/IqcuJTZ/qV5TCgIMn9tjTCAOpL4LGUU7r3LymbFPrUtnA53J5CMIfLYA==
X-Received: by 2002:adf:e54e:: with SMTP id z14mr10901409wrm.611.1641666540614; 
 Sat, 08 Jan 2022 10:29:00 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id j26sm2474177wms.46.2022.01.08.10.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 10:29:00 -0800 (PST)
Message-ID: <8c4e865d-62e3-7e33-87f2-36547df54a1c@mind.be>
Date: Sat, 8 Jan 2022 19:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20200726202449.7108-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200726202449.7108-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/systemd: pre-create
 directories for services
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
 Adam Duskett <aduskett@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/07/2020 22:24, Norbert Lange wrote:
> various services need directories in /var when they are started,
> and create them if necessary. Creating those before, allows
> those services to start even if /var is read-only.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  I in the end applied this to master, but I think we should instead follow 
Jeremy's suggestion, as I'll explain in the v1 thread.

  Regards,
  Arnout

> ---
> v1->v2:
> -    dont use a new hook, use SYSTEMD_PERMISSIONS
> -    no conditionals, but variables that are set or not
> ---
>   package/systemd/systemd.mk | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index c49922d78f..42da1c889f 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -317,12 +317,14 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
>   SYSTEMD_CONF_OPTS += -Dlogind=true
> +SYSTEMD_LOGIND_PERMISSIONS = /var/lib/systemd/linger d 755 0 0 - - - - -
>   else
>   SYSTEMD_CONF_OPTS += -Dlogind=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
>   SYSTEMD_CONF_OPTS += -Dmachined=true -Dnss-mymachines=true
> +SYSTEMD_MACHINED_PERMISSIONS = /var/lib/machines d 700 0 0 - - - - -
>   else
>   SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=false
>   endif
> @@ -336,6 +338,7 @@ endif
>   ifeq ($(BR2_PACKAGE_SYSTEMD_HOMED),y)
>   SYSTEMD_CONF_OPTS += -Dhomed=true
>   SYSTEMD_DEPENDENCIES += cryptsetup openssl
> +SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/home d 755 0 0 - - - - -
>   else
>   SYSTEMD_CONF_OPTS += -Dhomed=false
>   endif
> @@ -380,12 +383,14 @@ endif
>   ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
>   SYSTEMD_CONF_OPTS += -Dcoredump=true
>   SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
> +SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/coredump d 755 0 0 - - - - -
>   else
>   SYSTEMD_CONF_OPTS += -Dcoredump=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD_PSTORE),y)
>   SYSTEMD_CONF_OPTS += -Dpstore=true
> +SYSTEMD_PSTORE_PERMISSIONS = /var/lib/systemd/pstore d 755 0 0 - - - - -
>   else
>   SYSTEMD_CONF_OPTS += -Dpstore=false
>   endif
> @@ -436,6 +441,7 @@ endif
>   ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
>   SYSTEMD_CONF_OPTS += -Dtimesyncd=true
>   SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - systemd Time Synchronization
> +SYSTEMD_TIMESYNCD_PERMISSIONS = /var/lib/systemd/timesync d 755 systemd-timesync systemd-timesync - - - - -
>   else
>   SYSTEMD_CONF_OPTS += -Dtimesyncd=false
>   endif
> @@ -503,6 +509,19 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
>   	$(SYSTEMD_INSTALL_BOOT_FILES)
>   endef
>   
> +define SYSTEMD_PERMISSIONS
> +	/var/spool d 755 0 0 - - - - -
> +	/var/lib d 755 0 0 - - - - -
> +	/var/lib/private d 700 0 0 - - - - -
> +	/var/log/private d 700 0 0 - - - - -
> +	/var/cache/private d 700 0 0 - - - - -
> +	$(SYSTEMD_LOGIND_PERMISSIONS)
> +	$(SYSTEMD_MACHINED_PERMISSIONS)
> +	$(SYSTEMD_HOMED_PERMISSIONS)
> +	$(SYSTEMD_PSTORE_PERMISSIONS)
> +	$(SYSTEMD_TIMESYNCD_PERMISSIONS)
> +endef
> +
>   define SYSTEMD_USERS
>   	# udev user groups
>   	- - input -1 * - - - Input device group
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
