Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB25C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25493823AB;
	Tue,  4 Jan 2022 16:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hJgc2kqG8hA; Tue,  4 Jan 2022 16:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CA6281D18;
	Tue,  4 Jan 2022 16:44:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D58831BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2ABD40936
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id no-ntCZIJ3hC for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:44:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14EEA4091B
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:44:27 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z29so150729054edl.7
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 08:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Mp7Nh3bo62PwlQMEbyK0vjYlfPXHxFf+4yePH5G5pcY=;
 b=ffwiHIpXNT0IAvb0p6wEFO8dcwrh9lvZeNAWzL00/R8LU717fqYuOENJf7VDzTdugr
 nArZ74asLgNgrorB+eJ9bBPoHeMOP1eXy0W/q6Mnhm0DeC1JMQ+lCDRVMP2tMYeu7Mos
 4Mxf+33jZwXeAD9N0oCnBZp0WTld0ebOaNehmZu1Q/Bdq3qPW3E0dWpMO57e6lcm20ZY
 rFTh0FlU8Xmtrrq5K9Q/G2I4e0k0/vzn/+8dzpjcOpX2aT8W5vdY+OEK9QGtGQ8CE0fQ
 4aEQxBnzWxeVOkhePc2nAhBTpncg6TSKAjhb3BtMAvCexOwBMVh7MvZVOGdD5dsSayxd
 9Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Mp7Nh3bo62PwlQMEbyK0vjYlfPXHxFf+4yePH5G5pcY=;
 b=3xW5WPMw6kN0Tpc+1+mjTMfrQdMw41cCnkFBU8skDCqN16p9FO8m1bao1CeLFZt+ZJ
 j4uRI8VN35xbANiaQF3Dta/mtyRq1rLLqeNksYbATusnHM/0ZMWy2MfFrl1LPjBksmGE
 47L1RN5P0+Xtkg1359s/VOdYCDX7Qnd5p2mpzAOJBMMCZQzPw2wdYjf3zi9Va0bvcfOG
 nFjFF/aXaglYU+V/5LgZjgy67WDbFAAkm6cuS4Gp2f+SaMG6+PT+k3k4h4vMr8DjHnzv
 SMBImBDP2KW6FZB0eXFDQIr/kfCyC3iZr5rZBK8ZYzeSTGFanlJ+Nkza8kvm9TnDtuxw
 0ynA==
X-Gm-Message-State: AOAM530u//K39HN+njA09uoVrrW14/bqpaA9m5Yri8AaPFZikJj47Wj5
 E+Tt/baM1m4LNhO6a9JgU8mZCQ==
X-Google-Smtp-Source: ABdhPJwrFyi68iR2gA3iDP4CTmpdwazSziQ10K81YfHzXZueBgjTIHsPEb6vMgwWYiC1QOiPZj/Bhg==
X-Received: by 2002:a17:907:6e0d:: with SMTP id
 sd13mr39935819ejc.90.1641314665152; 
 Tue, 04 Jan 2022 08:44:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dm6sm11648375ejc.89.2022.01.04.08.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 08:44:24 -0800 (PST)
Message-ID: <f100d926-0abe-f6bb-3f3e-8fb98165711a@mind.be>
Date: Tue, 4 Jan 2022 17:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101140324.1001998-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101140324.1001998-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/collectd: add ipmi support
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 15:03, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/collectd/Config.in   | 11 +++++++++++
>   package/collectd/collectd.mk |  4 +++-
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 05fb577345..5e5dff6fe1 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -312,6 +312,17 @@ config BR2_PACKAGE_COLLECTD_IPC
>   	  IPC counters: semaphores used, number of allocated segments
>   	  in shared memory and more.
>   
> +config BR2_PACKAGE_COLLECTD_IPMI
> +	bool "ipmi"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_PACKAGE_OPENIPMI
> +	help
> +	  Read hardware sensors from servers using the Intelligent
> +	  Platform Management Interface (IPMI).
> +
> +comment "ipmi needs a toolchain w/ NPTL"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +
>   config BR2_PACKAGE_COLLECTD_IPTABLES
>   	bool "iptables"
>   	select BR2_PACKAGE_IPTABLES
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index d01058471d..9d6f630fe3 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -18,7 +18,7 @@ COLLECTD_SELINUX_MODULES = apache collectd
>   # These require unmet dependencies, are fringe, pointless or deprecated
>   COLLECTD_PLUGINS_DISABLE = \
>   	apple_sensors aquaero ascent barometer dpdkstat email \
> -	gmond hddtemp intel_rdt ipmi java lpar \
> +	gmond hddtemp intel_rdt java lpar \
>   	madwifi mbmon mic multimeter netapp notify_desktop numa \
>   	oracle perl pf pinba powerdns python routeros \
>   	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
> @@ -88,6 +88,7 @@ COLLECTD_CONF_OPTS += \
>   	$(if $(BR2_PACKAGE_COLLECTD_INFINIBAND),--enable-infiniband,--disable-infiniband) \
>   	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
>   	$(if $(BR2_PACKAGE_COLLECTD_IPC),--enable-ipc,--disable-ipc) \
> +	$(if $(BR2_PACKAGE_COLLECTD_IPMI),--enable-ipmi,--disable-ipmi) \
>   	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),--enable-iptables,--disable-iptables) \
>   	$(if $(BR2_PACKAGE_COLLECTD_IPVS),--enable-ipvs,--disable-ipvs) \
>   	$(if $(BR2_PACKAGE_COLLECTD_IRQ),--enable-irq,--disable-irq) \
> @@ -174,6 +175,7 @@ COLLECTD_DEPENDENCIES = \
>   	$(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),jansson) \
>   	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
>   	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
> +	$(if $(BR2_PACKAGE_COLLECTD_IPMI),openipmi) \
>   	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
>   	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
>   	$(if $(BR2_PACKAGE_COLLECTD_LUA),luainterpreter) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
