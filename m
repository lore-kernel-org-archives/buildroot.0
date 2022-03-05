Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34A3C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DCB98142D;
	Sat,  5 Mar 2022 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1igeRnrp2UT8; Sat,  5 Mar 2022 14:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6D1E813F4;
	Sat,  5 Mar 2022 14:50:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A11D11BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EA86408F4
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwfm3HOCgdtx for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:50:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86A59408CD
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:50:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g3so2012432edu.1
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 06:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Stxso0S5aFEjStWk2QupXng5SCSA8KXHE3KftQa1VEs=;
 b=bxYQP9vRvXS4IdBGqO4vPTA2iLx7defDtxzaiLOCP8WVRqc0KhdAPJatbmU3UmthnQ
 XTxgrqUWaTACZsVMRAAEwBt/iT73W/CpLaNVX+Z3l5vC4I/Y59fVzVwUNqh5o9x3k+gH
 zWOXds26TmCVRWCTdwLSWzKr7KATEWE9CogG15NzZh2xjOXjwm4PFXoOuzZb0lDinX51
 C/x0vGnp7kF7rSZBKVkOMMmuXGNCU3uX3EC/Q0iOV/D8shpvx6HkxYH98bVP2Q6GHIg7
 ekMiYMv1wTi/IUpVWRfKvUMqAGpt8XqKTFET78WtlhkkeE5T7nDX/5dX5jVotofAnGPS
 4fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Stxso0S5aFEjStWk2QupXng5SCSA8KXHE3KftQa1VEs=;
 b=QN5oAF16VO+o0tYiqS9X+J2wzGfmj6oIDYYf0bBumRODaSfHj6v0rmuNuLY4+66bCB
 JO/Y6G12GMYPbY6UoUJJ3vrlsYiUNEDDSALNyii5e94JUT/Lwbkuz0S8h0i1+xIZ7D36
 JhMEN+9r3KVQXuOQUYbcNC85JuNXhQFJbqz0eteY32D1MSVD8tjPHmt+US/fgl0E9ekZ
 jo0b/hQjUdbfmt4i753lVw1HhW6tlC4zVn7wW0BrcaFHF5I3dlIDDLf9YRFI6PFespGW
 HtHfY9dLHqg/yjImvi/ul+Gs89dcPAbJbJ7Y3XwtE+v/Zp02dTXwmKES4jyEm0FLJZRt
 XVfg==
X-Gm-Message-State: AOAM530DnX2EHtZURA12BdOREG3Y1JHze35yEqIlAIBo2gUPCOlmPDCq
 avmgky7np9mOOXXDgigyWFZdQw==
X-Google-Smtp-Source: ABdhPJywTmmb435JIxRCEFKX337dAQ8R6xYYU2EkFxMs+VhwpVr9prT1nsjamMuuKcqufrWT/ax60Q==
X-Received: by 2002:a05:6402:5171:b0:415:eed0:664a with SMTP id
 d17-20020a056402517100b00415eed0664amr3252807ede.117.1646491841755; 
 Sat, 05 Mar 2022 06:50:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056402274f00b0041602d6476fsm2089711edd.55.2022.03.05.06.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:50:41 -0800 (PST)
Message-ID: <89896379-d684-bd0d-0017-4c0c5ed14c02@mind.be>
Date: Sat, 5 Mar 2022 15:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220214102959.1740165-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214102959.1740165-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libgee: bump to version
 0.20.5
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



On 14/02/2022 11:29, Fabrice Fontaine wrote:
> Drop patch (already in version) and so autoreconf
> 
> https://gitlab.gnome.org/GNOME/libgee/-/blob/0.20.5/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Bugfix version bump, so applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...le.am-include-Makefile.introspection.patch | 40 -------------------
>   package/libgee/libgee.hash                    |  4 +-
>   package/libgee/libgee.mk                      |  4 +-
>   3 files changed, 3 insertions(+), 45 deletions(-)
>   delete mode 100644 package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
> 
> diff --git a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
> deleted file mode 100644
> index 0906275ae3..0000000000
> --- a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From d771e8ddb5e40f234459966e46880d10f34aaa1a Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 20 Nov 2021 23:57:33 +0100
> -Subject: [PATCH] gee/Makefile.am: include Makefile.introspection
> -
> -Include Makefile.introspection instead of using a custom rule which will
> -result in the following build failure when cross-compiling on buildroot
> -because of missing --includedir:
> -
> -/home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
> -Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> -error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status:
> -https://gitlab.gnome.org/GNOME/libgee/-/merge_requests/8]
> ----
> - gee/Makefile.am | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/gee/Makefile.am b/gee/Makefile.am
> -index 5634bcb..e0d950e 100644
> ---- a/gee/Makefile.am
> -+++ b/gee/Makefile.am
> -@@ -167,7 +167,8 @@ INTROSPECTION_COMPILER_ARGS= \
> - 	-l $(libgee_dlname)
> - Gee-0.8.gir: libgee_0_8_la_vala.stamp
> - Gee-0.8.typelib: Gee-0.8.gir libgee-0.8.la
> --	@INTROSPECTION_COMPILER@ $(INTROSPECTION_COMPILER_ARGS) -o $@ $^
> -+
> -+-include $(INTROSPECTION_MAKEFILE)
> - endif
> -
> - MOSTLYCLEANFILES = \
> ---
> -2.33.0
> -
> diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
> index 72d2c21ced..54a46f954c 100644
> --- a/package/libgee/libgee.hash
> +++ b/package/libgee/libgee.hash
> @@ -1,5 +1,5 @@
> -# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.4.sha256sum
> -sha256  524c1bf390f9cdda4fbd9a47b269980dc64ab5280f0801b53bc69d782c72de0e  libgee-0.20.4.tar.xz
> +# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.5.sha256sum
> +sha256  31863a8957d5a727f9067495cabf0a0889fa5d3d44626e54094331188d5c1518  libgee-0.20.5.tar.xz
>   
>   # Hash for license file:
>   sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
> index 64beef30df..7d8d3d4863 100644
> --- a/package/libgee/libgee.mk
> +++ b/package/libgee/libgee.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBGEE_VERSION_MAJOR = 0.20
> -LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).4
> +LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).5
>   LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
>   LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
>   LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
> @@ -13,8 +13,6 @@ LIBGEE_INSTALL_STAGING = YES
>   LIBGEE_LICENSE = LGPL-2.1+
>   LIBGEE_LICENSE_FILES = COPYING
>   LIBGEE_CPE_ID_VENDOR = gnome
> -# We're patching gee/Makefile.am
> -LIBGEE_AUTORECONF = YES
>   
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>   LIBGEE_CONF_OPTS += --enable-introspection
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
