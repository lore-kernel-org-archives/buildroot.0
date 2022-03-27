Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C34C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEDAE81750;
	Sun, 27 Mar 2022 15:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wv3TJAgm2on; Sun, 27 Mar 2022 15:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB8B81678;
	Sun, 27 Mar 2022 15:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19EF01BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1173F40133
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yelms7m6yj2f for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:44:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6B7840104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:44:32 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id j15so23976531eje.9
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=n/c+UNI1CLQ3vsPzvLix6ckb7QDX4dbJwZjeKgUvD9I=;
 b=a5fHMGLX/lMdUoH+YBPallBcIAYcT85Qpnk7XHXa2Xq+3ZAH253PIkSEMlNjkBj8wb
 arEwAvDM4bBuhP6HPJ1gFGoA9bcEQbiAWpB4i7eoq2Z30TYDg81iFvCr4vlxWq+9Nocq
 6vaXnCjDuAkM0OW0wS6+DQwqmmq/uLm4AokGIoGtyk/U6HAptfcvooy85r9Dhcv9CtdO
 X02CxHA1wm2cyYkG/BlUDDq53T42t952X9BvrVc4zImnOI2TSPQu8ih6A+oKniLZxRj7
 QR1dBwH5JWv/bjfqflzOxklkMAxw0ot1vGrdT/1MQL4QnoFRBYtMIf2pOPLbuV4kGhf5
 33WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n/c+UNI1CLQ3vsPzvLix6ckb7QDX4dbJwZjeKgUvD9I=;
 b=ua5SuUWaU3DjuQZrVA+SL93rYJOpAVUfXfvTJdF4/SLc0PjH0fg0puiiCrwxBfiz3I
 pDb21GrlUmxFSkmdiTRRbUXoZhOksnFNXIpI4QBAHcAh7EyqKcMwsOGZrCysc8tBefJp
 jwiFSQTaHv41cbItcV1VFWH/gb4Zz2QdZooZJs7SYUjmtLTsoV/NIw6omN1lIS8lZo2p
 upXRddMqHTL1DyPRFgZYrS1RRCs5RBcPVGQ2T5lhvoYwJC2OSTBVxQmbWguqhgh5OHRS
 hVk5zRNl9mF4wJezO2Clqt+6qXDIa0Glfu7p+4Eem9RTFesczXK8Bvng7apPSDcffNkF
 RlWQ==
X-Gm-Message-State: AOAM530ajgM/Pgst+ocz209/OZEcKnnuZjsc+zk4BHc5XgDzmZt67AKI
 w1rXHoYS/bDlZJGmL7hWKLJTJQ==
X-Google-Smtp-Source: ABdhPJy5pTpJ51Vq2kNX/ZMjCf4ELZeJrhCo1RnfPsXJAWVhXEgOgYKGtg5e40Mz8FBm9wfyCfzSfw==
X-Received: by 2002:a17:906:32d8:b0:6ce:d850:f79 with SMTP id
 k24-20020a17090632d800b006ced8500f79mr22087392ejk.414.1648395870977; 
 Sun, 27 Mar 2022 08:44:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a1709063a9a00b006e0c272e263sm2307080ejd.71.2022.03.27.08.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:44:30 -0700 (PDT)
Message-ID: <52e0a19f-3d46-7c31-a59a-50abfac8f572@mind.be>
Date: Sun, 27 Mar 2022 17:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220318180713.19051-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220318180713.19051-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pango: drop -Werror=empty-body
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



On 18/03/2022 19:07, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 1.50.5 in
> commit 68b0efbae49a42d0e14d6040e5e7e573d382ff75:
> 
> ../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
> ../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>       ;
>       ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dee/dee3d631474f83b345f22eb26c59a305c32258f8/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...1-meson.build-drop-Werror-empty-body.patch | 47 +++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 package/pango/0001-meson.build-drop-Werror-empty-body.patch
> 
> diff --git a/package/pango/0001-meson.build-drop-Werror-empty-body.patch b/package/pango/0001-meson.build-drop-Werror-empty-body.patch
> new file mode 100644
> index 0000000000..98b6828a63
> --- /dev/null
> +++ b/package/pango/0001-meson.build-drop-Werror-empty-body.patch
> @@ -0,0 +1,47 @@
> +From 1d0f3a8abcb2bb8931d02c136ae957ee2d60094e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 18 Mar 2022 18:55:56 +0100
> +Subject: [PATCH] meson.build: drop -Werror=empty-body
> +
> +Drop -Werror=empty-body to avoid the following build failure raised
> +since version 1.50.5 and
> +https://gitlab.gnome.org/GNOME/pango/-/commit/cd08fb7402498e6ea542b4628447547477ac212e:
> +
> +../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
> +../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
> +     ;
> +     ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.gnome.org/GNOME/pango/-/merge_requests/604]

  As noted in the MR: the patch is not upstreamable. Instead, the underlying 
error should be fixed. Which is trivial: simply replace the lone ';' with '{}'.

  Regards,
  Arnout

> +---
> + meson.build | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 0f79bff7..c48fe01f 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -89,7 +89,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
> +     '-Wunused',
> +     '-Werror=address',
> +     '-Werror=array-bounds',
> +-    '-Werror=empty-body',
> +     '-Werror=implicit',
> +     '-Werror=implicit-fallthrough',
> +     '-Werror=init-self',
> +@@ -135,7 +134,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
> +     '-Werror=write-strings',
> +     '-Werror=address',
> +     '-Werror=int-to-pointer-cast',
> +-    '-Werror=empty-body',
> +     '-Werror=write-strings',
> +     '-Werror=unused-but-set-variable',
> +     '-Wundef', # FIXME: https://bugzilla.gnome.org/show_bug.cgi?id=792481
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
