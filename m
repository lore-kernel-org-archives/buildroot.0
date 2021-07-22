Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57768C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:15:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF07760E8F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF07760E8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1FBC605D2;
	Thu, 22 Jul 2021 21:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZS8t7HArZEk; Thu, 22 Jul 2021 21:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF73606DD;
	Thu, 22 Jul 2021 21:15:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DE1B1BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D725835A6
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGLoDUb5LMj1 for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 21:15:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D8688356C
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 21:15:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gt31so474583ejc.12
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 14:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WfDCNr/exBAx03wEcuzNcHecHZBSMdIpDv1oJKLcRJw=;
 b=AbwYRrWYW13bw57KKEWwUxwKBvhzxY3KwPpXgpNWsWMgI2xdGkop2ZlOgpZ/Rvwlrd
 zaKqzdJDg1gZ7kjm1of0pIKkzknWvLzv+I9Dzb2zRAYS+DaaEf0nSVMnC9Gl/sd0HStL
 a5Qc6vt+fKPA6zkhYZVoMdMBWTSBzEKwoSAssAeYasajJu3bhX2bVTSwTNQCgVjE8dds
 u6C/fRj6leIBPP6LgPOrWxaXsjF9GDqgolQj+UrOxym1vmzlbPso3q1LvlcL7qIFMpcA
 bDFcBLtHX/GsSlCSv+i5D2USD51AksyHDwUH+l0n5L1pDx+vBMGPx86h2Doyr4IGdNEO
 3axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WfDCNr/exBAx03wEcuzNcHecHZBSMdIpDv1oJKLcRJw=;
 b=Cj72i+Np/34kCim4JQV174/t0O/SuNchqKxIZgiIfNf6RcBtHwqrdbXfPe1vcOhd4I
 /s4Veb+XveS3SqKaVhSeL06hB+D3MvNAnqwRbb/7C9nv5fGe1VyU1ISolafJEwtdaPpx
 WQfDe8IszoK1L3NmfgBl1wZduUb5V3JuTIn1jkol5FZV8drV7FjjhF/ECAg7AuV3TqI6
 TrIN7hrUolwCBJyvQfdPgNyyAsp96HnWkrpbtf0LTvnApPjkL1pxjk5aCqzGxI4m2EWQ
 Z1a5Mn5ZUaw2aIzQY47qTliVPTcA49Kg7JRBuAOVmIpgVqS9rqAHIfF5sFwsGZXseQVK
 L1Qg==
X-Gm-Message-State: AOAM531g/QBD+jCZJMxkyKzw4pCsVYLC6UjdZ3FpljLJgJIwEzVTBc0h
 B1uT5mxF+SdhDASCic+w5OOA6Q==
X-Google-Smtp-Source: ABdhPJwVU/tFqywPCsuMdcdY2TrYDHq4VgxX6UPQGVMuaGPA/PgyWfEcgvaZOMZE0/0h1qjJ0y8Tdg==
X-Received: by 2002:a17:907:a072:: with SMTP id
 ia18mr1691734ejc.72.1626988527162; 
 Thu, 22 Jul 2021 14:15:27 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dd24sm13063865edb.45.2021.07.22.14.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 14:15:26 -0700 (PDT)
To: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@busybox.net
References: <20210611140732.47283-1-jared.bents@rockwellcollins.com>
 <20210611140732.47283-3-jared.bents@rockwellcollins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d33c762f-a51b-a531-6ace-222df4f675ab@mind.be>
Date: Thu, 22 Jul 2021 23:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611140732.47283-3-jared.bents@rockwellcollins.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v9 3/3] package/libvirt: add lxc and qemu
 options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 11/06/2021 16:07, Jared Bents wrote:
