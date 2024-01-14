Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF59C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 11:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 880E1418E0;
	Sun, 14 Jan 2024 11:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880E1418E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uh0WvmvBJYdi; Sun, 14 Jan 2024 11:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53BD418EE;
	Sun, 14 Jan 2024 11:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D53BD418EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4691BF2A3
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 646BA418C2
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 646BA418C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUpqNelWfF_6 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 11:13:24 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AF3F418EE
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 11:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AF3F418EE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8F8B013F879;
 Sun, 14 Jan 2024 12:13:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 12:13:19 +0100
Date: Sun, 14 Jan 2024 12:13:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaPBzzhxbG6YmQgR@landeda>
References: <20240114101402.5633-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240114101402.5633-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705230802;
 bh=t1yd13cSU1iXbziDj14YIOSonqRfFZd6xC7fa+Zs9yY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mlhPW0KxrosMxuzdJ6bh4Nz4m4JpTx8l7gCdpN4ExQUud1smeOaJpAs8PxuIWaVxG
 UYsMb5IeRUeg+9fiu4KjcTiEtGIWVVkbB9CLk+rVVCNPATQhjbHQJoBiuLSTgW9c+9
 MEZDzipH56fLbJnBaUwG/UWUsqLjh+Y9qMiOTqLHxes31LSDB87UhtlqxL7ZHxguBt
 9C2gz0H3QbcQWKoYv3vz3En9YVXMi2hzrrRaeI0c3YaX9kvpK+/bjntkKewyS3/vZ1
 gS88+wSOVRryWIJdc+BN0SHHE3ze26/Hjgr7YZQOCovFljJUpKNJp71FY/c2bIBDEV
 /LYhsGItA3DKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mlhPW0Kx
Subject: Re: [Buildroot] [PATCH 1/1] package/libkcapi: fix legal info
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
Cc: Tan En De <ende.tan@starfivetech.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-14 11:14 +0100, Fabrice Fontaine spake thusly:
> Commit e6af32c08c8d47a71d6f8fa48439f3d87dcef2f6 forgot to update hash of
> COPYING (update in year:
> https://github.com/smuellerDD/libkcapi/commit/fc937358e71253a6efaa3ba74885364976b040ea)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/823c89ed3ac3f12e64a22bd88e193a5be28c34e5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libkcapi/libkcapi.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
> index 691ef0977a..172b6cbcc7 100644
> --- a/package/libkcapi/libkcapi.hash
> +++ b/package/libkcapi/libkcapi.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
>  sha256  15b550c14165a266fa233b485d029d54508da593dfa6d1731ec5d5a285c716e9  libkcapi-1.5.0.tar.xz
> -sha256  9765fad61726afb2b253db2c68153672e4178d6809667ae98141f3e90fe8645b  COPYING
> +sha256  00e0a844d67b190580a9dc5943e555a3d0b2158e21d01a25526762c619979326  COPYING
>  sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
>  sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
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
