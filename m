Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A4AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD378268F;
	Sun, 27 Mar 2022 15:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljFMWugkOReC; Sun, 27 Mar 2022 15:58:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F34CA81D7C;
	Sun, 27 Mar 2022 15:58:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B33E1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79BFB4087B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncJ_WoXyEeYS for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:58:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A23140876
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:58:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p15so24041957ejc.7
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gvZj9LO9+1gj7bIG6bB8aZhwzMJAykZNMJx3J486qAE=;
 b=D9Bi6P7si03nvdUQcmwXruaJ8xIkGULKJjZBS3BxMYCM3I0WONZykJKvVMfiiN6RR/
 92ksmHGTqnPbcV4LVMgE2WOBfygUiRQ8UWnvs9j394GiUC9eUmabhdc1HoUSd+izBlnw
 JkmiO1ALER48VU+BDFP3KR6LRJFgPKM5cYM7UdXr5czUJAD6ueZ2d6NohoO8KB0ugaCW
 8iOida1aI+04XL6f5v0t01Ltt6omEfNBGOVcVRghAEoaPoMEzXRvZX3qVFZ7UbU4EJq/
 PpLavZ7LvI9IXsSqMVLEcn9TAHmPA4/Eoe1loB9zmu8hYcbI7AJmEMQKTwwaNbVgxEoi
 oOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gvZj9LO9+1gj7bIG6bB8aZhwzMJAykZNMJx3J486qAE=;
 b=FkMzSXRAyjhNPwORjNjT9cVD4V0gaX3b5WOomp2CCTN4ppanUc1tTyEEm4FutU05ZK
 d+UBxb7DeK1MnVeGX+SuH1rT9egEeyPEpAxR/p/CEkYyy2IItvk1/guibHACR2mhKlSq
 tfhj5MvIoT7WkfwhDtP72xpPR4Wt9ZoRFdL6C0A8HYlvQpLbnoV8Eiu319YpVbBdkdFo
 bBcZiJ03jRjoQukVVLgdfLl+ANXfyAav61dhFs46/sAgRaH6ArB12NTsmLSVLMh2Qk7R
 PvbBFLKoz6RL7mhp1iT60YzuClRuvQIw6GvU7Ct9NTVul5LV3YmXj7jf2G0afzi8VcBq
 wTrw==
X-Gm-Message-State: AOAM530k0cqOJLSOaLTWX47CS3z4X/Aqoclz/97Xm7fftoS9ElYTlnDH
 mkFVOAE0xlgmyyeHZ+bqSeVQmQ==
X-Google-Smtp-Source: ABdhPJz4TPYD3IhXN6wiCFaEttQYfQ67mzyMTZkJzCrz0Aj8z6yTjKDY/Th/IgM4+bQXaoQR32PD5A==
X-Received: by 2002:a17:906:e87:b0:6df:8602:5801 with SMTP id
 p7-20020a1709060e8700b006df86025801mr23154206ejf.140.1648396699791; 
 Sun, 27 Mar 2022 08:58:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a0564021e8600b00412ae7fda95sm5864683edf.44.2022.03.27.08.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:58:19 -0700 (PDT)
Message-ID: <92f06b08-13dd-5124-982a-a17faf3d4158@mind.be>
Date: Sun, 27 Mar 2022 17:58:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220320171259.1591428-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220320171259.1591428-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/json-glib: bump to version 1.6.6
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



On 20/03/2022 18:12, Fabrice Fontaine wrote:
> - Update introspection option:
>    https://gitlab.gnome.org/GNOME/json-glib/-/commit/461edcc8cd6dc1c4efeb09aaaba02459293546f2
> - Disable docs (enabled by default since
>    https://gitlab.gnome.org/GNOME/json-glib/-/commit/8d6176451f9d7cd4d6660185c679733aee3b57ea)
> - Disable tests (added by:
>    https://gitlab.gnome.org/GNOME/json-glib/-/commit/8e835f8ed2299ad68032432eaf6491b2da8d532b)
> - Update indentation in hash file (two spaces)
> 
> https://gitlab.gnome.org/GNOME/json-glib/-/blob/1.6.6/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/json-glib/json-glib.hash | 6 +++---
>   package/json-glib/json-glib.mk   | 9 +++++----
>   2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
> index b68794db37..680d404a4b 100644
> --- a/package/json-glib/json-glib.hash
> +++ b/package/json-glib/json-glib.hash
> @@ -1,5 +1,5 @@
> -# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.4/json-glib-1.4.4.sha256sum
> -sha256 720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47  json-glib-1.4.4.tar.xz
> +# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.6/json-glib-1.6.6.sha256sum
> +sha256  96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e  json-glib-1.6.6.tar.xz
>   
>   # Hash for license file:
> -sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
> +sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
> diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
> index accdb4f888..52ca47e906 100644
> --- a/package/json-glib/json-glib.mk
> +++ b/package/json-glib/json-glib.mk
> @@ -4,13 +4,14 @@
>   #
>   ################################################################################
>   
> -JSON_GLIB_VERSION_MAJOR = 1.4
> -JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).4
> +JSON_GLIB_VERSION_MAJOR = 1.6
> +JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
>   JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
>   JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
>   JSON_GLIB_LICENSE = LGPL-2.1+
>   JSON_GLIB_LICENSE_FILES = COPYING
>   JSON_GLIB_INSTALL_STAGING = YES
> +JSON_GLIB_CONF_OPTS = -Dgtk_doc=disabled -Dtests=false
>   
>   JSON_GLIB_DEPENDENCIES = \
>   	$(TARGET_NLS_DEPENDENCIES) \
> @@ -18,10 +19,10 @@ JSON_GLIB_DEPENDENCIES = \
>   	libglib2
>   
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -JSON_GLIB_CONF_OPTS += -Dintrospection=true
> +JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
>   JSON_GLIB_DEPENDENCIES += gobject-introspection
>   else
> -JSON_GLIB_CONF_OPTS += -Dintrospection=false
> +JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
>   endif
>   
>   JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
