Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72315C282D1
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 08:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F7D605E0;
	Sun,  9 Mar 2025 08:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P20KHlnS6bVU; Sun,  9 Mar 2025 08:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 324C46064D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 324C46064D;
	Sun,  9 Mar 2025 08:15:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8854EDC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 772C9406E7
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9qy2YzH_bnV for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 08:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F200040712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F200040712
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F200040712
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:15:40 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 0AAF5440FA2;
 Sun,  9 Mar 2025 10:15:34 +0200 (IST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250309080905.25158-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 9 Mar 2025 09:09:05 +0100")
References: <20250309080905.25158-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Sun, 09 Mar 2025 10:15:32 +0200
Message-ID: <874j02d3h7.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
Subject: Re: [Buildroot] [PATCH/next 1/1] package/dropbear: bump version to
 2025.87
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

Hi Bernd,

On Sun, Mar 09 2025, Bernd Kuhls wrote:
> Changelog: https://matt.ucc.asn.au/dropbear/CHANGES

CHANGES says:

- >> Disable SHA-1 algorithms by default. SHA-1 has known weakness and
  most implementations support alternatives.

Can we enable SHA-1 when BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is enabled?

baruch

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index cf2dd18d61..777910da15 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e  dropbear-2024.86.tar.bz2
> +sha256  738b7f358547f0c64c3e1a56bbc5ef98d34d9ec6adf9ccdf01dc0bf2caa2bc8d  dropbear-2025.87.tar.bz2
>  
>  # License file, locally computed
>  sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e043893aa1..4a3931fd18 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2024.86
> +DROPBEAR_VERSION = 2025.87
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
