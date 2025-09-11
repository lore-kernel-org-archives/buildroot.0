Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66568CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159074233D;
	Thu, 11 Sep 2025 19:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLJl15Vylenp; Thu, 11 Sep 2025 19:34:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 336EF42110
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336EF42110;
	Thu, 11 Sep 2025 19:34:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EC40234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FFFB41F3A
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JN0kzSLNKQPZ for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2774404C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2774404C2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2774404C2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:34:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA69DB978576; Thu, 11 Sep 2025 21:34:31 +0200 (CEST)
Message-ID: <2777d457-1ca4-443f-b533-33338add797a@rnout.be>
Date: Thu, 11 Sep 2025 21:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250911171700.594432-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250911171700.594432-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757619272; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=9EVY7lKaFjqUdXbiDf3qrfk3ycVc7JJonyEVeYze/38=;
 b=XVtQANDb54EDN8UpbTe6/onsmEVGg5AqCaWPOYPkEZkudqKqHmjWv36SskwN81NHsdeDvI
 DwK7AQ5EcwPel24kI0lRhpK8lv300l+fpce0Tr72FHHMjW62O5PXJhyCwUnwryy/lyYBdD
 yB7w+t+NzSgUdge5b47jce2HuonkB35nFAmxg5NGGJSRmNXI2Yboa2NnMyxo2I25/nSZZB
 eRSZnHbPirf8WRkQEdqBWoGczJKZ0oJNkQe6OA36YuWNBy/6TZKD+u6LQ3DhSbShgd6add
 nmOLW88RGbxjPEi+OQnZb2nsqi8dXprrtD0BPiJPpJGaMzOu4PeJVxXA2fgDIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=XVtQANDb
Subject: Re: [Buildroot] [PATCH 1/1] package/gkrellm: remove client,
 needs libgtk2
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



On 11/09/2025 19:17, Bernd Kuhls wrote:
> The gkrellm client needs libgtk2, which we are about to drop from
> Buildroot.
> 
> Even though gkrellm has a somewhat active upstream at
> https://git.srcbox.net/gkrellm/gkrellm, it isn't clear whether it is
> compatible with Gtk 3 or not.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks, with some modifications, see below.

> ---
>   Config.in.legacy           | 15 +++++++++++++++
>   package/gkrellm/Config.in  | 31 +------------------------------
>   package/gkrellm/gkrellm.mk | 12 ------------
>   3 files changed, 16 insertions(+), 42 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 895e42fc30..69255b201c 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,21 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_GKRELLM_SERVER
> +	bool "gkrellm server option has been removed"

  People who only had the server enabled don't feel any effect of this change, 
so they don't need to be bothered with a useless legacy warning. I removed this 
symbol.

> +	select BR2_LEGACY
> +	help
> +	  After removing the client option the gkrellm package only
> +	  builds the server part so the server option is not needed
> +	  anymore.
> +
> +config BR2_PACKAGE_GKRELLM_CLIENT
> +	bool "gkrellm client has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The gkrellm client option has been removed, as it required
> +	  libgtk2, which was removed from Buildroot.
> +
>   config BR2_LINUX_KERNEL_EXT_AUFS
>   	bool "Aufs Filesystem Module patch has been removed"
>   	select BR2_LEGACY
> diff --git a/package/gkrellm/Config.in b/package/gkrellm/Config.in
> index e957c058de..a572c9474d 100644
> --- a/package/gkrellm/Config.in
> +++ b/package/gkrellm/Config.in
> @@ -3,41 +3,12 @@ config BR2_PACKAGE_GKRELLM
>   	depends on BR2_USE_WCHAR # libglib2
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>   	depends on BR2_USE_MMU # libglib2
> -	select BR2_PACKAGE_GKRELLM_SERVER if !BR2_PACKAGE_GKRELLM_CLIENT
>   	select BR2_PACKAGE_LIBGLIB2
>   	help
> -	  GKrellM is a single process stack of system monitors which
> -	  supports applying themes to match its appearance to your
> -	  window manager, Gtk, or any other theme.
> +	  GKrellM is a single process stack of system monitors.

  I extended the help text to mention that only the server is supported and the 
client can run remotely.

  Regards,
  Arnout

>   
>   	  http://gkrellm.srcbox.net/
>   
> -if BR2_PACKAGE_GKRELLM
> -
> -config BR2_PACKAGE_GKRELLM_SERVER
> -	bool "server"
> -	help
> -	  Enable gkrellm server.
> -
> -config BR2_PACKAGE_GKRELLM_CLIENT
> -	bool "client"
> -	depends on BR2_PACKAGE_XORG7 # libgtk2
> -	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2
> -	select BR2_PACKAGE_LIBGTK2
> -	select BR2_PACKAGE_XLIB_LIBSM
> -	help
> -	  Enable gkrellm client.
> -
> -comment "client needs a toolchain w/ C++, gcc >= 4.8"
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on BR2_PACKAGE_XORG7
> -	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> -
> -endif # BR2_PACKAGE_GKRELLM
> -
>   comment "gkrellm needs a toolchain w/ wchar, threads"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
> index 165b71c7c8..257ebadfc4 100644
> --- a/package/gkrellm/gkrellm.mk
> +++ b/package/gkrellm/gkrellm.mk
> @@ -32,19 +32,7 @@ else
>   GKRELLM_BUILD_OPTS += enable_nls=0
>   endif
>   
> -ifeq ($(BR2_PACKAGE_GKRELLM_SERVER)$(BR2_PACKAGE_GKRELLM_CLIENT),yy)
> -GKRELLM_BUILD_DIR = $(@D)
> -else ifeq ($(BR2_PACKAGE_GKRELLM_SERVER),y)
>   GKRELLM_BUILD_DIR = $(@D)/server
> -else
> -GKRELLM_BUILD_DIR = $(@D)/src
> -endif
> -
> -ifeq ($(BR2_PACKAGE_GKRELLM_CLIENT),y)
> -GKRELLM_DEPENDENCIES += libgtk2 xlib_libSM
> -GKRELLM_BUILD_OPTS += X11_LIBS="-lX11 -lSM -lICE"
> -GKRELLM_LICENSE += GPL (base64.c), Public Domain (md5.h, md5c.c)
> -endif
>   
>   define GKRELLM_BUILD_CMDS
>   	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
