Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5184CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07A23404A3;
	Sat, 23 Apr 2022 16:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8Olq63kU6pY; Sat, 23 Apr 2022 16:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F358D40734;
	Sat, 23 Apr 2022 16:28:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3829E1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2665D83E0B
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pttc2OmnZSfd for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:28:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 308EC83E08
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:28:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id l7so21875513ejn.2
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Fn4qjeRYbLPyxwHk0tae/rp//mtzsYJPJwDT5GdEjgU=;
 b=FGBalAMmrv3GPEtPehmBaO4ak9kJmnTIfmk6NOLJ32RZ0Z1To4NGbnmXDesaV1e8BO
 Xv7iRS+G7yB81sla8MX8VQB43lQzeOlKtIYbvqoPogHOgc2PaOd+eYWhi4RrQTbwxeMc
 DInCoDDRWdkkjeBbRCBIPXUC1/vgJAJu/fqj8Mc6ag0ARyiinFVasPotmN66g+xWhOp2
 AGPqrXRG254rTLpdOzeW6ZzhOuij19+El55R79XFMD+Zm7WH5Wv35Zps5gU84zucSjWP
 Lq+wGTnFf9i3PxneFotRhikYvWdBEzm9SjXGiMk1Vt0/cjRbtZZhyhjz6dgmgBsTcTUL
 Kehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fn4qjeRYbLPyxwHk0tae/rp//mtzsYJPJwDT5GdEjgU=;
 b=DoOgfd5BIBs2/dBD11jMUABjP6umoNpX/j1Tddlb9a1AJ+PZRsMKN4oWcAXDkm+ncq
 IL5Lu+2npD6unA/+A9D0o6TeXJnDGIHHeV3tdFfeOmN8MnIelp4AW9RLO0gyqrN60J0S
 DlmS9r0fs1LqqmAB5nIZz0jeBXCNZ/zga5+ClfzNGSruFGpt02IG81SzGrLz/hTY7GMh
 eahBU/nStnl/6FZal2qtbA6dS+QbLzRTE1aMWXP1N5NXp9J6A0IGTQP7QJUpC6eVjKKV
 VAJAPrF+jyQccSdyL54lvrOh8NA1T0AkYBVI7xzwDnrYBmXSNtbPSd7C+l0Qy6Va11wx
 5QYA==
X-Gm-Message-State: AOAM530xgcBLMbwTeto66f4sCIuMUGjVw4pFhyffwDkNuGg9uv1mCSDN
 tGCat0p40vwcoSh0qMGdKgGc7RaJ/FdtCw==
X-Google-Smtp-Source: ABdhPJx5nelo7MLM0aLEFFWS5/Q5LcLuuRGWwVhH/TX0kzjbpJjh/nKL8XHu2Ldvv9M1mh9J3IL4jQ==
X-Received: by 2002:a17:906:7952:b0:6da:94c9:cccb with SMTP id
 l18-20020a170906795200b006da94c9cccbmr8737238ejo.469.1650731294393; 
 Sat, 23 Apr 2022 09:28:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jl28-20020a17090775dc00b006e05cdf3a95sm1821316ejc.163.2022.04.23.09.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:28:13 -0700 (PDT)
Message-ID: <9b049497-c0c9-3867-dd3b-10d4ff7374db@mind.be>
Date: Sat, 23 Apr 2022 18:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220421063028.3647447-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421063028.3647447-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstd: fix init file installation
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



On 21/04/2022 08:30, James Hilliard wrote:
> Fix a bug where the init subdir was accidentially removed from meson.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-meson.build-add-missing-init-subdir.patch | 28 +++++++++++++++++++
>   1 file changed, 28 insertions(+)
>   create mode 100644 package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
> 
> diff --git a/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
> new file mode 100644
> index 0000000000..ed3738e3d4
> --- /dev/null
> +++ b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
> @@ -0,0 +1,28 @@
> +From 689265cd522c770ad3e0391cae80ee884a8c475c Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Thu, 21 Apr 2022 01:14:52 -0500
> +Subject: [PATCH] meson.build: add missing init subdir
> +
> +Seems this got accidentially removed in:
> +9f4490138c8892b1c86008134438b2ab405c9b0f
> +
> +Restore it so that init files are properly installed.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[upstreeam: https://github.com/RidgeRun/gstd-1.x/pull/291]
> +---
> + meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/meson.build b/meson.build
> +index a30f776..7a8690a 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -300,3 +300,4 @@ subdir('gst_client')
> + subdir('tests')
> + subdir('examples')
> + subdir('docs')
> ++subdir('init')
> +--
> +2.25.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
