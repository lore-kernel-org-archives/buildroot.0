Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EB3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:32:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA87161250
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA87161250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35F8606CF;
	Sat, 16 Oct 2021 08:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLxb_URXrEtF; Sat, 16 Oct 2021 08:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 129486068B;
	Sat, 16 Oct 2021 08:32:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBBAF1BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8F9A4082E
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUBTBTCm9g2D for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:31:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD9F44050B
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:31:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 956F2780357;
 Sat, 16 Oct 2021 10:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634373065;
 bh=lJYSpE7uW0JcfwktGglnHcpqfRkeEQ8OugKWUbwixys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H6oBTaTHZtvtvIkKs31oQ4UFim/uHou9rrRU3+OAIRAqKjCQEp5OidKc9EtC6EVtr
 y3QFM+VoCgiMl9k/XGNh4IDKImajgXpCR5iKwE32Cf2hJAlp+KgyTPLgcDa/LZAyak
 IFX746mMxgUHnVIDHX6HRfFQe5Jabm3OSMBp0ZmmJ3r+UNaonAWghKaxqJYIzCCIuU
 OjFknMkBJ3r0iY+SjVtd1ZqnVK7rPX6r1rKts0ZV6mwejr0KUXMdKxVLWJughKQzDO
 qFUWmCFK3WdGMS0dj7H5R58ytnibORSyl5r2bcMa/j58m35TpWNiNdCYcWezfvw3L1
 8jgqFT3QswODw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:30:59 +0200
Date: Sat, 16 Oct 2021 10:30:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211016083059.GJ4165837@scaer>
References: <20211015195712.1548108-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015195712.1548108-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cloop: bump to version 3.14.1.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-15 21:57 +0200, Fabrice Fontaine spake thusly:
> Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cloop/cloop.hash | 8 ++++----
>  package/cloop/cloop.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
> index 7af1a9594d..eb922764bb 100644
> --- a/package/cloop/cloop.hash
> +++ b/package/cloop/cloop.hash
> @@ -1,6 +1,6 @@
> -# From http://snapshot.debian.org/archive/debian/20150503T155713Z/pool/main/c/cloop/cloop_3.14.1.2.dsc
> -sha256	ac344225b3a5c4ddbb0d4b20cd4874798b51427b707b53e2ee9fbdada7497c95	cloop_3.14.1.2.tar.xz
> +# From http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop/cloop_3.14.1.3.dsc
> +sha256  e3079e70f9edae8ed1ac64694af08f6c7dc710ca65a56e4770dcb1325a293193  cloop_3.14.1.3.tar.xz
>  
>  # Hash for license files
> -sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	advancecomp-1.15/COPYING
> -sha256	1b1f89e94e131e259b9e334565c5c3500d4b8aa755b75c3f145ddcdff3b89124	README
> +sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  advancecomp-1.15/COPYING
> +sha256  1b1f89e94e131e259b9e334565c5c3500d4b8aa755b75c3f145ddcdff3b89124  README
> diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
> index 046d98c862..f3c4954ead 100644
> --- a/package/cloop/cloop.mk
> +++ b/package/cloop/cloop.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -CLOOP_VERSION = 3.14.1.2
> +CLOOP_VERSION = 3.14.1.3
>  CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.xz
> -CLOOP_SITE = http://snapshot.debian.org/archive/debian/20150503T155713Z/pool/main/c/cloop
> +CLOOP_SITE = http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop
>  CLOOP_LICENSE = GPL-2.0 (module), GPL-2.0+ (advancecomp)
>  CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
>  
> -- 
> 2.33.0
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
