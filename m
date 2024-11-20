Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777FBD6E2CE
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 08:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AE154EBBE;
	Wed, 20 Nov 2024 08:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDEhwCjMf-_F; Wed, 20 Nov 2024 08:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01C4042DC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01C4042DC3;
	Wed, 20 Nov 2024 08:04:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B85DA970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3D3A60674
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8dK-uKVsQqt for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 08:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D14A606B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D14A606B9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D14A606B9
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:04:02 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a0d:e487:139f:e4e9:e019:e105:213e:675c])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EE8112003C3;
 Wed, 20 Nov 2024 09:03:54 +0100 (CET)
Date: Wed, 20 Nov 2024 09:03:49 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Simon Richter <simon@sinic.eu>
Cc: buildroot@buildroot.org
Message-ID: <sy4c2ptgmdeb2ww3p2ofjtq3emcfx2shpsgqi7vwgalq6lonvo@ocnuadjhz6te>
References: <20241120073755.17583-1-simon@sinic.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241120073755.17583-1-simon@sinic.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732089839;
 bh=Y0TZzi9kRV/0nOBLtXFRN8QikNski4XRUVXyPU1+798=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLD3Sk6ZaNro0Zh5wRZmYJLXBhzoBcvczPA+I6y1OOQvNhkRVhFIgxjDKaT+vjn+t
 2drXeI8AuoP0duKVFijOrc6X3F4u3ZZ9KMBjw46Fh8LpUNA/q+PGBRPXHd7biBwKeT
 Jf4/+BYDd4RdHEP3qrcEo1hmhN5KYns+cpndG7HmV0GB7MZmvsq/yIXuAQkfdVseGf
 dM+mtAqxR/jl31GAFvVzpPiksSbJVkqI+RUxk2GPxVoOXKlIUAJne3HrI7/qHmykxb
 n0K8Upcv7opTeiyXBQQXme3al+FDNzbeJGQ5FRyAedvj/VXjG2W8vWwxeMtURocpsH
 IBT2YtxprC65Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cLD3Sk6Z
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: add missing quotes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Nov 20, 2024 at 08:37:55AM UTC, Simon Richter via buildroot wrote:
> This allows <PKG>_SOURCE to contain characters like `&`.
> 
> Signed-off-by: Simon Richter <simon@sinic.eu>

It is a bad idea to have such name, but it makes sense.

LGTM

Reviewed-by: Vincent Jardin <vjardin@free.fr>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9ec84d0f45..96cc5a1d25 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -176,7 +176,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>  	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
>  	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  # Only show the download message if it isn't already downloaded
> -	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
> +	$(Q)for p in "$($(PKG)_ALL_DOWNLOADS)"; do \
>  		if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then \
>  			$(call MESSAGE,"Downloading") ; \
>  			break ; \
> -- 
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
