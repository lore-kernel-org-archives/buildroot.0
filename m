Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B2EC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDA694010C;
	Sun,  5 Feb 2023 12:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDA694010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zlrp_Z1CUVkZ; Sun,  5 Feb 2023 12:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4D204010D;
	Sun,  5 Feb 2023 12:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4D204010D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7891BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9C6C4031E
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C6C4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlxgNOfCX4Lr for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A134030C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84A134030C
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:36:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0F2662003ED;
 Sun,  5 Feb 2023 13:36:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 13:36:23 +0100
Date: Sun, 5 Feb 2023 13:36:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230205123623.GE2960@scaer>
References: <20230205042232.1014672-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205042232.1014672-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675600587;
 bh=NB+j7RTb1qZtTu0qlJc9D4qPbdVwi7ptGtlDfMn3Cn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DpBmfQn/juwrIRNA1pXhaPANTl6WaG/6rIVMQn7pAfkHXyX90hwrbrRjAG7mWJqT2
 mxWOqjyuRUGkDyO/cIypXhobcFJmsgWOqr7pHZNup9qMoy+9kwvdiSxsYKxhNuFbDn
 VcBjjXcR/gI5Y9EHufj4T1sv9XNrREyBzVMW6qwFy9Ub2qbF6plpzsOm01x7vM0e6t
 OGz5BReY/oZN8mgWq3vZSYKid7NJeZRCAwn69LSo51w1tlr53k/vtv/n6dGYezsC8Z
 IN9FqrBj+NOPSBd8VvsN3emoJY+VA0qbngBYrPetUFb4op72T+WKnSJAd3UYxaok0a
 z52bwcesa3dQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DpBmfQn/
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-plugins-bad: add new va
 option
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-02-04 21:22 -0700, James Hilliard spake thusly:
> This option enables va plugin support.
> 
> These plugins are vaapi based encoders/decoders that are eventually
> intended to replace the legacy vaapi plugins.
> 
> Details:
> https://gstreamer.freedesktop.org/documentation/va/index.html
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in         | 11 +++++++++++
>  .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 10 ++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index bcb4cb1545..1e89cd124f 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -629,6 +629,17 @@ comment "uvch264 needs a toolchain w/ threads, wchar, gcc >= 4.9"
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA
> +	bool "va"
> +	depends on !BR2_STATIC_LIBS # libva
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
> +	select BR2_PACKAGE_LIBVA
> +	help
> +	  VA-API new plugin
> +
> +comment "va needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
>  	bool "voaacenc"
>  	select BR2_PACKAGE_VO_AACENC
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index 8f11ce6b37..dfe1f1c9eb 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -745,6 +745,16 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA),y)
> +GST1_PLUGINS_BAD_CONF_OPTS += -Dva=enabled
> +GST1_PLUGINS_BAD_DEPENDENCIES += libva
> +ifeq ($(BR2_PACKAGE_LIBDRM),y)
> +GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
> +endif
> +else
> +GST1_PLUGINS_BAD_CONF_OPTS += -Dva=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=enabled
>  GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
