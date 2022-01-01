Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BEDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD5EA60E7A;
	Sat,  1 Jan 2022 10:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8O9uoyH45MI; Sat,  1 Jan 2022 10:13:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB7160E25;
	Sat,  1 Jan 2022 10:13:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59EB01BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 571D5402AA
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIvOi4jD83Sy for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:13:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74DDD40296
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:13:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CDD3E5FFB7;
 Sat,  1 Jan 2022 11:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641031983;
 bh=UdVhsxzPKUYmtRew5wj9uj54Y/Sd5TD8qiyFTzYTLCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EnkoNRqDTb02lKp43oiaQsXJuQwWFWXsTynFYzczboJ/jeiULZRpzTr/8YqS3xtms
 KM5oP6mr7iQDNAEeMqFaEnxVGitG+kpEkKQfUn7D/Nfsy/8NECeLe/FTCkTG7S6RuS
 xtD6Xey8ZlJaB1O4xyU4SZIXPIl/4X23YXdFQWGXlhoXrZY1CVRZAcm5KqDnM3qSDq
 VyD5gaGsVYv7uatBENXQM8m3Bsb2OHk0Rk9/KmZ6Ws1h7hYIruB74LKJIYdey62MKG
 TK/6EKw6yQHqHo1pInoI7RzP+NCbQwPRCpp5RcEHPL/ez71wszECvjZbgHzVE3DXmg
 tVRIw9cdAWoOQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 11:12:58 +0100
Date: Sat, 1 Jan 2022 11:12:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101101258.GX3390456@scaer>
References: <20211230225958.3089672-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230225958.3089672-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gawk: bump to version 5.1.1
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

On 2021-12-30 23:59 +0100, Fabrice Fontaine spake thusly:
> https://git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.1.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gawk/gawk.hash | 4 ++--
>  package/gawk/gawk.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
> index 91e506607e..894c939c5b 100644
> --- a/package/gawk/gawk.hash
> +++ b/package/gawk/gawk.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz.sig
> +# https://ftp.gnu.org/gnu/gawk/gawk-5.1.1.tar.xz.sig
>  # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
> -sha256  cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd  gawk-5.1.0.tar.xz
> +sha256  d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2  gawk-5.1.1.tar.xz
>  # Locally calculated
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
> index ae2bbe5422..b55c74d00a 100644
> --- a/package/gawk/gawk.mk
> +++ b/package/gawk/gawk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GAWK_VERSION = 5.1.0
> +GAWK_VERSION = 5.1.1
>  GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
>  GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
>  GAWK_DEPENDENCIES = host-gawk
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
