Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD28CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2C44403AE;
	Fri, 15 Sep 2023 21:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2C44403AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9kO4M2qF-r1; Fri, 15 Sep 2023 21:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1BF4419D1;
	Fri, 15 Sep 2023 21:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1BF4419D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39CE51BF29D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1360F613DE
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1360F613DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOLMbHnuZhLG for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:24:24 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1070A613D9
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1070A613D9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B2DF22003D3;
 Fri, 15 Sep 2023 23:24:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:24:18 +0200
Date: Fri, 15 Sep 2023 23:24:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230915212418.GG2571@scaer>
References: <20230915170412.855864-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915170412.855864-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694813062;
 bh=sNLCV+vqEwaFtRqWfs2k62JcgYi/b13m40zDjE592+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeDtCzzbjPvr3Xz3cbDWBJVbYH0zMeJ+ugDKJyWzPwe4DLCJK5O8YubdZ4TlAWGR1
 LzfwE//C83sSuhouGvLkaGNca24MsuuukiCXd63xVNXJUbadJErpybUqkmGGrJpZiM
 qZaZr0lAlB9zcVz9OR1UwGkfbCid00XpLXcCWcjMhfwHMhLnFyOA+3j6Yqxo0NMLMi
 73UokBIkM96pJsEJ73LSVCIH0RJqyxpswOvNPF6qk7mux8yzdQtsYZii8sz/s+MwwD
 3mqym5WzS85YvIe2TDKLTnKUaBU8UXUVDrhUurxvE/vr8kDDgdnGhQZ2VnyYmqBbnl
 zyd5Cm/b3Rysg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KeDtCzzb
Subject: Re: [Buildroot] [PATCH 1/1] package/hwlock: security bump to
 version 2.9.3
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-15 19:04 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2022-47022: An issue was discovered in open-mpi hwloc 2.1.0
> allows attackers to cause a denial of service or other unspecified
> impacts via glibc-cpuset in topology-linux.c.
> 
> https://github.com/open-mpi/hwloc/blob/hwloc-2.9.3/NEWS
> https://github.com/open-mpi/hwloc/compare/hwloc-2.9.2...hwloc-2.9.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/hwloc/hwloc.hash | 4 ++--
>  package/hwloc/hwloc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
> index d40315a3af..8010b857f0 100644
> --- a/package/hwloc/hwloc.hash
> +++ b/package/hwloc/hwloc.hash
> @@ -1,5 +1,5 @@
>  # From https://www.open-mpi.org/software/hwloc/v2.9/
> -sha1  be2a4f299c0da7670d39724986268bfa3fac6aee  hwloc-2.9.2.tar.bz2
> -sha256  0a87fdf677f8b00b567d229b6320bf6b25c693edaa43e0b85268d999d6b060cf  hwloc-2.9.2.tar.bz2
> +sha1  76b49087619b46d71e18bd1131d35a5ccf5de791  hwloc-2.9.3.tar.bz2
> +sha256  5c4062ce556f6d3451fc177ffb8673a2120f81df6835dea6a21a90fbdfff0dec  hwloc-2.9.3.tar.bz2
>  # Locally computed
>  sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
> diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
> index f6cf5433c4..0524ec17fd 100644
> --- a/package/hwloc/hwloc.mk
> +++ b/package/hwloc/hwloc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  HWLOC_VERSION_MAJOR = 2.9
> -HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).2
> +HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).3
>  HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
>  HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
>  HWLOC_LICENSE = BSD-3-Clause
> -- 
> 2.40.1
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
