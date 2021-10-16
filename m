Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4FEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:31:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB55560F93
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB55560F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95781606A7;
	Sat, 16 Oct 2021 08:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duMqpBbdbust; Sat, 16 Oct 2021 08:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB326068B;
	Sat, 16 Oct 2021 08:31:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBB541BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8C0C83B63
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5EFHtgBLL-Mh for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:30:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC9CC83B62
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:30:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C8CF7780346;
 Sat, 16 Oct 2021 10:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634373004;
 bh=ElbKutjifw1BFJzhAMPBXW5e29ksJNCpIB/sQp+dQYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GLvtRmI9DlpPsDV71/ucty0yNYWes6wYPKHs/bm6NqkOWv1iiMrFmK5rFgnfSR3va
 fuPScvs6drxf5a2QTMT8CG9exK/55i6CwtffIcm4sDTuyiay2R3vWqhe5mOzw5LgAg
 IBDAr81ke1c3DG5V2aP13koVKX/BQ0HMqkkNcF5PTrtQIiGEble+gaO9YGC7i4isB+
 9OL4vbDoIsxsoyzxNEkfkWLfDEoRhkyW3kFhlUrOZ/NPwg81L/0gaJe3dg5YT5zH0V
 4qMyDdIiC6Pyy0jJjyD2dfWij88puUL3CeBHnrsMHxHjH+s5aN/JB2/fwMMQxDAU83
 nh1D4XLMOo94A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:29:57 +0200
Date: Sat, 16 Oct 2021 10:29:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211016082957.GF4165837@scaer>
References: <20211015203327.1754756-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015203327.1754756-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/davici: bump to version 1.4
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

On 2021-10-15 22:33 +0200, Fabrice Fontaine spake thusly:
> Update indentation in hash file (two spaces)
> 
> https://github.com/strongswan/davici/blob/v1.4/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/davici/davici.hash | 4 ++--
>  package/davici/davici.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/davici/davici.hash b/package/davici/davici.hash
> index 178d87f2e2..27ec2a6dab 100644
> --- a/package/davici/davici.hash
> +++ b/package/davici/davici.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 d3e5e806ecca841d7e133a3df768062df59f4b4c76bf98e0f90aa8064721b3bd  davici-1.3.tar.gz
> -sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> +sha256  b03c5a1aad905e962271d70246d6af6c337ffd00449d990082ea02161327bde8  davici-1.4.tar.gz
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/davici/davici.mk b/package/davici/davici.mk
> index 6c8df48b6a..d54e02e278 100644
> --- a/package/davici/davici.mk
> +++ b/package/davici/davici.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DAVICI_VERSION = 1.3
> +DAVICI_VERSION = 1.4
>  DAVICI_SITE = $(call github,strongswan,davici,v$(DAVICI_VERSION))
>  DAVICI_LICENSE = LGPL-2.1+
>  DAVICI_LICENSE_FILES = COPYING
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
