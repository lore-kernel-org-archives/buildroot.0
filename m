Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61489C83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 17:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C0D60A71;
	Mon, 14 Jul 2025 17:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4ilbDHFQOSW; Mon, 14 Jul 2025 17:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4499E60A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4499E60A77;
	Mon, 14 Jul 2025 17:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D093967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 17:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29FF740A87
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 17:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDD799OlNvgD for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 17:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 282B140A7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 282B140A7E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 282B140A7E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 17:23:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CBA7719F5AF;
 Mon, 14 Jul 2025 19:23:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Jul 2025 19:23:21 +0200
MIME-Version: 1.0
Date: Mon, 14 Jul 2025 19:23:21 +0200
To: Nathaniel Roach <nroach44@nroach44.id.au>
Cc: buildroot@buildroot.org
In-Reply-To: <20250714154029.3327599-1-nroach44@nroach44.id.au>
References: <20250714154029.3327599-1-nroach44@nroach44.id.au>
User-Agent: Webmail Free/1.6.11
Message-ID: <04838f22a50504ea1073a51827dc09f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752513803;
 bh=iy4759aKpn50o1O4ss4GwbMdEiQjwFWEn6PNT94ocdk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u/sYR7fA5kuoXX+5m95SOghHN4i5BG87mcFhBYLW/aVLc61YYPeW32gN0WvuAKHUD
 wAvSs6xH6Qd/5GuJCDcw+bB7h7JRc0paxPUAEP7I3L7w5/gyUe8CEL5wtDWGvQm3RL
 T5rnEz3FtHpD8r+9pIO2WMEMCTpK2akx7Oa5Dplqg7Xi0BhIQBJk1x6lrMjTmX3xc/
 icvUwct4i2JaoxEHRaazEzRjOiq1g9AI7YOZm+/nBRKFvUXN8sRsvfMyLOpGj+R+En
 K1hDSam55/IcR24Upo0wJxd7tu2P+95Xu9J1vbl2EAd+n6xbK/8CG2aI5z5kbDjslm
 Hz4pT5/N3pdww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u/sYR7fA
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: require libxcrypt,
 allowing hashed passwords without PAM
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nathaniel,

Thanks for the patch!

On 14/07/2025 17:40, Nathaniel Roach via buildroot wrote:
> Per https://gitlab.com/buildroot.org/buildroot/-/issues/27 ,
> on builds without PAM, sudo will "fail" all password prompts.
> 
> It was found that it's simply checking the entered string against the
> raw hash, because 'libcryp' isn't available. That's provided by
> libxcrypt, so require it.
> 
> Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
> ---
>  package/sudo/Config.in | 1 +
>  package/sudo/sudo.mk   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
> index ee5ea542ab..85bc4859b8 100644
> --- a/package/sudo/Config.in
> +++ b/package/sudo/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_SUDO
>  	bool "sudo"
>  	# uses fork()
>  	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC

It is a bit odd to select BR2_PACKAGE_LIBXCRYPT if
BR2_TOOLCHAIN_USES_GLIBC is set (disregarding if
BR2_PACKAGE_LINUX_PAM is set or not) here...

>  	help
>  	  Sudo is a program designed to allow a sysadmin to give
>  	  limited root privileges to users and log root activity. The
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index f57a86805a..2d1f8d81c9 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -34,6 +34,7 @@ SUDO_DEPENDENCIES += linux-pam
>  SUDO_CONF_OPTS += --with-pam
>  SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_INSTALL_PAM_CONF
>  else
> +SUDO_DEPENDENCIES += libxcrypt

...then to add the dependency "SUDO_DEPENDENCY += libxcrypt"
only if BR2_PACKAGE_LINUX_PAM is set here.

This creates the case when we have a a glibc toolchains
and linux-pam enabled not bringing the libxcrypt dependency.
sudo will detect the libcrypt depending the build order.

Shouldn't we have instead a conditional block on libxcrypt,
outside the linux-pam conditional block? This is also the
usual pattern for handling glibc/libxcrypt. For example:

     ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
     SUDO_DEPENDENCIES += libxcrypt
     endif

I think it's better to always avoid this simple string
comparison fallback for password.

If you agree to this proposal, could you send an updated patch,
please?

While at it, could you also add a reference in the commit log
pointing to the relevant sudo code portion, e.g:
https://github.com/sudo-project/sudo/blob/v1.9.17p1/plugins/sudoers/auth/passwd.c#L139

>  SUDO_CONF_OPTS += --without-pam
>  endif
> 
> --
> 2.39.5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
