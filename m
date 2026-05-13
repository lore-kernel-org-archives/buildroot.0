Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3739ACD37B6
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 03:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9D4A412F3;
	Wed, 13 May 2026 03:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Co66F_g8VK4; Wed, 13 May 2026 03:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C6DB412F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778644428;
	bh=6xS4VunUkkpErZbXEGR1C0UTrTgMa/BXNFfxEPxND+Q=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QJDZhh1cHEg77FkN3bKN5XPVwdoA2ffWnRCTFKAsOmZmEbm3IT9Vi7Cq8hCnXA7jj
	 XMAoktUSn4MMHDUuzshS5MT+6dlyi01vCOsM77jqphtHv6rdBermVtSMWWvIav0P5Y
	 msD88mlSz3g0F34ELTbro9f/5San0ejREzEnIA5HBzCXeXM1I3EKGcG3Ci87E33wi9
	 DASyug8lujb97V2bqXr4y259gJKrAgw1ns704uMhjAZlcHIlU+npr76iDKDvOFN26l
	 t0lmRf+CJjKWQ/lbsl9A8AveZu+gBMx6T5UetB9dN5BV6FT5jG4oxufbGOoFUZk0WJ
	 RsqQFRtpTfJ1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C6DB412F7;
	Wed, 13 May 2026 03:53:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD0F515F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 03:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2D5060E7B
 for <buildroot@buildroot.org>; Wed, 13 May 2026 03:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUimYxWRjr69 for <buildroot@buildroot.org>;
 Wed, 13 May 2026 03:53:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDAAF60E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDAAF60E60
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDAAF60E60
 for <buildroot@buildroot.org>; Wed, 13 May 2026 03:53:44 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id BCEED440529;
 Wed, 13 May 2026 06:53:13 +0300 (IDT)
To: Joseph Kogut <joseph@anodize.com>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260512-qemu-v11-0-0-v1-1-776ebffbb3af@anodize.com> (Joseph
 Kogut's message of "Tue, 12 May 2026 12:34:13 -0700")
References: <20260512-qemu-v11-0-0-v1-1-776ebffbb3af@anodize.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 13 May 2026 06:53:40 +0300
Message-ID: <87tsscyngb.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1778644393;
 bh=tWJEFNoJbUzgB04JwptYW9rxzDDe5nIyrMnip1LvYZU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=zZiuXu76ePLBgUbZjVqO/90LyPAEi9c1JShap2XhEt3yz9k5Xi56xSHAnnZO0YBID
 TqabJ+63nlsF+sygol5FeUa+ellZHQ9qhcHxHYZxnIlCSlWYeQISRAZnwNGQ0Ts/Od
 KBiMNXtVNoa7ciKVw4fYLHtAnprd8EvZ3GDX8mBKJrwauxuiS941KT6yB0jJ/aV/4J
 Xo8UnY2tzQlN8GYDnouyjDZmAfJe9E5TRhK44zZjSDnQ/Bv+tvnHYKdyzSpX7+zPDN
 2DlOyvtckZIW6o4D04GTPJ1nwAtjDQF/IC+3Xhff7uPf9JChNgfnQ00hnKZTc83v4u
 iboNIbjLqy4vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=zZiuXu76
Subject: Re: [Buildroot] [PATCH RESEND] package/qemu: bump to version 11.0.0
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

Hi Joseph,

On Tue, May 12 2026, Joseph Kogut wrote:
> Changelog:
> https://wiki.qemu.org/ChangeLog/11.0
>
> Note:
>   Support for all 32-bit host systems has been removed.
>
> Signed-off-by: Joseph Kogut <joseph@anodize.com>
> ---
>  package/qemu/Config.in | 5 +----
>  package/qemu/qemu.hash | 2 +-
>  package/qemu/qemu.mk   | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 0b16c8c284..c735381b4b 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -1,11 +1,8 @@
>  config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>  	bool
>  	# Only tested on these architectures
> +	default n if !BR2_ARCH_IS_64
>  	default y if BR2_aarch64
> -	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> -	default y if BR2_i386
> -	default y if BR2_mips
> -	default y if BR2_mipsel

qemu 11 dropped 32-bit host support as you mentioned in commit log. But
this config symbol indicates target support. qemu changelog does not
mention removal of all 32-bit targets.

baruch

>  	default y if BR2_powerpc64
>  	default y if BR2_powerpc64le
>  	default y if BR2_riscv
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index f8e750225f..7c7325a6ce 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,4 +1,4 @@
>  # Locally computed, tarball verified with GPG signature
> -sha256  9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a  qemu-10.2.0.tar.xz
> +sha256  c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6  qemu-11.0.0.tar.xz
>  sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
>  sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index b7007e3b98..61e44f069a 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, check whether the list of supported targets
>  # needs to be updated.
> -QEMU_VERSION = 10.2.0
> +QEMU_VERSION = 11.0.0
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = https://download.qemu.org
>  QEMU_SELINUX_MODULES = qemu virt
>
> ---
> base-commit: 9684cb9b4406e01683a9b5136100d81040d56aa0
> change-id: 20260512-qemu-v11-0-0-0862bf3b72cc
>
> Best regards,

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
