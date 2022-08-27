Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EA5ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B964404F5;
	Sat, 27 Aug 2022 07:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B964404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGxAeq03GLdC; Sat, 27 Aug 2022 07:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31FBD404EB;
	Sat, 27 Aug 2022 07:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31FBD404EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC761BF267
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38A0582813
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A0582813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7V3x84RVjTS3 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:59:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30C9082779
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30C9082779
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:59:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 52EFD19F743;
 Sat, 27 Aug 2022 09:59:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:59:26 +0200
Date: Sat, 27 Aug 2022 09:59:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075926.GO37358@scaer>
References: <20220826212254.37425-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826212254.37425-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661587168;
 bh=SlbGJDlBFhA/cfoctIk/n6h0mGxgbfLshEg+UtAoALI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DAaOqQ5IKELZpr096t2UvkaJ3Vm6Qop4aL67DymnFHbATSAzmKXFsiYlAoirczzJS
 KVEafQhttDAaFuTrGUmZUdoKhJLX/8kQjwR3lu5y3ujFrLzd6ySpniHIIfy5HSPBt+
 r3r+n2dLQtnlSJXSic1lwZe4xQw6rFXZOHMOq4JumKM3dQen2IYS+mF6j7YiZfVA26
 XbMuFpMBdgBcJfxS2DOmrqy8/wH0Ai2wvY45p1jPmlscmrfU6C15ftK5nYH7gIAvl/
 KpKeWnsgEOE1QDIU4X/rMdR20I44FaOkdrtlUJSGe+RgbsIeKV/nFNy9HbQePBbsJ4
 Tys2CsZlyFukA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DAaOqQ5I
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: security bump to version
 5.6
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

On 2022-08-26 23:22 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2021-46784: In Squid 3.x through 3.5.28, 4.x through 4.17, and
> 5.x before 5.6, due to improper buffer management, a Denial of Service
> can occur when processing long Gopher server responses.
> 
> https://github.com/squid-cache/squid/security/advisories/GHSA-f5cp-6rh3-284w
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/squid/squid.hash | 8 ++++----
>  package/squid/squid.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/squid/squid.hash b/package/squid/squid.hash
> index e18ed8961e..22c6db8c70 100644
> --- a/package/squid/squid.hash
> +++ b/package/squid/squid.hash
> @@ -1,6 +1,6 @@
> -# From http://www.squid-cache.org/Versions/v5/squid-5.3.tar.xz.asc
> -md5  9249f30169ab6600e53b4f9b8129b3b0  squid-5.3.tar.xz
> -sha1  d3a8310c725616fa7565d60f3bf8fdf5fa20b15a  squid-5.3.tar.xz
> +# From http://www.squid-cache.org/Versions/v5/squid-5.6.tar.xz.asc
> +md5  2f2201a18a0a727ab589d951ebe4f815  squid-5.6.tar.xz
> +sha1  a01f47b3e9ff06245c894773de30bfd88ab14f65  squid-5.6.tar.xz
>  # Locally calculated
> -sha256  45178588df1311ded41ebadd632840c4d93a8d7f5f60e38e74acf2f1ae2f1715  squid-5.3.tar.xz
> +sha256  38d27338a347597ce0e93d0c3be6e5f66b6750417c474ca87ee0d61bb6d148db  squid-5.6.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index 3847fb49dc..86a0c714c6 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SQUID_VERSION = 5.3
> +SQUID_VERSION = 5.6
>  SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
>  SQUID_SITE = http://www.squid-cache.org/Versions/v5
>  SQUID_LICENSE = GPL-2.0+
> -- 
> 2.35.1
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
