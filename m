Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626ABFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E752E60B33;
	Mon, 31 Oct 2022 10:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E752E60B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObD8vrxJTQQr; Mon, 31 Oct 2022 10:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B0D60B3D;
	Mon, 31 Oct 2022 10:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00B0D60B3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97EB61BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D10B60881
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D10B60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsv0kbF2bTDY for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:58:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E72605AB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92E72605AB
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:58:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C8C21B005A9;
 Mon, 31 Oct 2022 10:58:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 10:58:32 +0100
Date: Mon, 31 Oct 2022 10:58:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031095832.GP1058960@scaer>
References: <20221030221121.474743-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030221121.474743-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210316;
 bh=iuHyuLXuMx0IpCJZJgX3vKBUqMM55ad4m566iAz1/oA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D7JyMxdbhLzeFd3iQ4VXPtqrAUWc39ZfBGqdbuan0dPmSCycQ2ZpLgQR4JA6AuuFM
 EPguzcqDQsGh9qKDatRXagkanTwk6FBiMpXBj3/b46HM9zwxLKLE2G1S5pygACghTX
 VOzGuoD5YEcyjxI/sQ7bD2QIci9vc14swvEpyDv1bfkUYgtkHdnsSFfgajOr4Q6uDH
 d273N2Is09pKIinIVIbeXpOxHPRYin64dKiG90Gr+9qlL8zgnvIVovJOUu6Em7NG2t
 vFCIshMha90pAZ3iLWA/dFDWQz36kvhBXB60ev2b3hGv8hFOAY/U0ib66qhj0V4vzg
 1VU8flMVSiWYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D7JyMxdb
Subject: Re: [Buildroot] [PATCH 1/1] package/igmpproxy: bump to version 0.4
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-30 23:11 +0100, Fabrice Fontaine spake thusly:
> https://github.com/pali/igmpproxy/releases/tag/0.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/igmpproxy/igmpproxy.hash | 2 +-
>  package/igmpproxy/igmpproxy.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/igmpproxy/igmpproxy.hash b/package/igmpproxy/igmpproxy.hash
> index 238de67e88..a7e1a065d9 100644
> --- a/package/igmpproxy/igmpproxy.hash
> +++ b/package/igmpproxy/igmpproxy.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  d1fc244cb2fbbf99f720bda3e841fe59ece9b6919073790b4b892739b1b844eb  igmpproxy-0.3.tar.gz
> +sha256  afa4b75a823b82f71ce99f33eae4e8136b906ae8a5ede5caaad93bac38cdae24  igmpproxy-0.4.tar.gz
>  sha256  be3d05af93dbbc4650f8d641d8e1bec220af4a729e07ba71e949c25b93a1b4f6  COPYING
>  sha256  c4f65d5d396ad518a37d30b83fe33897661858dc174ff64a15d0461630ce64e4  GPL.txt
>  sha256  4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  Stanford.txt
> diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
> index 6a6b56afa0..357c9087e0 100644
> --- a/package/igmpproxy/igmpproxy.mk
> +++ b/package/igmpproxy/igmpproxy.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IGMPPROXY_VERSION = 0.3
> +IGMPPROXY_VERSION = 0.4
>  IGMPPROXY_SITE = \
>  	https://github.com/pali/igmpproxy/releases/download/$(IGMPPROXY_VERSION)
>  IGMPPROXY_AUTORECONF = YES
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
