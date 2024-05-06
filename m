Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF627C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7540823F6;
	Mon,  6 May 2024 20:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0tk6rib_Ryy; Mon,  6 May 2024 20:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA67182430
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA67182430;
	Mon,  6 May 2024 20:11:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5E2A1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0276823C6
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2I4a7a60J4e for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:11:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A5BB8234D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5BB8234D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A5BB8234D
 for <buildroot@busybox.net>; Mon,  6 May 2024 20:11:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D61BB13F8B8;
 Mon,  6 May 2024 22:11:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 May 2024 22:11:14 +0200
Date: Mon, 6 May 2024 22:11:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <Zjk5YgT6u3PT_rIe@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-9-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506144555.31709-9-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715026277;
 bh=s29CZjXoVqLaBO+tGb70xQ8idv1q+LV8q+7T1pLn8Cs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aSb1RUtdiCUaMAj0d3W5kofpDA3DSXs9fBx2PS4bpox7gvmOhFGIS6YJx+WHUE6xM
 1CU6dl2GmIaqGMn2KaGmyBLwMvoePmtwgDTI30/w7pMDUGEZIj+TEDS/by6PFmewoQ
 jOxM7tbBdsJzsBwmuSbozoAuVVY9Gc/ZRVdRK2T7oSESTNnKJNhq2K6s1FEditIAyO
 R7GQIreUhTR+DhTNMNfNKqc417YvMsH9WgWuofNj8AgQK7iMp2AUp1V8gi/wlKz+kz
 Skh2x6mdVJYoNKXQJlkxMj0U1iKgMsR5jpD7cELveyRujGZjXvtPRvYhb5OtKXH1TI
 RXQtinciEC9IQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aSb1RUtd
Subject: Re: [Buildroot] [PATCH v1 8/8] package/openssl: move
 libopenssl/libressl source statemetns outside of the choice
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> https://lists.buildroot.org/mailman/listinfo/buildroot

Peter, All,

On 2024-05-06 16:45 +0200, Peter Seiderer via buildroot spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes/ToDo:
> - with this solution the external support needs to be splitted into
>   two imports/lines...

NMot sure I understand wht you meant here...

> ---
>  package/openssl/Config.in | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index 3d14988d99..fcf996f03f 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -28,8 +28,6 @@ config BR2_PACKAGE_LIBOPENSSL
>  
>  	  Note: Some helper scripts need perl.
>  
> -source "package/libopenssl/Config.in"
> -
>  config BR2_PACKAGE_LIBRESSL
>  	bool "libressl"
>  	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> @@ -44,13 +42,14 @@ config BR2_PACKAGE_LIBRESSL
>  
>  	  http://www.libressl.org/
>  
> -source "package/libressl/Config.in"
> -
>  # openssl from br2-external trees, if any
>  source "$(BASE_DIR)/.br2-external.in.openssl"

This leaves one 'source' statement in te choice, which is no longer
accepted, AFAIU.

>  endchoice
>  
> +source "package/libopenssl/Config.in"
> +source "package/libressl/Config.in"

I think the best solution is to move the if-endif conditional block out
of package/libopenssl/Config.in back into package/openssl/Config.in, and
add a new choice entry, so that basically we end up with something lie;

    choice
        bool "ssl library"

    config BR2_PACKAGE_LIBOPENSSL
        bool "openssl"

    config BR2_PACKAGE_LIBRESSL
        bool "libressl"

    config BR2_PACKAGE_OPENSSL_EXTERNAL
        bool "from an external tree"
        depends on $BR2_EXTERNAL != ""  # Or something along those lines, adapt

    endchoice

    if BR2_PACKAGE_LIBOPENSSL
    source "package/libopenssl/Config.in"
    endif

    if BR2_PACKAGE_LIBRESSL
    source "package/libressl/Config.in"
    endif

    if BR2_PACKAGE_OPENSSL_EXTERNAL
    source "$(BASE_DIR)/.br2-external.in.openssl"
    endif

Basically, that would make for an uglier state, but that's the best we
can do given the new limitsations introduced by upstream kconfig...

Thoughts?

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_HAS_OPENSSL
>  	bool
>  
> -- 
> 2.44.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
