Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4890AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1121405B3;
	Sat, 12 Mar 2022 17:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ArogkRQZ_1TG; Sat, 12 Mar 2022 17:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74563405AA;
	Sat, 12 Mar 2022 17:08:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 914261BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79764401D5
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLka9dQvB2Gs for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:08:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BA60404BF
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:08:40 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h13so14535886ede.5
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=WzuRmg9OGlw/J9TwQEfvCoiSvXZUujJbvgdyo9VeigM=;
 b=dS/kntYxnneJb1PVE5/LUm8ilYvZJMRkc7ekZK+U6cpSTprd6gVqIrtaENLfPbJ1Na
 vbXob5g4rkopxVuiwGD6oHyKAgHQMN/nbk7MtVmNP+7HKAAiqaOQlOHO+QCwE87qpIq2
 56i9WaKA/Ueo2oPaKbn9+igcy7CQILnq3ObaGy/XoxPQUgMhvzMtEt4FxREX9QXBUjOR
 +uICslY6MC15HVNU6dBdzcABj0LvQgxilxCwkun05ws0JE6myro4fVdJvgUxeahw2oD6
 ecDOWPMzK5CRurkCPu6tz94oqKdpi3EljCjFaa8M4BGdaLLpbnq5bxpZRD7pw+6wMjV/
 U63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WzuRmg9OGlw/J9TwQEfvCoiSvXZUujJbvgdyo9VeigM=;
 b=mX/zep4qcc7bgT/YVjhs/EeZMZx15gHdVhhvz/QQSkm/uhxYPmYAzJOQibSZD84aRK
 QfSof6PpSeWvRibHMxc0HskZLOH+eZ9nduzfyRPxyCf/xwGBjKe8Sek5H9xyQ57Y5ptG
 OXYn0I4Zj6NfRA6FqsDz05O1F6lpBRzOa7S/DUGdToZhAkAOg//IYyIBoBcZoujBTCfw
 MNgMvVf+uTaD8nJXI7JKXKk1CvBZWnthCaFqbpeMLqlYLAUL6gkRG21UMKM4hbDC5wLR
 g+Xp6v/NI304/G/M2OIdMM4dF3i7r7MNwpefwVeBeJ24NRDMUbGrvhV2xcEGinpAvmtF
 l+5g==
X-Gm-Message-State: AOAM531vSD7uc7v+dAZXG+9kYgpJEaOf3UpytknYp4ddNU/QNE+9gQpk
 pGYhx/bFX0RdZAAM3802TmraxbJtxZ23Dw==
X-Google-Smtp-Source: ABdhPJyasX6cW2uvOQfOPV1f9z6gZmEkmKqp1Qwb94Rl7mSphbRJAsdDyzHlBSs+qJ4gorLIiDp3MA==
X-Received: by 2002:a05:6402:26cc:b0:416:4189:f65e with SMTP id
 x12-20020a05640226cc00b004164189f65emr13701255edd.228.1647104919216; 
 Sat, 12 Mar 2022 09:08:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a1-20020aa7d901000000b00416217c99bcsm4989855edr.65.2022.03.12.09.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:08:38 -0800 (PST)
Message-ID: <5582b728-f738-a680-d29a-4ab3bb90e237@mind.be>
Date: Sat, 12 Mar 2022 18:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220222205317.3161653-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222205317.3161653-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libnetfilter_conntrack:
 bump to version 1.0.9
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



On 22/02/2022 21:53, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch | 38 -------------------
>   .../libnetfilter_conntrack.hash               |  4 +-
>   .../libnetfilter_conntrack.mk                 |  2 +-
>   3 files changed, 3 insertions(+), 41 deletions(-)
>   delete mode 100644 package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
> 
> diff --git a/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch b/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
> deleted file mode 100644
> index 0b373d9261..0000000000
> --- a/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 93bbd7e56cefc8488a61892b3bf5df63a175d20d Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 12 Apr 2020 14:05:15 +0200
> -Subject: [PATCH] libnetfilter_conntrack.pc.in: add LIBMNL_LIBS to Libs.Private
> -
> -Since version 1.0.8 and commit
> -c1c0f16c1fedb46547c2e104beeaaeac5933b214, libnetfilter_conntrack depends
> -on libmnl so add it to Libs.Private.
> -
> -Otherwise, applications such as dnsmasq will fail to link on:
> -
> -/home/buildroot/autobuild/instance-0/output-1/host/bin/arm-linux-gcc -Wl,-elf2flt -static -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o domain.o dnssec.o blockdata.o tables.o loop.o inotify.o poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lnetfilter_conntrack -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lnfnetlink
> -/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libnetfilter_conntrack.a(api.o): in function `nfct_fill_hdr.constprop.4':
> -api.c:(.text+0x34): undefined reference to `mnl_nlmsg_put_header'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/3fdc2cba20162eb86eaa5c49a056fb40fb18a392
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: commit e94172f09e4d]
> ----
> - libnetfilter_conntrack.pc.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libnetfilter_conntrack.pc.in b/libnetfilter_conntrack.pc.in
> -index 857f993..fbd7132 100644
> ---- a/libnetfilter_conntrack.pc.in
> -+++ b/libnetfilter_conntrack.pc.in
> -@@ -12,5 +12,5 @@ Version: @VERSION@
> - Requires: libnfnetlink
> - Conflicts:
> - Libs: -L${libdir} -lnetfilter_conntrack
> --Libs.private: @LIBNFNETLINK_LIBS@
> -+Libs.private: @LIBNFNETLINK_LIBS@ @LIBMNL_LIBS@
> - Cflags: -I${includedir}
> ---
> -2.25.1
> -
> diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
> index 19520aa3f0..205eecf1f3 100644
> --- a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
> +++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
> @@ -1,5 +1,5 @@
> -# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.8.tar.bz2.sha256sum
> -sha256  0cd13be008923528687af6c6b860f35392d49251c04ee0648282d36b1faec1cf  libnetfilter_conntrack-1.0.8.tar.bz2
> +# From https://www.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.9.tar.bz2.sha256sum
> +sha256  67bd9df49fe34e8b82144f6dfb93b320f384a8ea59727e92ff8d18b5f4b579a8  libnetfilter_conntrack-1.0.9.tar.bz2
>   
>   # Hash for license file:
>   sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
> diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
> index 0a5a94be8f..e10bdd02e9 100644
> --- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
> +++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNETFILTER_CONNTRACK_VERSION = 1.0.8
> +LIBNETFILTER_CONNTRACK_VERSION = 1.0.9
>   LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
>   LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
>   LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
