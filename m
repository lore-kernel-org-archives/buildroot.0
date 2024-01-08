Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7765C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E414191C;
	Mon,  8 Jan 2024 22:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E414191C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1HlMloct6NN; Mon,  8 Jan 2024 22:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD6574159C;
	Mon,  8 Jan 2024 22:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD6574159C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B05961BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87BB941953
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87BB941953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZqQFwAlomrB for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:18:46 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29CC940579
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29CC940579
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 26A3AB0037C;
 Mon,  8 Jan 2024 23:18:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 23:18:40 +0100
Date: Mon, 8 Jan 2024 23:18:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZx0wJuA1601jiMn@landeda>
References: <20240106101504.527255-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240106101504.527255-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704752324;
 bh=uGwhv112ODPsrQWe5rkWoBM8pyqoNGR+Bcw9ypdr83A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=df+fLoDJgGKK1keGoxLL4YN8AnnF48DN9prtR/u3mvXior4RccQUe/eUg1huNX8ht
 8JmFBCevXYYt7fc93sQ8SQmezMQX3b+u8K8Vb/6tA8yelWT+4f7ytCVGCJhcBt4lu1
 3z0gATURWHV4aMCbn9k5b3JKrnG2DZgUX9SFFqmtejlUdyEKH+RanrbK+gtCpyT1p0
 zxyGQiJVaL+Em8VcyKrfJb6N+h0Gebfkl5haQegCEXuxbxaG0CmYAlnqCcbhxsV7zW
 tpfJeNrHDmSYSvuoAmZKInZMy+CV+qhIIpXBhsjyhdBkTcmyjIBY/itq1n9ex/gmsY
 UlM1LJnEihcAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=df+fLoDJ
Subject: Re: [Buildroot] [PATCH 1/1] package/uftp: security bump to version
 5.0.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-06 11:15 +0100, Fabrice Fontaine spake thusly:
> Update site to avoid redirections (HSTS, etc.)
> 
> Version 5.0.3 - 12/17/2023
>   A memory leak fix in the prior version wasn't applied correctly, resulting
>     in an invalid memory access causing a crash.  Bug fixed.
> 
> Version 5.0.2 - 11/8/2023
>   Fixed bug that caused crash when a CLIENT_KEY arrived out of order
>   Fixed option handling on Windows when an argument is missing
> 
> https://sourceforge.net/projects/uftp-multicast/files/Changes.txt/download
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uftp/uftp.hash | 2 +-
>  package/uftp/uftp.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
> index e47cba9394..d4d3450d1a 100644
> --- a/package/uftp/uftp.hash
> +++ b/package/uftp/uftp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed sha256
> -sha256  f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61  uftp-5.0.1.tar.gz
> +sha256  cb8668c19b1f10bc63a16ffa893e205dc3ec86361037d477d8003260ebc40080  uftp-5.0.3.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
> diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
> index ce865c20ec..3dcd8646c0 100644
> --- a/package/uftp/uftp.mk
> +++ b/package/uftp/uftp.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -UFTP_VERSION = 5.0.1
> -UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
> +UFTP_VERSION = 5.0.3
> +UFTP_SITE = https://downloads.sourceforge.net/project/uftp-multicast/source-tar
>  UFTP_LICENSE = GPL-3.0+
>  UFTP_LICENSE_FILES = LICENSE.txt
>  
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
