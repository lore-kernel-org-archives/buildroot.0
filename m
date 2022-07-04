Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3937C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 16:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7195B60E5E;
	Mon,  4 Jul 2022 16:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7195B60E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dJ-VkqATvcx; Mon,  4 Jul 2022 16:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6277F60B79;
	Mon,  4 Jul 2022 16:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6277F60B79
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28C7C1BF373
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 033C44000B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 033C44000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZbe-KBhqlq7 for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 16:53:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC7140260
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDC7140260
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 16:53:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dbc:d4c9:1472:395c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 53707780393;
 Mon,  4 Jul 2022 18:53:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 18:53:34 +0200
Date: Mon, 4 Jul 2022 18:53:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220704165334.GH2521@scaer>
References: <20220703095347.1318735-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220703095347.1318735-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656953617;
 bh=L0YHlXBWPBH9Dp9M2GvSGdifzB7ik6d0jEXVf4u67a8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qqZ6U97EBlhFidpvHa9WopYeDKIDNdxcFY0olKef7YEfRBaLAuBnWZo78jxqpcnyZ
 bmSLG2bs1tkAX6Nh+SPE6ZuAbOkzDn8Ms4ASa/rOxqioztWpoi/TnmjDlds5gMNxKJ
 ICSfTpbUXI0VNErdIkhrR4OsZ7bwTisbJmMpmI4sPd4H47tg8AMWeBok1u9GS3u8Vj
 GecwBNrx7k2kOCrHu5OAfNLWg1G7vFT+1LD2dRJVOJjAneCr2E0YwboVtnJ8bZ7Jy5
 j95qxVh9qMIqpZ8zPKIGJeXgvI90aEnvE4TkncYgVp5NA+inPruHu2bHSl6u3sCdUq
 YyTIt9523qWSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qqZ6U97E
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 1.1.1p
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

On 2022-07-03 11:53 +0200, Fabrice Fontaine spake thusly:
> The c_rehash script allows command injection (CVE-2022-2068)
> ============================================================
> 
> Severity: Moderate
> 
> In addition to the c_rehash shell command injection identified in
> CVE-2022-1292, further circumstances where the c_rehash script does not
> properly sanitise shell metacharacters to prevent command injection were
> found by code review.
> 
> When the CVE-2022-1292 was fixed it was not discovered that there
> are other places in the script where the file names of certificates
> being hashed were possibly passed to a command executed through the
> shell.
> 
> This script is distributed by some operating systems in a manner where
> it is automatically executed.  On such operating systems, an attacker
> could execute arbitrary commands with the privileges of the script.
> 
> Use of the c_rehash script is considered obsolete and should be replaced
> by the OpenSSL rehash command line tool.
> 
> https://www.openssl.org/news/secadv/20220621.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index ec5fd0fe84..2f76241c72 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://www.openssl.org/source/openssl-1.1.1o.tar.gz.sha256
> -sha256  9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f  openssl-1.1.1o.tar.gz
> +# From https://www.openssl.org/source/openssl-1.1.1p.tar.gz.sha256
> +sha256  bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e44644d9fc8ace6f  openssl-1.1.1p.tar.gz
>  
>  # License files
>  sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 1aff93429b..f19a63da41 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 1.1.1o
> +LIBOPENSSL_VERSION = 1.1.1p
>  LIBOPENSSL_SITE = https://www.openssl.org/source
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = OpenSSL or SSLeay
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
