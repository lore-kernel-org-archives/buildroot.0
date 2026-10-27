Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FE1606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H3GzNx+N
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F48660677;
	Tue, 27 Oct 2026 21:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5juUk_5MNu2Y; Tue, 27 Oct 2026 21:00:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F28460687
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793134800;
	b=UUalYAn9N1d2smSNPhGyoAVfnuswN+hSwOFPaa3lEia4paspKzs6oYRsZCSN/kCw3j9V
	 1rKuq0xxmS4XR++m42ujdYFfhoCFUFGC1UXkwAdfrpfnvJQHh0LiJMwlXchQIZ4U4ihhC
	 Z0y5mim9aPtES+wf9v8K2G2QJi9Z2f7T8daFDcH+oMoHZ2YPiJzmBaH9J0LOL/n520Dvc
	 vzbh5LFv5BSXz6X/L3uvVqNVAjmMLmSQRToFB1WTD5p58j9se3zGignZrIq2guagQRxw7
	 2wfN5IOEOWA0ZqvqfXFkyAWh/j/ZMKOwVyLZjzO5PKbnaLyKtj/0NMV1jaJujOolEMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793134800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WLMuFmM8EnX1VvGRgf24F67xKbbMGbb4T63wjnakUwE=;
	b=RF2iBNIQEC7RRooSS52EUPVUoSWGHF2G1jKrZVzaEEQee1v0hWQrUNQldQ9rrT89L33H
	 IEpxjL79uWe8+Ce2RDfX+Zb3BXMNkuCo26khcll1F4VMwiqrC2FNLnbbPIzZ1muSIb+VX
	 0DHMvbiJRea+GsG4D/Onmax0u0p0gbvnU2tM6qiQKkQgU9V6PlZcnRzpHewqdHi5qvj1A
	 tDfs9EuYF6SFyYYhmSfuiXN6cAWhC+nymPgy8FHrGoW3Eowsc9RCGtJlQpOCFTALth5Qv
	 Q1e3eoe6I9SBQLmLtr3P15pp3773DuKT+Bi8BPFzQnEuIC6V+FsVP1hPDju86dQJH7w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793134800;
	bh=WLMuFmM8EnX1VvGRgf24F67xKbbMGbb4T63wjnakUwE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H3GzNx+N3J0DaVqddP8XB7hWGUNOK9KNVPrUePaIexduM8ZaDzd6AejkCvr7B/O0J
	 +LxrSjhHMn9UBckdJVhRm2BbbBS73eiFSdB3tPKjLXR+BWDVwPXYxoJJ1UVAM8J3IG
	 /N6HbE7q73jquRTP5L+Jc4hZ1EQC0l5LvEWls9P/G+NJkTpjr1KxE4hRyotVKcCbaG
	 EC0AwHLpQZqJWhuFDQ6iGB70wr/4YuxJfC7PvuDBeuiAUIVtFTcYnFYO7Al6VKLy+r
	 g5FBKYg7TM7a7V3oSuCayJevBcClRY5o6XDR9gV7YUXDCuYqdgJbh8+P0uzYyLjJiN
	 dPX1VRfhXn5xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F28460687;
	Tue, 27 Oct 2026 21:00:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EF174D1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7089940478
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xC_QuxNJG1mL for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:59:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E0FAB4046D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793134797;
 b=hAkc1Pd0ditTmiSjIhoGv1qMW2zpK3kKekU5lSF4LOTo2+tUwX/rJ+Y2rzZJwF4S5BDb
 vTosF206Y7LFL8/8ESq9XEg1LLTLZDbqkIdKC4NV0Id1ViLZIgbzIhz8RXPoBDIQDyV0O
 SOz/sPtH7ZB9NazQZcRzaf7Kh04Jt3x7JgiKIiZZS283Ou4BmRtuAYjpJ277KjIjZ4qux
 G4BttfGKDkYmpAAhXpR1QqzQtON8EMynt+9jd4Z0x5B0yozqw3TjKTTDSo9sybOm8ylpC
 02XuKbsNlZdUC8Y2L7+0EO/sNjgCNgZXVCcnBSSq9iLqKWjJIvP2zGJWGxDGBH+dOUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793134797;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=pRO0P4htHplRvT+WSOGanIx86adbZ5nRXMVW0MQmRZI=;
 b=hFvlYf3x1u8JWRvvVnPtSjSb4gJpA3Sg4rckfP+4Gj/8CVFz6EIMHCkWVwzpxQrqpI9n
 eSnQm9cdl/mNVrrex5k583DaxnWQOgQXMZLXrvVTWpnCkXEfeG5RIj9AyKU802xUqbnTt
 wNLcaVyVyeIKM+dZLzMdGYJMELB6B/HT0hIoJmfpCxBIAXrfNKoBc1iFYL8P45vQ9yNvv
 h0Ja8lnZ5Kk8u2WEOi5GyQ0e3VvwSRJwpqyTfGk4BsJ5a3PmwFYBiOfD663gTcuomFGuJ
 0Sl1AZ+//4NEoJ1viyr5vhkLzxLmPVovOmwAvJUr1lOVmTuyITbWY52sBPnqh9CfrMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=joZ1Q0mm; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0FAB4046D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:59:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8FDCD4E41348;
 Tue, 27 Oct 2026 20:59:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 58D10603BD;
 Tue, 27 Oct 2026 20:59:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3418C10328A20; Tue, 27 Oct 2026 21:59:47 +0100 (CET)
