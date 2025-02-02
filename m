Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88366C0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 18:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D7360612;
	Sun,  2 Feb 2025 18:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2CYy3g9dbpe; Sun,  2 Feb 2025 18:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A15160604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A15160604;
	Sun,  2 Feb 2025 18:12:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 624AD185
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 18:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E83C40169
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 18:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pC4lKIdo2Nkz for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 18:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3796640153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3796640153
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3796640153
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 18:12:39 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id BD80B4408FC;
 Sun,  2 Feb 2025 20:07:25 +0200 (IST)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z5+uE18qBlzcrWQC@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sun, 2 Feb 2025 18:40:35 +0100")
References: <Z5+uE18qBlzcrWQC@waldemar-brodkorb.de>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Sun, 02 Feb 2025 20:12:35 +0200
Message-ID: <87frkwz04s.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1738519645;
 bh=tP3g3FMaOffHC4/JaeYx5IYuXIK2VpZa5DCu9RNtWvo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dS628YRKCWX6sLnIW4hkBsXRLYOxdqae5L9eXVPA7EGnE1i/HDAwGTOWGkC+W1kAo
 yGifU8I0hVKglfqM4ksvDqXp4Ooi464jfdolzCbi10kn09CcArKzw62yP+HriUiDT0
 kfIl+tUOFzaJN4ejKXvUDmKII1u5srZM4o8JA/tMmNpA/3G3gYcMNIQmz6oHMdtJQy
 LTuM6Y3/uF6O36Ta99YH1CRIsSQ+zhOCcUNJtuMvjF8qfV5zWnFIA2u/JGZIdAYQXo
 u5PQpS1c8CCysb59q7QlA67WDhspVkQsEfj8DVvd4glOLjiypiFqXILf2nXR1NsJY8
 bSOcgLDezUvLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=dS628YRK
Subject: Re: [Buildroot] [PATCH] package/squid: update to 6.13
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

Hi Waldemar,

On Sun, Feb 02 2025, Waldemar Brodkorb wrote:
> See here for changes:
> https://github.com/squid-cache/squid/releases/tag/SQUID_6_11
> https://github.com/squid-cache/squid/releases/tag/SQUID_6_12
> https://github.com/squid-cache/squid/releases/tag/SQUID_6_13
>
> Download URL moved to Github.
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/squid/squid.hash | 5 +----
>  package/squid/squid.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/package/squid/squid.hash b/package/squid/squid.hash
> index e0dede862a..df52a3be16 100644
> --- a/package/squid/squid.hash
> +++ b/package/squid/squid.hash
> @@ -1,6 +1,3 @@
> -# From http://www.squid-cache.org/Versions/v6/squid-6.10.tar.xz.asc
> -md5  86deefa7282c4388be95260aa4d4cf6a  squid-6.10.tar.xz
> -sha1  70e90865df0e4e9ba7765b622da40bda9bb8fc5d  squid-6.10.tar.xz
>  # Locally calculated
> -sha256  0b07b187e723f04770dd25beb89aec12030a158696aa8892d87c8b26853408a7  squid-6.10.tar.xz
> +sha256  232e0567946ccc0115653c3c18f01e83f2d9cc49c43d9dead8b319af0b35ad52  squid-6.13.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index bfb3664082..021d21430d 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -SQUID_VERSION = 6.10
> +SQUID_VERSION = 6.13
>  SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
> -SQUID_SITE = http://www.squid-cache.org/Versions/v6
> +SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_6_13

You can use the subst macro to avoid version number duplication (untested):

SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))

baruch

>  SQUID_LICENSE = GPL-2.0+
>  SQUID_LICENSE_FILES = COPYING
>  SQUID_CPE_ID_VENDOR = squid-cache

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
