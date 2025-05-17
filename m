Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3E0C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B71781354;
	Sat, 17 May 2025 10:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCpEwbTBZT-T; Sat, 17 May 2025 10:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCE583AB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BCE583AB4;
	Sat, 17 May 2025 10:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A84E1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70268409B1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ph3B9eBjKWGu for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86FB0409A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86FB0409A9
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86FB0409A9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B4351C05C0; Sat, 17 May 2025 12:07:38 +0200 (CEST)
Message-ID: <7b984e4f-f968-433c-9750-4d57982db5a6@rnout.be>
Date: Sat, 17 May 2025 12:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <614fb4ebe91cd66d14b25e087a865802e3781978.1747241900.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <614fb4ebe91cd66d14b25e087a865802e3781978.1747241900.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747476458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BFhsGLn5BTrHmY1tYB6YwdZ9isvyuJCza+wX4LAKvH8=;
 b=dbJnGiAr+TZ7CGRoaUpmV6yT7hH1z9i2aVOa1gadIgQEvWMOvKnmXPS8pp0O2CIRfM7Cti
 HIERHTHqK9uGf9ek0PGzVFrrdTIUYkZm4vEQW3pYAj/1sXtsGk5C/jVskPRpf/8qAg41rT
 J/cewPRNdG/DrBo+0GCgRhTKTh8ic631522POebKPVqK6MaLQEavwt1YHeRpMPtpJKYarp
 qxds2pBc5ZaxcCaNGlnTvGXUvLMpvIDFtsKDTgK1AUiRmvDJoCosS5B0/ZAnxQs6MI/dwk
 Rc7E9VAbbmDNHU6eDyUjLXCgezomzmaET8W6qAUnundQa51RsBi3bqFmgdL9sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dbJnGiAr
Subject: Re: [Buildroot] [PATCH 03/13] package/systemd: select merged-usr
 from package, not init
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



On 14/05/2025 18:58, Yann E. MORIN wrote:
> Since version 255, systemd no longer supports split-usr [0].
> 
> Move the select from the init system to the package, to explicitly
> expose tha fact.
> 
> Drop our comment about our design decision, as it no longer applies.
> 
> [0] https://github.com/systemd/systemd/blob/v255/NEWS#L7
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Norbert Lange <nolange79@gmail.com>
> Cc: Sen Hastings <sen@hastings.org>

Acked-by: Arnout Vandecappelle <arnout@mind.be>

> ---
>   package/systemd/Config.in | 1 +
>   system/Config.in          | 5 -----
>   2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 851b91aeba..fd7671480c 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -24,6 +24,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
>   	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
> +	select BR2_ROOTFS_MERGED_USR
>   	select BR2_PACKAGE_HAS_UDEV
>   	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
>   	select BR2_PACKAGE_LIBCAP
> diff --git a/system/Config.in b/system/Config.in
> index 2499dc8208..2f42e5ddf9 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -115,10 +115,6 @@ comment "openrc needs a glibc or musl toolchain w/ dynamic library"
>   	depends on BR2_USE_MMU
>   	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC
>   
> -# In Buildroot, we decided not to support a split-usr when systemd is
> -# used as an init system. This is a design decision, not a systemd
> -# issue. Thus the select is with BR2_INIT_SYSTEMD (below) rather than
> -# with BR2_PACKAGE_SYSTEMD.
>   config BR2_INIT_SYSTEMD
>   	bool "systemd"
>   	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
> @@ -130,7 +126,6 @@ config BR2_INIT_SYSTEMD
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
>   	depends on BR2_HOST_GCC_AT_LEAST_8
> -	select BR2_ROOTFS_MERGED_USR
>   	select BR2_PACKAGE_SYSTEMD
>   	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
