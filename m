Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF47C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 16:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4169F6115C
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 16:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4169F6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 033A060717;
	Sat, 16 Oct 2021 16:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09S1hHUFXtNp; Sat, 16 Oct 2021 16:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 677D660676;
	Sat, 16 Oct 2021 16:51:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3741B1BF5F6
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 16:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 268DB606BB
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 16:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flpR4PSbRsfG for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 16:51:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5B7160676
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 16:51:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6052:794b:b800:c2f1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id ED7E02003C1;
 Sat, 16 Oct 2021 18:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634403077;
 bh=UGidob1WFwSGicawYgHMCGManD0AvfvJtHnj+nJH9X0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=okVcB3l9ppHGgkXI7EdnpIFS+Vq03Y1pQAKyoeJ/nEaRaH2Pqzj2dWy7qOGae9+KN
 2ze2n0IKWVa2UvPBquHrlysEEzdFzTScTtigRA2BmCv6T7Txggi87Rfpdu70+kSllC
 esms1lSdc4lKe/KOZGsVFpi6GdW6Y+mCU6WTW9/B8TXvwuXd19WPOQhb5tZ5Es0fJG
 mBARVSJ7J5JaDYX7vwFfc9hlfqJ/BDNYuOmZSL8JORYoxljM7vgmOKJVk8Sy2P+tEO
 boi9uisuxxDJvJRkxB0ipTEpkfHtsEAUd/Advj8sC5wXWl9bZfgYJhIs4EptBrkGwS
 cbx+tfyBVESGA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 18:51:00 +0200
Date: Sat, 16 Oct 2021 18:51:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211016165100.GA2400@scaer>
References: <20211014225849.832479-1-aduskett@gmail.com>
 <20211014225849.832479-2-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014225849.832479-2-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 01/11] package/util-linux: bump to
 version 2.37.2
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2021-10-14 15:58 -0700, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

This fixes CVE-2021-37600, so I've added that to the commit log, and
applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/util-linux/util-linux.hash | 4 ++--
>  package/util-linux/util-linux.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> index 3f9fe39818..eafbe9254a 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -1,5 +1,5 @@
> -# From https://www.kernel.org/pub/linux/utils/util-linux/v2.36/sha256sums.asc
> -sha256  f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f  util-linux-2.36.2.tar.xz
> +# From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
> +sha256  6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9  util-linux-2.37.2.tar.xz
>  # License files, locally calculated
>  sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
>  sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 4bc7a11294..cf0fee409b 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -7,7 +7,7 @@
>  # When making changes to this file, please check if
>  # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
>  
> -UTIL_LINUX_VERSION_MAJOR = 2.36
> +UTIL_LINUX_VERSION_MAJOR = 2.37
>  UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
>  UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>  UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
> -- 
> 2.30.2
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
