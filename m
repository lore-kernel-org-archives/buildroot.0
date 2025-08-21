Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9DCCA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 17:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E353E4145B;
	Thu, 21 Aug 2025 17:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPOpTxYWBrE8; Thu, 21 Aug 2025 17:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE54A41495
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE54A41495;
	Thu, 21 Aug 2025 17:08:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18E85D8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3BFE8455F
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKIwe4tFJ2Re for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 17:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DE8D844A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE8D844A0
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DE8D844A0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:08:46 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id DE4DE44063F;
 Thu, 21 Aug 2025 20:06:15 +0300 (IDT)
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250821164828.3540002-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Thu, 21 Aug 2025 18:48:28 +0200")
References: <20250821164828.3540002-1-angelo.compagnucci@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 21 Aug 2025 20:08:42 +0300
Message-ID: <87sehkzjol.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1755795975;
 bh=CaZzOZJV66Mr4qVQIE5EbhWznyRa8kUQPyru5cuxhsY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bWVegKGA086wwrUVxA6R15MVmqWMYmUHc+GQ5YexD1CXqdTEnPYzTPyjUwZ9ZUfFu
 5bl0J11q6JhgYwlGBcrhD2QgmqvrCbZE1nojhEfdHvA8oMGSKDO/48Ct3aOUdNFgov
 oFZPeKhPcdJWlU8zQ1nDxyXVRFZoI37f0KSiXrEUNRWhghMqnDpPxiKVI0khfq3dO+
 X/uVVLcamDxtcJK4otWWCknzpnO+QN54lGdf4G+5yj5X6NtF1yRpjCxcjw19IyqTvY
 57BaXc6SFAL2nuobpnrU3tFVCtK698bevnnRXdTGoS+5PplecX62iI6J1CsZq8MncE
 Ax4PtQxyEYgjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=bWVegKGA
Subject: Re: [Buildroot] [PATCH] package/wcurl: new package
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
> ---

[...]

> diff --git a/package/wcurl/Config.in b/package/wcurl/Config.in
> new file mode 100644
> index 0000000000..da7a3922f5
> --- /dev/null
> +++ b/package/wcurl/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_WCURL
> +	bool "wcurl"
> +	depends on BR2_PACKAGE_LIBCURL_CURL

I think this is better:

  select BR2_PACKAGE_LIBCURL
  select BR2_PACKAGE_LIBCURL_CURL

The need to enable BR2_PACKAGE_LIBCURL_CURL to expose wcurl package in
the menu is not entirely obvious, IMO.

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
> index 0000000000..98d15a1a6b
> --- /dev/null
> +++ b/package/wcurl/wcurl.mk
> @@ -0,0 +1,17 @@
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
> +WCURL_DEPENDENCIES = libcurl

Are you sure libcurl is needed a build time?

> +
> +define FOO_INSTALL_TARGET_CMDS
> +	 $(INSTALL) -D -m 0755 $(@D)/wcurl $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