> Update to add lxc and qemu options for libvirt under the daemon
> config option
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> 
> --
> History:
> v8:
>   - Split off from patch adding libvirt
> 
> v8->v9:
>   - N/A
> ---
>  package/libvirt/Config.in  | 36 +++++++++++++++++++++++++++++++++++
>  package/libvirt/libvirt.mk | 39 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index ae5c8aac8a..ef9c10655f 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -42,6 +42,42 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
>  	  Build the libvirt daemon (libvirtd) otherwise build only the
>  	  utility programs.
>  
> +# Stateful drivers are useful only when building the daemon.
> +if BR2_PACKAGE_LIBVIRT_DAEMON
> +
> +config BR2_PACKAGE_LIBVIRT_QEMU
> +	bool "qemu"
> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12  # libseccomp
> +	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
> +	select BR2_PACKAGE_HWDATA         # libpciaccess
> +	select BR2_PACKAGE_HWDATA_PCI_IDS # libpciaccess
> +	select BR2_PACKAGE_LIBSECCOMP
> +	select BR2_PACKAGE_QEMU
> +	select BR2_PACKAGE_QEMU_SYSTEM if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
> +	select BR2_PACKAGE_YAJL
> +	help
> +	  QEMU/KVM support
> +
> +comment "qemu support needs a toolchain w/ headers >= 3.12"
> +	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12

 This is redundant since libvirt itself already depends on headers >= 3.12. So I
removed the comment entirely.

> +
> +config BR2_PACKAGE_LIBVIRT_LXC
> +	bool "lxc"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # lxc

 This is also implied by headers >= 3.12. I've simplified the comment to just
mention gcc.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
> +	select BR2_PACKAGE_LXC
> +	help
> +	  Linux Container support
> +
> +comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library, gcc >= 4.7"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> +
> +endif
> +
>  endif
>  
>  comment "libvirt needs udev /dev management"
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> index 8cc77f3c0e..22b99a4323 100644
> --- a/package/libvirt/libvirt.mk
> +++ b/package/libvirt/libvirt.mk
> @@ -23,9 +23,7 @@ LIBVIRT_CONF_OPTS = \
>  	-Ddriver_hyperv=disabled \
>  	-Ddriver_interface=enabled \
>  	-Ddriver_libxl=disabled \
> -	-Ddriver_lxc=disabled \
>  	-Ddriver_openvz=disabled \
> -	-Ddriver_qemu=disabled \
>  	-Ddriver_remote=enabled \
>  	-Ddriver_secrets=enabled \
>  	-Ddriver_vmware=disabled \
> @@ -130,6 +128,13 @@ else
>  LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBVIRT_LXC),y)
> +LIBVIRT_CONF_OPTS += -Dlogin_shell=enabled -Ddriver_lxc=enabled
> +LIBVIRT_DEPENDENCIES += lxc

 Is this really a build time dependency? I've applied it as-is though.

> +else
> +LIBVIRT_CONF_OPTS += -Dlogin_shell=disabled -Ddriver_lxc=disabled
> +endif
> +
>  # Can't build nss plugin without network
>  ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBNSS),yy)
>  LIBVIRT_CONF_OPTS += -Dnss=enabled
> @@ -152,6 +157,12 @@ else
>  LIBVIRT_CONF_OPTS += -Dpolkit=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
> +LIBVIRT_CONF_OPTS += -Ddriver_qemu=enabled -Dqemu_user=qemu -Dqemu_group=kvm
> +else
> +LIBVIRT_CONF_OPTS += -Ddriver_qemu=disabled -Dqemu_user=no -Dqemu_group=no
> +endif
> +
>  ifeq ($(BR2_PACKAGE_READLINE),y)
>  LIBVIRT_CONF_OPTS += -Dreadline=enabled
>  LIBVIRT_DEPENDENCIES += readline
> @@ -214,13 +225,29 @@ define LIBVIRT_PERMISSIONS
>  	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
>  	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
>  	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
>  	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
>  	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
>  	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
>  	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
> +	/var/cache/libvirt/lxc                   d  750  root  root  -  -  -  -  -
> +	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
> +	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
>  	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
> +	/var/log/libvirt/lxc                     d  750  root  root  -  -  -  -  -
> +	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
>  	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
>  	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
> +	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -

 As noted, var/cache and var/log are tmpfs by default. Therefore, the init
script should create these directories.

 I've committed it unchanged, though.

 In case it wasn't clear yet: series applied to master, thanks.

 Regards,
 Arnout

>  endef
>  
>  # libvirt may need to create persistent files (e.g. VM definitions) in these
> @@ -231,14 +258,22 @@ endef
>  define LIBVIRT_CREATE_SYMLINKS
>  	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
>  	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
> +	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
>  	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
>  	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
> +	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
>  	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
>  	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
>  endef
>  
>  LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
>  
> +ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
> +define LIBVIRT_USERS
> +	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon
> +endef
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
>  define LIBVIRT_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
