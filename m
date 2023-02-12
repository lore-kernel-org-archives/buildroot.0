Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2786C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79F9B8140F;
	Sun, 12 Feb 2023 20:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F9B8140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXl-HSKiGEAE; Sun, 12 Feb 2023 20:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD455813FA;
	Sun, 12 Feb 2023 20:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD455813FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 045961BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1309D813FA
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1309D813FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51pMiuhhKSWQ for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:49:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2362F8174D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2362F8174D
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:49:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5611E5FFA8;
 Sun, 12 Feb 2023 21:49:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:49:00 +0100
Date: Sun, 12 Feb 2023 21:49:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20230212204900.GV2796@scaer>
References: <20230212014216.6293-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212014216.6293-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676234944;
 bh=AYmVbWAWSpcvHYNrCDu8mQQo+wghfsN2aq/JarGIDi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qzPvuj9MHqjn1QUh9hFhek8p1OIV0890omx6DDQ5YZ5ln0gRI3f9rrwskotLMXl57
 qIK9DjTZRDPDQNMISPNbwfGdN6FvSKewxE/KPl8RV8glXCU6EV4fcd+//1N6qH8x2o
 mi175c6+ZO7zurClUVarDJFIxSFHEHymwba3Yk/i7bj1wILwWeSvnwSEHErX1kHpNk
 GrP+0zO3A4I5X5yadoySOyc1cYih/d2WgDp5DV8kqTcV0q78JbeEx4NV0WJla4QNg+
 0pfkOOQIo6oMfdabgNUUfsFzTgNfB8FhnrnTWnHLtAeqZ2SI8xBaqvVJw44v8lL3VE
 0DyEPa4u1BvVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qzPvuj9M
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8723ds: bump to 2023-02-11
 version with new license file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-02-11 17:42 -0800, Christian Stewart via buildroot spake thusly:
> A COPYING file has been added to rtl8723ds as of the most recent commit.
> 
> Update the version of the package and add the license file hash.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rtl8723ds/rtl8723ds.hash | 3 ++-
>  package/rtl8723ds/rtl8723ds.mk   | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
> index d5abf9913c..e94a7b40ef 100644
> --- a/package/rtl8723ds/rtl8723ds.hash
> +++ b/package/rtl8723ds/rtl8723ds.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
> -sha256  97f3ebc5d977ba35d10c9c06e6817e4a00458727b651b56fc00c207c05a61995  rtl8723ds-a638cc8639015b8b9390af3350fab0366b6c87e7.tar.gz
> +sha256  672787c3f3d1f795b750cd74de8ca34bb661b8ae60f5aa50fb279ec08ff3f05f  rtl8723ds-ec85dc6b9f72bfe413bff464ed01a272e29c8dbe.tar.gz
> +sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
> index f303a24041..1bb164fa86 100644
> --- a/package/rtl8723ds/rtl8723ds.mk
> +++ b/package/rtl8723ds/rtl8723ds.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -RTL8723DS_VERSION = a638cc8639015b8b9390af3350fab0366b6c87e7
> +RTL8723DS_VERSION = ec85dc6b9f72bfe413bff464ed01a272e29c8dbe
>  RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
>  RTL8723DS_LICENSE = GPL-2.0
> +RTL8723DS_LICENSE_FILES = COPYING
>  
>  RTL8723DS_USER_EXTRA_CLAGS = \
>  	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
> -- 
> 2.39.1
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
