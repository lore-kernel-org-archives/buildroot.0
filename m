Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0352AC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4EA440759;
	Thu, 12 Jun 2025 20:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APgHhcDuX-uZ; Thu, 12 Jun 2025 20:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA83640760
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA83640760;
	Thu, 12 Jun 2025 20:26:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEDA4183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D511A60B77
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asev5p9Q5xri for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E52E60E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E52E60E0D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E52E60E0D
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 101631C0D69; Thu, 12 Jun 2025 22:26:47 +0200 (CEST)
Message-ID: <e46f7849-f162-44e0-81bc-43d87f2d53b9@rnout.be>
Date: Thu, 12 Jun 2025 22:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250604131633.672108794B@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250604131633.672108794B@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749760007; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=D94b92O0bYijmY8ERI73f2Uh+SL1W/nkSgxf1mxYYME=;
 b=S8nN4o/NltmgJ+3iV+TkatzAb3Pk4GaVGm8FD7M0VqdAQXOIYDAoenCgDL21+A9sBazjsA
 VFx1F2CLl4gouVDpP655OPilCHs9kIiAksAUMhOy7mzzKvmpi8EacnBMk2cn6tu6cczHN7
 EXmhrSqaXfA+etOVPudDfZgXtyvw36rDKuvE6NdoOSV/waUnvnmZzjSyEYD0/6yCLX0BvS
 pgogQs8HM0Z8fTscBF0iWVZLCBzasp85rVbz2kGiTxgk0hPm34kw5WdKxX2aVzegt/8V3K
 9J729/bqJRuWX17lDFSLlkjHgRgWmiPvZgNTmHxL39zyeu4I2qdsa1DX74/M2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=S8nN4o/N
Subject: Re: [Buildroot] [git commit] package/libcurl: drop _GNU_SOURCE
 workaround
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/06/2025 15:14, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=e6567881e46a6cdf5dc8758992bd447e58821d4d
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This was needed for 8.14.0, but got fixed in 8.14.1 with:
> 
> https://github.com/curl/curl/issues/17512
> 
> So drop it again.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libcurl/libcurl.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 68d638609b..8501910ac5 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -14,7 +14,6 @@ LIBCURL_LICENSE = curl
>   LIBCURL_LICENSE_FILES = COPYING
>   LIBCURL_CPE_ID_VENDOR = haxx
>   LIBCURL_INSTALL_STAGING = YES
> -LIBCURL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>   
>   # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
>   # support because it uses fork(), which doesn't work on non-MMU platforms.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
