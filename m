Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E431C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 13:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29F24095E;
	Sun, 12 Jul 2026 13:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUEjM5kPZP9t; Sun, 12 Jul 2026 13:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B7040A22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783862254;
	bh=TYNIj6LEd9jA94sgEugcmx+wb77Qvn96n2vxwgLlkCQ=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JKyC6UVGdnLwqZUfBkEJI4Yy5/cvU/vzr9kSgJJ8lS+Upm6Yg43SAKjMHe4wc5FU7
	 Sfnn3NWaEBtDEUT/9rrbr4xDY/aeOX0BmO6F1Iu/jXEVspX6HD5XlubdfXye1tp+yr
	 GV6W2PGAJ2nDP75B27BrHhfRLwWwEhFAUxRXlD/2wiC2B1cYyT2kRvJvlgwm0DsP3z
	 uWKEGPzrrHdmjq9PZr9sTn5GP5oelsXQJ5MICT/mA0qq9uAa0wpor4z7cytuhEBJpA
	 Qve0ayCyDXOTzIbANQsno994FZxqOQQzq2VrjUpOhq5BQvI4H6RpfQrIUr8AIWoLeD
	 caC5sXwupSdRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B7040A22;
	Sun, 12 Jul 2026 13:17:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A037C359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DA2740199
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVv2-KYC3qzA for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 13:17:32 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50D5840108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D5840108
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50D5840108
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:17:32 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id E7B4B44064C;
 Sun, 12 Jul 2026 16:17:21 +0300 (IDT)
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260712001013.101890-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Sun, 12 Jul 2026 02:10:12 +0200")
References: <20260712001013.101890-1-fiona.klute@gmx.de>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Sun, 12 Jul 2026 16:17:28 +0300
Message-ID: <87mrvw2vpz.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1783862241;
 bh=UU+hi4NlEKIwbYbPTee/cs7VLlKhJ12tpeptaDI5f0g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mHl3AFr2A92Ce/iQtmzqhdwRpxJfudJkN4RI1cdMwtsmJaQqz6C9LTwRt/TlCSYlV
 xKahp6ldz4iVm9pma4PsRMc6VqT6ewR3Hjza+t/o4gCcyZoE00adflLeFkMZ2QyNTP
 Rd2w4WeDD5zI9l2iM75+90iHW4IyoYE9MEE0yXvf4WXxdYUaQNacyi2TP+j5JIzZuT
 YUgkTc4bk+TxGxB6bgewLGbIfmZOttPq3mqkq+lbtt2NUmLdqsyBZVXDwQ0j1s3LuR
 8tNSJDUJ6OefrOyCqH6gS2x+bg9Ujof0rymRm9MMxJp1Hqca+fY+wx/WROXcd8Oo+F
 BT1yslbA1lW+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=mHl3AFr2
Subject: Re: [Buildroot] [PATCH 1/2] package/fakeroot: bump to version 2.1.4
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

Hi Fiona,

On Sun, Jul 12 2026, Fiona Klute via buildroot wrote:
> The source archive does not contain a pre-build configure script any
> more, so enable autoreconf. Fakeroot also contains an experimental
> Meson build definition since 2.1.
>
> Since v6.10.1 btrfs-progs uses nftw() [1], which package/fakeroot did
> not support before v2.0 [2]. This update allows updating btrfs-progs
> past v6.10 without breaking build of btrfs rootfs images.
>
> Upstream changes:
> https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.2...upstream%2F2.1.4
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit?id=c6464d3f99ed1dabceff1168eabb207492c37624
> [2] https://salsa.debian.org/clint/fakeroot/-/commit/3502c515c73ee02e7f557e6a3bfc1af675dd3d34
>
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
> I mentioned the Meson build definition for completeness, switching the
> package to it should wait until it's no longer experimental.

I think this should be mentioned the commit message itself.

>  package/fakeroot/fakeroot.hash | 6 +++---
>  package/fakeroot/fakeroot.mk   | 8 +++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
> index 82a6214380..0c330b7792 100644
> --- a/package/fakeroot/fakeroot.hash
> +++ b/package/fakeroot/fakeroot.hash
> @@ -1,5 +1,5 @@
> -# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
> -sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
> -sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
> +# From https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot/fakeroot_2.1.4-1.dsc
> +sha1  9d55e62a34612316058166f7c528d9fc2f30c719  fakeroot_2.1.4.orig.tar.xz
> +sha256  0822bd5a9f0cf19d2ba0546b88b0432d4d3d9917db62c57b74044ccadba06e49  fakeroot_2.1.4.orig.tar.xz
>  # License files, locally calculated
>  sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
> diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
> index 12d7f1c4a1..216c62bc52 100644
> --- a/package/fakeroot/fakeroot.mk
> +++ b/package/fakeroot/fakeroot.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -FAKEROOT_VERSION = 1.37.2
> -FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
> -FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
> +FAKEROOT_VERSION = 2.1.4
> +FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.xz
> +FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot
>  
>  HOST_FAKEROOT_DEPENDENCIES = host-acl
>  # Force capabilities detection off
> @@ -18,4 +18,6 @@ HOST_FAKEROOT_CONF_ENV = \
>  FAKEROOT_LICENSE = GPL-3.0+
>  FAKEROOT_LICENSE_FILES = COPYING
>  
> +FAKEROOT_AUTORECONF = YES

We usually also add an inline comment that documents why autoreconf is
needed.

baruch

> +
>  $(eval $(host-autotools-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
