Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAABC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4689E60D6A;
	Sun, 12 Dec 2021 14:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fN1n-vxVm80o; Sun, 12 Dec 2021 14:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CE4260D69;
	Sun, 12 Dec 2021 14:11:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0833E1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB9360D69
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4tdlErtJo3Zl for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:11:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E095560D68
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:11:35 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w1so44065623edc.6
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=MX0tatNjwIsW1MSuSH4VuTrNnEYMwwnQJ0Bm+Kz1rNw=;
 b=S7uW/2ue0nqKBn1VZF7QE5/cbAxNsdWTyMk9TyJhdigEVd3rz3LBcsew5ZSeBpm0jx
 bVY5zNUiepOjR6j5ocLcHcvrAI2IvA8PibcrNp76sy7HrmvgCbtHTYq9kcZopGnQaHgE
 yipZKDquaCSm/Hz7wPUfYhRkIS0T6rCPitMPvc4BXx6iRWHDEQaRfECfYN7HeD2wTQDz
 pccJGQYtzF7fTR2GK4HDQ10TRNMTEBm2WEZJDJPU0DxdwEE64GMiQWbhGo4Zd2wEZo3B
 /E9IahFEe5b6iserOIDHk6MnCvPT23KSmua2aTxHqHYRL/T5VmEgUlkVJ4USKh7LqvyC
 rsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MX0tatNjwIsW1MSuSH4VuTrNnEYMwwnQJ0Bm+Kz1rNw=;
 b=3DuvE/f02S2HT9yEmBh8M7IzfxKy5weimnkPj+Y2s8tr3/r6qyKLmLYo5rfLtozbjS
 WOJIGIeSwTy85Zkis/hpnmun7HfXBhTGz//AVC83ZPEzbEjrEPLAn+HarWCw8d2z4tGL
 guJ61Tq5957YwZzSzgoF6UDiWu4LzEWo52LysbiI5OeOA8qhmCjmmAOMn4SpJNoyaNjQ
 DoMN8BZYshSo75fmWO5WQnmvtgKIboywUZ5JdZyefvL7x4zAfILU3iUe1xHuicWmlzJE
 avBtXUycZHHoGXj+noBF4lv5GAZtQbUe5NsejUPzMg1+12gXTnhaoCj0hfGiUdujgliQ
 P6fQ==
X-Gm-Message-State: AOAM532yV41Wm3VQCMhYtkV73U9QZWEUZnHuMDg+o4K8mI8KLCbgumsj
 TViGaO6yZXB0AyFG5SHs7BwX/Ntyp77OWg==
X-Google-Smtp-Source: ABdhPJwjCUb3JCkdxCsh7xl4RuQMevg9pOx9ZmvT6BIR06a5sTCjgvrsoCmR8dHId6nv1cAp6tD0yw==
X-Received: by 2002:a17:906:4fc7:: with SMTP id
 i7mr38385007ejw.514.1639318294209; 
 Sun, 12 Dec 2021 06:11:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m6sm4685262edc.36.2021.12.12.06.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:11:33 -0800 (PST)
Message-ID: <b5626f05-57c5-65c1-dfd9-4e85a4b7e50b@mind.be>
Date: Sun, 12 Dec 2021 15:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211210120230.15277-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211210120230.15277-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/assimp: needs std::exception_ptr
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



On 10/12/2021 13:02, Peter Seiderer wrote:
> Add dependency on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 to assure
> std::exception_ptr support (the only in-tree assimp dependency
> in package/qt5/qt53d is optional already).
> 
> Fixes:
> 
>    - http://autobuild.buildroot.net/results/0cc9cab2761591af57d6d6744a0dd61b7c60e935
> 
>    In file included from .../build/assimp-5.1.0/include/assimp/GenericProperty.h:52:0,
>                     from .../build/assimp-5.1.0/code/Common/BaseProcess.h:46,
>                     from .../build/assimp-5.1.0/code/Common/BaseProcess.cpp:44:
>    .../build/assimp-5.1.0/include/assimp/Importer.hpp:522:11: error: 'exception_ptr' in namespace 'std' does not name a type
>         const std::exception_ptr& GetException() const;
>               ^
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/assimp/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/assimp/Config.in b/package/assimp/Config.in
> index c535240efc..833e559a6f 100644
> --- a/package/assimp/Config.in
> +++ b/package/assimp/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_ASSIMP
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_PACKAGE_LIBZLIB
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>   	help
>   	  Open Asset Import Library (assimp) is a portable Open Source
>   	  library to import various well-known 3D model formats in a
> @@ -18,3 +19,6 @@ comment "assimp needs a toolchain w/ C++, wchar"
>   
>   comment "assimp needs libzlib"
>   	depends on !BR2_PACKAGE_LIBZLIB
> +
> +comment "assimp needs exception_ptr"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
