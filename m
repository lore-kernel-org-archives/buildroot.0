Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5653BC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D282640AD5;
	Tue, 26 Dec 2023 21:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D282640AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fYHC5fkDoCSi; Tue, 26 Dec 2023 21:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB24940A95;
	Tue, 26 Dec 2023 21:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB24940A95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 623DF1BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 816FB81EA1
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 816FB81EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLyBzvkwjEDY for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:06:55 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FC4581E8E
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC4581E8E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3EF6FB0055E;
 Tue, 26 Dec 2023 22:06:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 22:06:49 +0100
Date: Tue, 26 Dec 2023 22:06:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYtAaU1oyaF_va4K@landeda>
References: <20231226203423.1243592-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226203423.1243592-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703624812;
 bh=fH7Z4UmIQvi3ZqWcY6rfuFSfPFqW1CxRhQBPjqWtk8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G16974yfvOQR5Sve7gBJ6cs29csQK5MVpR3RyqmFSgGwKWPptq2QgbE1p0OUxZC5u
 oOxkUUPJnNx+yQyUoGLeE03X0V3jgsyGfoyjbQchCiW0dF6WqoMysevyfoqx3kJs07
 p54sip5hCPuceM1etFHgS5b0fts04YaBWaIJqW0PfDpXLwGaTxcR663HLlyOi4ZdZl
 yQx3IfmFR2y7VAoq2UxtvMC+vvEtQdGh3fABXL16oSBNQqwSoXLfGCMbmV05SzHKPV
 jm7nspO5v5lpgJQtHDfsc/JTC+XwOoieX2M183MEapEGiiAGMbbKEWpOTNo0AK5q7w
 NMr01/H0gnBLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G16974yf
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: security bump to version
 6.6
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-26 21:34 +0100, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - Fix CVE-2023-50269: This problem allows a remote client to perform
>   Denial of Service attack by sending a large X-Forwarded-For header
>   when the follow_x_forwarded_for feature is configured.
> 
> https://github.com/squid-cache/squid/security/advisories/GHSA-wgq4-4cfg-c4x3
> https://github.com/squid-cache/squid/blob/SQUID_6_6/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-ESI-build-with-libxml2-v2.12.0-1600.patch | 32 -------------------
>  package/squid/squid.hash                      |  8 ++---
>  package/squid/squid.mk                        |  2 +-
>  3 files changed, 5 insertions(+), 37 deletions(-)
>  delete mode 100644 package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
> 
> diff --git a/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch b/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
> deleted file mode 100644
> index fcbdcc1749..0000000000
> --- a/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From c9b3edc1396925aa7eca3d3cc6c798806286a974 Mon Sep 17 00:00:00 2001
> -From: bkuhls <bkuhls@users.noreply.github.com>
> -Date: Sun, 26 Nov 2023 15:09:21 +0000
> -Subject: [PATCH] Bug 5328: Fix ESI build with libxml2 v2.12.0 (#1600)
> -
> -    Libxml2Parser.cc:147:40: error: invalid conversion from
> -    'const xmlError*' to 'xmlErrorPtr' {aka 'xmlError*'} [-fpermissive]
> -
> -libxml2 recently made xmlGetLastError() return a constant object.
> -
> -Upstream: https://github.com/squid-cache/squid/commit/c9b3edc1396925aa7eca3d3cc6c798806286a974
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - src/esi/Libxml2Parser.cc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/esi/Libxml2Parser.cc b/src/esi/Libxml2Parser.cc
> -index f03752885..236a37433 100644
> ---- a/src/esi/Libxml2Parser.cc
> -+++ b/src/esi/Libxml2Parser.cc
> -@@ -144,7 +144,7 @@ ESILibxml2Parser::lineNumber() const
> - char const *
> - ESILibxml2Parser::errorString() const
> - {
> --    xmlErrorPtr error = xmlGetLastError();
> -+    const auto error = xmlGetLastError();
> - 
> -     if (error == nullptr)
> -         return nullptr;
> --- 
> -2.43.0
> -
> diff --git a/package/squid/squid.hash b/package/squid/squid.hash
> index a163bd9ad3..4a8ea5d550 100644
> --- a/package/squid/squid.hash
> +++ b/package/squid/squid.hash
> @@ -1,6 +1,6 @@
> -# From http://www.squid-cache.org/Versions/v6/squid-6.5.tar.xz.asc
> -md5  da2797d899cf538fab7f504fdf3c18bf  squid-6.5.tar.xz
> -sha1  07a08394625948750264778c82e19cf24ea7cb1f  squid-6.5.tar.xz
> +# From http://www.squid-cache.org/Versions/v6/squid-6.6.tar.xz.asc
> +md5  5a41134ee1b7e75f62088acdec92d2ca  squid-6.6.tar.xz
> +sha1  f05e06a9dd3bf7501d2844e43d9ae1bd00e9edcc  squid-6.6.tar.xz
>  # Locally calculated
> -sha256  5070f8a3ae6666870c8fc716326befb0a1abe8b5ff3a6f3932cbc5543d7c8549  squid-6.5.tar.xz
> +sha256  55bd7f9f4898153161ea1228998acb551bf840832b9e5b90fc8ecd2942420318  squid-6.6.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index c1477b1adf..3a9edac71e 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SQUID_VERSION = 6.5
> +SQUID_VERSION = 6.6
>  SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
>  SQUID_SITE = http://www.squid-cache.org/Versions/v6
>  SQUID_LICENSE = GPL-2.0+
> -- 
> 2.43.0
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
