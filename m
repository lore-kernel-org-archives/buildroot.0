Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B208AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74AE481951;
	Sat, 15 Jan 2022 11:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pv77ZmnhjgHJ; Sat, 15 Jan 2022 11:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D174981975;
	Sat, 15 Jan 2022 11:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D947F1BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5E5560888
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYmVTKxBqG2m for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:11:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF06A607D1
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:11:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4531A19F59E;
 Sat, 15 Jan 2022 12:11:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642245117;
 bh=QaiiR34rTkdIKniN6G/sDBe2mAs22w6cfsOz4eMBH9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iA8QhETMLZuXAD87Oe0Wa7iDLpxr0Nb+iMXJrlHaOUOi1BYAziKhtpSVlkDqTDvA5
 tN3d/el2ccuUlDFXeu9uUtmmLxQHBoLzroX6nIiHFsho96A5Imj1MfeW9bm0r9RZT0
 1yeE3QH0/nWoeb/nmBHsC2DiPUiU68sqYnZbBJUsm4ns7jJRzzqMnwxspFQxNBNwf0
 RKHLGm9lIwJ22OvFlxGcMbw21F9EWDrIcJfLYysorOcNTHT1CJZcq+20JF95AI8+Zc
 HQojOraacVEhJ/EAEn5Fj0wsILE0ovMjsWhg8J6QMvYavUD/iIBCp1jSbvtjWF3KNQ
 QILo1LLNl5EFw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 12:11:53 +0100
Date: Sat, 15 Jan 2022 12:11:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115111153.GL1945846@scaer>
References: <20220115104729.1760707-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115104729.1760707-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pysftp: fix dependencies
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
Cc: Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-15 11:47 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of python-cryptography
> to version 36.0.1 in commit 01764876e3d4e7ab95c8365f1c83e6c12d49757c:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
>   Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n] && BR2_PACKAGE_PYTHON3 [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=y]
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
>   Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n] && BR2_PACKAGE_PYTHON3 [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=y]
> 
> Fixes:
>  - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pysftp/Config.in | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
> index 5d5b731f33..c65369b667 100644
> --- a/package/python-pysftp/Config.in
> +++ b/package/python-pysftp/Config.in
> @@ -1,13 +1,9 @@
>  config BR2_PACKAGE_PYTHON_PYSFTP
>  	bool "python-pysftp"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko -> python-cryptography
>  	depends on BR2_PACKAGE_PYTHON3 # python-paramiko -> python-bcrypt
> -	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko
>  	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
>  	help
>  	  A friendly face on SFTP.
>  
>  	  https://bitbucket.org/dundeemt/pysftp
> -
> -comment "python-pysftp needs a toolchain w/ C++"
> -	depends on BR2_PACKAGE_PYTHON3
> -	depends on !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.34.1
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
