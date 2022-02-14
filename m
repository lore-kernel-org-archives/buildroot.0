Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9827BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E3E41505;
	Mon, 14 Feb 2022 20:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_JZ6GVcIeSY; Mon, 14 Feb 2022 20:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85DB241503;
	Mon, 14 Feb 2022 20:41:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E89141BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D721360A98
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MCZf8coWcAk for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:41:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAEDC60634
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:41:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i14so28732987wrc.10
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I9IPPaax/hADm8oFowPZJerT9IxaVHXx1LBBvsOcjIU=;
 b=Mp6vEUVzqAtGqE6TykHjUOF27RMil2oYz7LkXKpkpkROVynLvODgt0bgAdCoqM83HX
 iPQD8UO7pUq6ucLPKXfZeN7DYUzRDpYQYmNe45I6JJXzc+KelYV6nUWdeP2ov/auGG5N
 5bQusB2pATIF6cIvP7EHLfsmO56lvcJUM32kp7sVU+7d2Vzx+W/ecf3D+ZDV9jmR2OwD
 SHg6gtxUjhuLMmOegWeeo2DKNfo2WmhF73qGEMOFQNhxsE5IwAN0DntXYPzWjzZVt/hg
 TNDRPEkBpScI0O5Ja4xwx3yIyEBUovDlNKrj/rGXiJFwz0Rogpfuk2tioyOA74gBapey
 b95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I9IPPaax/hADm8oFowPZJerT9IxaVHXx1LBBvsOcjIU=;
 b=mr2tHVnfyXFNqhaSP9NqB1C/WGHTyer6J4n76p3+m3SY5eKeq1Wyl5ghm+TuCOSD2i
 Dk56KfYpbZZew48fQGfbUNKsj0zFqaZJhJFnXHtq0aLnzWf6uuIAlSQbpbB3cz7JfpA+
 F7SkQicCZCTxZL/YN9R4Bgz6+kF/AFaEnI1z3ONFpfpa1RuZnBcJkMc62AfzUsgn8iGA
 buVBlVEuenTRCH2KOly5JPdTV3dQitmaUekrfV3OAyRbfAoIH3M23me6kZ6sFY2tErLM
 JwX/j/s/i/F81e/eO0n6JDj45szYK2f3Begy78ZJ3fEmukYKg9vHko1k4EenNzUspMhY
 mSYw==
X-Gm-Message-State: AOAM530dyM9uVMys0HNnmTFM/77s/+IgBGzjO/yK1nCptMlo55K4OQMK
 fDTF4Cil1yqPizFtTFpl/X6D3Q==
X-Google-Smtp-Source: ABdhPJyBbaeLpN1e5mxhVE6A99iCXiiwmAhW+sToGj4zbCSfJoZBDiKlCHOPr6KTC9TzNWqle/nioQ==
X-Received: by 2002:adf:9ccc:: with SMTP id h12mr543958wre.689.1644871264953; 
 Mon, 14 Feb 2022 12:41:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id az21sm12770847wmb.11.2022.02.14.12.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:41:04 -0800 (PST)
Message-ID: <31b52468-98ef-bfa7-c59e-12130d4ecdf9@mind.be>
Date: Mon, 14 Feb 2022 21:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220208210644.16926-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220208210644.16926-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: depends on gcc >= 4.9
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/02/2022 22:06, Fabrice Fontaine wrote:
> Add a dependency on gcc >= 4.9 to avoid the following build failure
> with gcc 4.8.3 raised since bump to version 3.14.1 in commit
> 61797c52f5deef2cb67e60cf075ca243078c8855 and
> https://github.com/zhaojh329/libuhttpd/commit/ffdf7de3a4a1f5a62aa3814ac96e889958a30840:
> 
> /home/peko/autobuild/instance-1/output-1/build/libuhttpd-3.14.1/src/cgi.c:41:5: error: initializer element is not a constant expression [-Werror]
>       {"accept", strlen("accept"), "HTTP_ACCEPT"},
>       ^
> 
> It should be noted that upstream rejected a patch to remove -Werror:
> https://github.com/zhaojh329/libuhttpd/pull/12
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a3a970a6398dcb0e4e03f4277f1a50c6b5eff7bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libuhttpd/Config.in | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
> index 52bbd313bc..97fc984ea0 100644
> --- a/package/libuhttpd/Config.in
> +++ b/package/libuhttpd/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_LIBUHTTPD
>   	bool "libuhttpd"
>   	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   	select BR2_PACKAGE_LIBEV
>   	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
>   	help
> @@ -8,3 +9,7 @@ config BR2_PACKAGE_LIBUHTTPD
>   	  library based on libev
>   
>   	  https://github.com/zhaojh329/libuhttpd
> +
> +comment "libuhttpd needs a toolchain w/ gcc >= 4.9"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
