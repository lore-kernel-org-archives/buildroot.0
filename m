Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00517CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC78F83613;
	Thu, 21 Aug 2025 18:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fb33fwPsRyMr; Thu, 21 Aug 2025 18:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFEF983518
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFEF983518;
	Thu, 21 Aug 2025 18:49:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32EFDD8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1893883455
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJeh5HYjrdwY for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 148CE831BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 148CE831BD
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 148CE831BD
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:49:42 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id DE97644063F;
 Thu, 21 Aug 2025 21:47:10 +0300 (IDT)
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250821182337.3563734-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Thu, 21 Aug 2025 20:23:37 +0200")
References: <20250821182337.3563734-1-angelo.compagnucci@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 21 Aug 2025 21:49:38 +0300
Message-ID: <87ms7szf0d.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1755802030;
 bh=Xdt/MtB7G8Z/8S8ru2vXUHrdbCNnN7c4yuQXDaonKiw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f2aXi2hpkbU70wuhidOrT9ejbjWQzET7tNDFGyLlR2xwMwrGPhKdITKF3w1L1YCoR
 5sawMfLCxj2pESvOoNHu6UJiioWM+MlcdXXExIPgpbR1yK7d5m3Ll0nNYWOYn7HGFo
 /lID8gmkaPLc4VMpSDCZcm91deqVwj7jfnZt+PFyVlP6jCkc7WjUEpVla8rRRuUx2T
 RXsyhlCeCsPItSYJ66CLZ8QqmmRp0CWU6zkFGKRRf4ybFoCAf9xJ/gR6zbT/xMbYoH
 nfDxUywLq0uA+MEIWqJztuM7Eak0TNgVus5NSVQZwftAIFE15Tl67m9uzln5GbvUvW
 XznpDJQkGkrPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=f2aXi2hp
Subject: Re: [Buildroot] [PATCH v2] package/wcurl: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Angelo,

On Thu, Aug 21 2025, Angelo Compagnucci wrote:
> wcurl is a command line tool which lets you download URLs without having to
> remember any parameters.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

[...]

> diff --git a/package/wcurl/Config.in b/package/wcurl/Config.in
> new file mode 100644
> index 0000000000..31a007b61f
> --- /dev/null
> +++ b/package/wcurl/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_WCURL
> +	bool "wcurl"
> +	depends on BR2_PACKAGE_LIBCURL # runtime
> +	depends on BR2_PACKAGE_LIBCURL_CURL # runtime

Why not 'select'?

You don't provide a comment to guide the user about these
dependencies. With 'select', no comment is needed.

baruch

> +	help
> +	  wcurl is a small command-line tool that wraps curl for easier use
> +	  when downloading files from the web.
> +
> +	  https://curl.se/wcurl/
> diff --git a/package/wcurl/wcurl.hash b/package/wcurl/wcurl.hash
> new file mode 100644
> index 0000000000..b747e99502
> --- /dev/null
> +++ b/package/wcurl/wcurl.hash
> @@ -0,0 +1,3 @@
> +# sha256 locally computed
> +sha256  a745475f3511090685c4d000a10f4155147b75a8c7781764612a7e8f67bb6d82  wcurl-2025.05.26.tar.gz
> +sha256  0127bdd267b1fa65bf5a6c487c907948e0c009aa35a5949c8aed91f779d27810  LICENSE
> diff --git a/package/wcurl/wcurl.mk b/package/wcurl/wcurl.mk
> new file mode 100644
> index 0000000000..8499bd3e1b
> --- /dev/null
> +++ b/package/wcurl/wcurl.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# wcurl
> +#
> +################################################################################
> +
> +WCURL_VERSION = 2025.05.26
> +WCURL_SITE = $(call github,curl,wcurl,v$(WCURL_VERSION))
> +WCURL_LICENSE = curl
> +WCURL_LICENSE_FILES = LICENSE
> +
> +define FOO_INSTALL_TARGET_CMDS
> +	 $(INSTALL) -D -m 0755 $(@D)/wcurl $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
