Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E720C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB6AD40330;
	Sun, 30 Oct 2022 16:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB6AD40330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0EZu8BNTodJ; Sun, 30 Oct 2022 16:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96A6340281;
	Sun, 30 Oct 2022 16:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96A6340281
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA301BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E734B403A2
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E734B403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3Hi2T-sOASR for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:17:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7D44011F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD7D44011F
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:17:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0BBF113F85F;
 Sun, 30 Oct 2022 17:17:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:17:00 +0100
Date: Sun, 30 Oct 2022 17:17:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030161700.GK1058960@scaer>
References: <20221028215325.278206-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028215325.278206-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667146623;
 bh=YzDvCvJMfMIUjOe2KvO86ymyO1jyO0vJjVXdKWuj2j4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aM59Ug/v/KACXbLGxXWpJh0q5g0FEIe3QnPGBI4JLa+Z0m/CDTO8q7Y2JPlVe0gEX
 lfc8gl1FU14AYNl0tKV5fDgGrwv4Nlb199mUmhghuwn/32c0ovWHuyPtyq3FrlOgEy
 cJC2yupYfbSTBC+iilttHmBpUjVeLpqobyArPUsp5EeDIdHaA/DlUfQ4ucpUsEFTBk
 qAPsyZbqJvde2lMX9kN47KWW+zUXVIyHryy0/c76n4r6ccKCw9O8aeKX1xyyfFwo0D
 CBMQrnBmnbSCCGH/0AnDoN5mSiAoivDLKcD9NiVDRupsIjqfUkeFimdDPTIIMunoOb
 1TZlSDSxdVqBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aM59Ug/v
Subject: Re: [Buildroot] [PATCH 1/1] package/smartmontools: bump to version
 7.3
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

On 2022-10-28 23:53 +0200, Fabrice Fontaine spake thusly:
> https://github.com/smartmontools/smartmontools/releases/tag/RELEASE_7_3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/smartmontools/smartmontools.hash | 8 ++++----
>  package/smartmontools/smartmontools.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
> index 3c5535b29a..e48e955d01 100644
> --- a/package/smartmontools/smartmontools.hash
> +++ b/package/smartmontools/smartmontools.hash
> @@ -1,7 +1,7 @@
> -# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.2/
> -md5  e8d134c69ae4959a05cb56b31172ffb1  smartmontools-7.2.tar.gz
> -sha1  8d68241096f6ed5b1bbcd8b427fa4a881c1f3e33  smartmontools-7.2.tar.gz
> +# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.3/
> +md5  7a71d388124e3cd43abf6586a43cb1ff  smartmontools-7.3.tar.gz
> +sha1  5ce7adb606119148d725b91a00652d427ca0adc2  smartmontools-7.3.tar.gz
>  
>  # Locally computed
> -sha256  5cd98a27e6393168bc6aaea070d9e1cd551b0f898c52f66b2ff2e5d274118cd6  smartmontools-7.2.tar.gz
> +sha256  a544f8808d0c58cfb0e7424ca1841cb858a974922b035d505d4e4c248be3a22b  smartmontools-7.3.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
> index 2e2bbcd4e2..d24f008df4 100644
> --- a/package/smartmontools/smartmontools.mk
> +++ b/package/smartmontools/smartmontools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SMARTMONTOOLS_VERSION = 7.2
> +SMARTMONTOOLS_VERSION = 7.3
>  SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
>  SMARTMONTOOLS_LICENSE = GPL-2.0+
>  SMARTMONTOOLS_LICENSE_FILES = COPYING
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
