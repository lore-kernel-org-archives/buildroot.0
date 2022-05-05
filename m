Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6480DC433FE
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A2041909;
	Thu,  5 May 2022 20:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upsIqAM9Cxbj; Thu,  5 May 2022 20:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A93ED41870;
	Thu,  5 May 2022 20:57:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C0771BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CA9083E9B
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_V3hS3lITFh for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:57:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A09B8336F
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:57:34 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ks9so4522773ejb.2
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=53sztho8GU08gCE9NTsWxAgEogOTqg7cwVIERI75E9M=;
 b=GSK42GOy8wYfFkWN29AJDPu7iT0+PpOQERHPZSBese0vzwrr/m/SUxyYz16VSqfQs5
 IRY8MsSXfxcXZfhGD5maMgwVFg+pwZUMm/up6GBp6SG+Dk1MLuUYUITpDuMQ3kmViFh4
 2jgThVvI9XN17xaZ+v7VX2MLDMBv21SOzVMhL49HPlICPGH+hHBzHPxVVEGzhpuwdmbX
 1C7MLiTZGTv8GjJOBQlKh4DvlOEfmPN4811yuEMDcwJYfjr+U3hfnhQDCaY98aq3HIwc
 NwtXzLY50iL4iYj16Mn1GGZ/rgwfAwX0wR63U7DvUwTwk0k33dR1EfyefxXrljkC7rae
 31YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=53sztho8GU08gCE9NTsWxAgEogOTqg7cwVIERI75E9M=;
 b=mo+4QKMN6wUQkjGRa0OuV+RQaQSSbdQkHFz2Df280m6xwoyI+56AfNVhgFyzcLBiRK
 rhssFyvbaTdEBn46hdq8EWCi+DycoXskfOfJG6WhE+NNcmPZ813sgXmnWpZ85yMF5slo
 ECWD2BqvTHBBAKzch+XaYKF5BjeDRuEllWmW7qdRvXrjcTQrm23RS0SdbN+iJbuZ3HkW
 M3JZ34RTiPyCF+HQLNIEiaiU2wRfTVJmyF+iJRv30YBmsKIgADifEoM1/l7zsvOncVPa
 d8tdy3DZTK9vDr3cGlRXhY5DDyvvgGf9/4NnoTlSjGwnpibsVFMxV1OiE/yUtKr58ppd
 GICg==
X-Gm-Message-State: AOAM532nP4L447LY5Te7gJEOoPeTMMHCKUZ69lVkjkunbflKPWWAzUkc
 ffvd5n4Ua/F7LWFqGAmY3Bz1jg==
X-Google-Smtp-Source: ABdhPJyRclEjjEb0vG+BesV39AdxNG6yPhbRKVVdF9pnsAgDd5q35ET9P3HDk+sTxOwZtPg2904i5Q==
X-Received: by 2002:a17:907:a41f:b0:6f3:e75c:5a77 with SMTP id
 sg31-20020a170907a41f00b006f3e75c5a77mr68869ejc.70.1651784253126; 
 Thu, 05 May 2022 13:57:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a170906244500b006f3ef214dd2sm1148391ejb.56.2022.05.05.13.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:57:32 -0700 (PDT)
Message-ID: <c30dd1d2-4087-edb4-6f62-ffe8d213a48c@mind.be>
Date: Thu, 5 May 2022 22:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220505120138.493950-1-foss+buildroot@0leil.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505120138.493950-1-foss+buildroot@0leil.net>
Subject: Re: [Buildroot] [RFC PATCH] package/libcamera: remove rpath and
 strip debug symbols before signing IPA libs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Quentin,

On 05/05/2022 14:01, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Open-Source IPA shlibs need to be signed in order to be runnable within
> the same process, otherwise they are deemed Closed-Source and run in
> another process and communicate over IPC.
> Buildroot strips debug symbols and sanitizes RPATH in a post build
> process. We need to do the same before signing the IPA shlibs otherwise
> the signature won't match the shlib on the rootfs.
> 
> meson gets rid of rpath while installing so we don't need to do it
> manually.
> However the signing process is also part of the meson install target, so
> we have a chicken and the egg problem. Let's install the libs in the
> target directory (and do a useless signing) to get rid of rpath, then
> strip debug symbols the same way Buildroot does in post build step, then
> re-sign shlibs directly in TARGET_DIR with signing script from
> libcamera.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   package/libcamera/libcamera.mk | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 77381ab3ca..d1303a2ff5 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -104,4 +104,25 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
>   LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
>   endif
>   
> +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> +# same process, otherwise they are deemed Closed-Source and run in another
> +# process and communicate over IPC.
> +# Buildroot strips debug symbols and sanitizes RPATH in a post build process. We
> +# need to do the same before signing the IPA shlibs otherwise the signature
> +# won't match the shlib on the rootfs.
> +#
> +# meson gets rid of rpath while installing so we don't need to do it manually.
> +# However the signing process is also part of the meson install target, so we
> +# have a chicken and the egg problem. Let's install the libs in the target
> +# directory (and do a useless signing) to get rid of rpath, then strip debug
> +# symbols the same way Buildroot does in post build step, then re-sign shlibs
> +# directly in TARGET_DIR with signing script from libcamera.
> +define LIBCAMERA_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(LIBCAMERA_NINJA_ENV) DESTDIR=$(TARGET_DIR) \
> +		$(NINJA) $(NINJA_OPTS) -C $(LIBCAMERA_SRCDIR)/build install
> +	find $(TARGET_DIR) -type f -name "ipa_*.so" -print0 | xargs -0 $(STRIPCMD) 2>/dev/null || true

  You should add --no-run-if-empty to xargs, in case there is no library at all 
(unless you're very sure that doesn't happen). Also, why is the || true needed?

> +	MESON_INSTALL_DESTDIR_PREFIX=$(TARGET_DIR)/usr/lib/libcamera/ $(@D)/src/ipa/ipa-sign-install.sh $(@D)/build/src/ipa-priv-key.pem $(addprefix ipa_,$(addsuffix .so,$(LIBCAMERA_PIPELINES-y)))
> +	MESON_INSTALL_DESTDIR_PREFIX=$(TARGET_DIR)/usr/lib64/libcamera/ $(@D)/src/ipa/ipa-sign-install.sh $(@D)/build/src/ipa-priv-key.pem $(addprefix ipa_,$(addsuffix .so,$(LIBCAMERA_PIPELINES-y)))

  Instead of overriding INSTALL_TARGET_CMDS, you could also do the additional 
steps in POST_INSTALL_TARGET_HOOKS.

  However, I think it may be simpler to do the stripping in a POST_BUILD_HOOK. 
That way, you only need to do the strip; the signing is done in the install 
step, so if we make sure the .so is stripped by then, all should be well, right?

  Finally, there is one little caveat: if the libraries are installed in 
BR2_STRIP_EXCLUDE_DIRS (i.e. if BR2_STRIP_EXCLUDE_DIRS is set to /usr/lib), or 
if they match BR2_STRIP_EXCLUDE_FILES (e.g. if it is set to "ipa_*.so"), then 
the libs would be stripped while they shouldn't be. However, I don't think 
that's a big deal.

  Regards,
  Arnout


> +endef
> +
>   $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