Date: Tue, 27 Oct 2026 21:59:47 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auEOu1PkR77ewYH1@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-14-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-14-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 14/14] package/mender: bump to version
 5.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Adam,

Thanks for the patch. Looks mostly good. A small number of
questions/comments below.

On Tue, Oct 27, 2026 at 05:40:11PM +0100, Adam Duskett wrote:

> MINOR:
> 
>   - Drop the 0001-openssl-v4-update.patch.
>      - OpenSSL 4.x is not in buildroot master yet.

That's a bit annoying. The patch was added in preparation to bumping
OpenSSL 4.x. As it required patching a LOT of packages, it is done
gradually, but "regressing" on this is a bit problematic. Does mender
5.x build with OpenSSL 4.x?

> index 01a0254511..01cf4077b7 100644
> --- a/board/mender/x86_64/readme.txt
> +++ b/board/mender/x86_64/readme.txt
> @@ -53,12 +53,12 @@ Optional arguments:
>  
>  The login prompt will appear in the serial window.
>  
> -Tested with QEMU 4.1.1 on Fedora 31
> +Tested with QEMU 10.2.2 on Fedora 44
>  
>  Creating a mender-artifact
>  ========================
>  
> -The mender artifact is created in output/images/buildroot-x86_64-1.0.mender
> +The mender artifact is created in output/images/1.0.mender

Ah, so this is where this is being updated, while this change occurred
several patches ago in your patch series, as I pointed out.

> diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
> index f10a461770..1c65dff4d9 100644
> --- a/configs/mender_x86_64_efi_defconfig
> +++ b/configs/mender_x86_64_efi_defconfig
> @@ -1,7 +1,7 @@
>  BR2_x86_64=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
> -BR2_INIT_SYSV=y
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

If you want, you can switch the defconfig to use a pre-built external
toolchain, like a Bootlin toolchain.

> +BR2_INIT_SYSTEMD=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
> @@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> +BR2_PACKAGE_JQ=y

Why is jq needed on the target?

> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index c9b9d0b757..d4685986be 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -1,9 +1,21 @@
>  config BR2_PACKAGE_MENDER
>  	bool "mender"
> -	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_PACKAGE_HOST_GO
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # yaml-cpp -> C++11

You can just put "yaml-cpp" as the comment here if you want, that's
sufficient.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-log
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-log
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_USE_WCHAR # libglib2

Also boost, libarchive. But admittedly keeping those comments fully
up-to-date is a bit tricky, and we are not super strict about this.

> +define MENDER_INSTALL_MODULES_GEN
> +	DESTDIR=$(HOST_DIR) \
> +	$(BR2_MAKE) -C $(@D) \
> +		install-modules-gen

Why $(BR2_MAKE) and not just $(MAKE) ?

Also, we normally put DESTDIR as a make option, not an environment
variable, i.e:

	  $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install-modules-gen

> +endef
> +MENDER_POST_INSTALL_TARGET_HOOKS += += MENDER_INSTALL_MODULES_GEN
> +
> +# Cmake does not install libtiny-process-library leading to the error:
> +# libtiny-process-library.so: cannot open shared object file
> +define MENDER_INSTALL_LIBTINY_PROC_SO
> +	$(INSTALL) -D -m 0755 \
> +		$(@D)/src/common/vendor/tiny-process-library/libtiny-process-library.so \
> +	$(TARGET_DIR)/usr/lib/libtiny-process-library.so

Missing one indentation level.

But more importantly: isn't this a bug in Mender's build system that
should be fixed by a patch?

> +endef
> +MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_LIBTINY_PROC_SO
> +
> +define MENDER_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) \
> +	$(TARGET_BUILD_ENV) \

What is $(TARGET_BUILD_ENV) ?

> +	DESTDIR=$(TARGET_DIR) \
> +	$(BR2_MAKE) -C $(@D) \
> +		$(MENDER_INSTALL_TARGET_OPTS)

Same as above:

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) $(MENDER_INSTALL_TARGET_OPTS)

> diff --git a/support/testing/tests/package/test_mender/linux-e1000e.fragment b/support/testing/tests/package/test_mender/linux-e1000e.fragment
> new file mode 100644
> index 0000000000..cc3fe0047e
> --- /dev/null
> +++ b/support/testing/tests/package/test_mender/linux-e1000e.fragment

Is this fragment used anywhere?

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
