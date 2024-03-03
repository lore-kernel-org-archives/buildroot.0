Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D2AC54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 406518086A;
	Sun,  3 Mar 2024 16:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxuKVyCR2Phg; Sun,  3 Mar 2024 16:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3949381E1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3949381E1D;
	Sun,  3 Mar 2024 16:46:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62DFF1BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50F0F6086A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LE3QR-Ya5J0y for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C5B4606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C5B4606B1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C5B4606B1
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:46:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 89C3213F8AD;
 Sun,  3 Mar 2024 17:46:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 17:46:37 +0100
Date: Sun, 3 Mar 2024 17:46:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Message-ID: <ZeSpbbY296lkWfgG@landeda>
References: <20240303151913.286560-1-gilles.talis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303151913.286560-1-gilles.talis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709484399;
 bh=IrBEUIGMmb9NjALqu8FsuIHHUQUG3SuctGeaRgtTYno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iriDh8BKgGteBd4pwh8mi3b8+YysT7Kyjm/AcM8lbtZIL0CH9RDJvPGag37iyN+Yf
 lJcWYb9JdD18tZbEsZ3wx7m08cuapm7f9545qn9yr0c7qwImISkikSv8CsPVWgqm6S
 9X980bLnHb67eVq8mYOB+2HcL+S2Jm4vPVm+ex48YXPofYRSjvFi7BzSeQDx8rOP5J
 wCXu3BLc9BG6DxwvqosdaEPJwcvSHsd+WDmprOJESnpodweeMs+UvuT+zx5C+KbiY7
 eDxLuQ1GTYrN3Qn7oYm4k4wRmaR8Liehm2K34b+sq1p3WU6leGNUnhPsNaZsqkWL4e
 nlKlB9WuW4ohw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iriDh8BK
Subject: Re: [Buildroot] [PATCH v2] package/iozone: bump to version 3.506
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

Gilles, All,

On 2024-03-03 11:19 -0400, Gilles Talis spake thusly:
> - Upstream archive moved back to tar from tgz
> - For change log, see end of file:
> https://www.iozone.org/src/current/Changes.txt
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1->v2 (review from Julien Olivain):
> - Added license information (file and hash)
> - Updated commit log with archive format and change log
> ---
>  package/iozone/iozone.hash | 3 ++-
>  package/iozone/iozone.mk   | 7 +++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
> index 9ecf1d1af8..936ab5a646 100644
> --- a/package/iozone/iozone.hash
> +++ b/package/iozone/iozone.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
> -sha256  5a52f5017e022e737f5b55f320cc6ada0f2a8c831a5f996cce2a44e03e91c038  iozone3_493.tgz
> +sha256  114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7  iozone3_506.tar
> +sha256  bff7909fd698708d15613a4fb977a193cff98f44ef170c2dc1dd502974df75b2  docs/License.txt
> diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
> index 2df4a2aa84..b1b29d1098 100644
> --- a/package/iozone/iozone.mk
> +++ b/package/iozone/iozone.mk
> @@ -4,12 +4,11 @@
>  #
>  ################################################################################
>  
> -IOZONE_VERSION = 3.493
> -IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
> +IOZONE_VERSION = 3.506
> +IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
>  IOZONE_SITE = http://www.iozone.org/src/current
>  IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
> -# IOzone license details can be found at:
> -# http://www.iozone.org/docs/Iozone_License.txt
> +IOZONE_LICENSE_FILES = docs/License.txt
>  
>  # AIO support not available on uClibc, use the linux (non-aio) target.
>  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> -- 
> 2.39.2
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
