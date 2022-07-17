Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFC5C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFAE140A1B;
	Sun, 17 Jul 2022 07:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFAE140A1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VwHFmGzun1HK; Sun, 17 Jul 2022 07:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 789D840A14;
	Sun, 17 Jul 2022 07:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 789D840A14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4EB81BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD1BD60F3A
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD1BD60F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTv2LBg5WbUE for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:21:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36A660F31
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B36A660F31
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:21:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0183A780506;
 Sun, 17 Jul 2022 09:21:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 09:21:00 +0200
Date: Sun, 17 Jul 2022 09:21:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717072100.GX2543@scaer>
References: <20220715223929.118674-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220715223929.118674-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658042463;
 bh=NFur2R9MgiwchHGJDDqUCx4TNLwOksrJ494I3j894H0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aO1I12dXEypaBM6BdMbKRpbFpApf5FN4XIjlbP2WzH56xbGC1OZbULmXOMnG967sG
 Un5tbHX6Vii0Bc/g01F8KkeG8MqiRQAXL9j8CC8WYH3xUeYHxV6w7NhlfujNvvRe0Y
 f4juHbWjOBMFy6gjwro38StQwX+MyiylA6zCAKbEe1gdt337fLTaJFrbUXtstnGvHE
 qN3v6FcLckuzQeRYo6nFTjo40hRa3qUsoHWrO/2M1mIz2weFS2lbVD/6J5VkhVdt3C
 bxPmdb3+N2T43OsIwXbJ5uF+YyrHDxL7qpwWZEk+18Goa9rh/4wkXVe7fJLFneiA8O
 cLOgn77yikA5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aO1I12dX
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: bump to version 0.4.12
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

On 2022-07-16 00:39 +0200, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - This bump will also fix the following build failure with libressl raised
>   since bump to version 3.5.2 in commit
>   8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
>   p11_cert.c: In function 'pkcs11_store_certificate':
>   p11_cert.c:310:34: error: dereferencing pointer to incomplete type 'X509' {aka 'struct x509_st'}
>     310 |  signature_nid = OBJ_obj2nid(x509->sig_alg->algorithm);
>         |                                  ^~
> 
> https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.12
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3acfa1419b59f7daa58fa8e61abc63ecb00f853c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libp11/0001-Update-wp11_rsa.c.patch | 26 ---------------------
>  package/libp11/libp11.hash                  |  2 +-
>  package/libp11/libp11.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 28 deletions(-)
>  delete mode 100644 package/libp11/0001-Update-wp11_rsa.c.patch
> 
> diff --git a/package/libp11/0001-Update-wp11_rsa.c.patch b/package/libp11/0001-Update-wp11_rsa.c.patch
> deleted file mode 100644
> index 0a2d6e65ce..0000000000
> --- a/package/libp11/0001-Update-wp11_rsa.c.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 4968cfc64dbaa39bb479a24d9578d75099e2f337 Mon Sep 17 00:00:00 2001
> -From: patchMonkey156 <pagorman@asu.edu>
> -Date: Mon, 19 Oct 2020 17:12:15 -0400
> -Subject: [PATCH] Update p11_rsa.c
> -
> -Bugfix for new LibreSSL version 3.2.2
> -[Retrieved from:
> -https://github.com/OpenSC/libp11/commit/4968cfc64dbaa39bb479a24d9578d75099e2f337]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/p11_rsa.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/p11_rsa.c b/src/p11_rsa.c
> -index b6beef0..ff12ed7 100644
> ---- a/src/p11_rsa.c
> -+++ b/src/p11_rsa.c
> -@@ -336,7 +336,7 @@ int pkcs11_get_key_size(PKCS11_KEY *key)
> - 	return RSA_size(rsa);
> - }
> - 
> --#if OPENSSL_VERSION_NUMBER < 0x10100005L || defined(LIBRESSL_VERSION_NUMBER)
> -+#if ( ( defined (OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100005L ) || ( defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3020199L ) )
> - 
> - int (*RSA_meth_get_priv_enc(const RSA_METHOD *meth))
> - 		(int flen, const unsigned char *from,
> diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
> index 52d73d4206..0e42bdd4cf 100644
> --- a/package/libp11/libp11.hash
> +++ b/package/libp11/libp11.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  57d47a12a76fd92664ae30032cf969284ebac1dfc25bf824999d74b016d51366  libp11-0.4.11.tar.gz
> +sha256  1e1a2533b3fcc45fde4da64c9c00261b1047f14c3f911377ebd1b147b3321cfd  libp11-0.4.12.tar.gz
>  sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
> diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
> index c1873a920c..7718573ace 100644
> --- a/package/libp11/libp11.mk
> +++ b/package/libp11/libp11.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBP11_VERSION = 0.4.11
> +LIBP11_VERSION = 0.4.12
>  LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
>  LIBP11_DEPENDENCIES = openssl host-pkgconf
>  LIBP11_INSTALL_STAGING = YES
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
