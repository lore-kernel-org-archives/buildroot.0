Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAEAECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED80041889;
	Sun, 11 Sep 2022 18:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED80041889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eN92qQXymzfa; Sun, 11 Sep 2022 18:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B05FB41888;
	Sun, 11 Sep 2022 18:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B05FB41888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9B0C1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 712CF6FC2C
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 712CF6FC2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91k1FngJfSdH for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:26:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 434446FC28
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 434446FC28
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 18:26:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B312013F86E;
 Sun, 11 Sep 2022 20:26:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 20:26:10 +0200
Date: Sun, 11 Sep 2022 20:26:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220911182610.GE898622@scaer>
References: <20220910224954.82264-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220910224954.82264-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662920772;
 bh=R7VT6MNL6vVT6QY9q+Dr37pjQFzkjQBDt71FptmXb6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X2OGlK4trmt1XLqItNg2CAsCpb4a2o1ImYleriVhx0i9C2niaP9TlsSa7tXH37V4V
 Hkuul6lWXxEwZeeZVBW7uSEDKrgGGYWKbNRpLUfF8WJULpCQutDzU7bb33zHmYhm84
 lCcaNKUmWeoV63c2JYBM9ICTHNrnamLyiEXSU34bZGD8GvypsLjLxN9wB0O3b+KoR4
 umxZ47oWTxdvE73gD2k9IOo6Oj5EReYn26vQHGa6AEZzvIfwH9x23MfC4P0OOfIewq
 8DwPJvr1GGrI0u6VYqmVeSY8aZefNX1JOlLToTywlcNjxJGCZPM9b/rvS9vKwKZrOv
 3GW3fHu/CQ/GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X2OGlK4t
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 version 10.3.36
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

On 2022-09-11 00:49 +0200, Fabrice Fontaine spake thusly:
> - Fixes for the following security vulnerabilities:
>   - CVE-2018-25032
>   - CVE-2022-32091
>   - CVE-2022-32084
> - Refresh first patch
> 
> https://mariadb.com/kb/en/mariadb-10336-release-notes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mariadb/0001-add-extra-check-for-librt.patch | 6 ++++--
>  package/mariadb/mariadb.hash                         | 4 ++--
>  package/mariadb/mariadb.mk                           | 2 +-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mariadb/0001-add-extra-check-for-librt.patch b/package/mariadb/0001-add-extra-check-for-librt.patch
> index 0dd4c546fb..6e3fc70276 100644
> --- a/package/mariadb/0001-add-extra-check-for-librt.patch
> +++ b/package/mariadb/0001-add-extra-check-for-librt.patch
> @@ -8,6 +8,8 @@ https://jira.mariadb.org/browse/MDEV-10841
>  Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
>  [Rebased on mariadb-10.3.30]
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +[Rebased on mariadb-10.3.36]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   configure.cmake | 3 +++
>   1 file changed, 3 insertions(+)
> @@ -23,9 +25,9 @@ index 1b85c31b..4a1cd847 100644
>  +  IF(NOT LIBRT)
>  +    MY_SEARCH_LIBS(posix_spawn_file_actions_addclose rt LIBRT)
>  +  ENDIF()
> -   set(THREADS_PREFER_PTHREAD_FLAG ON)
> -   FIND_PACKAGE(Threads)
> +   MY_SEARCH_LIBS(backtrace_symbols_fd execinfo LIBEXECINFO)
>   
> +   set(THREADS_PREFER_PTHREAD_FLAG ON)
>  -- 
>  2.32.0
>  
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index f7e3c7b744..c4064cff66 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.mariadb.org/mariadb/10.3.35
> -sha512  9355de944eccef4e0bc01b19ffc3c0c72cf88befae7385c6f0ee1ea47dbd98d23f6bb46af9c140acc48d9d9613552870684bc0b7ca1f3cff1dc09c1a2c801573  mariadb-10.3.35.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.3.36
> +sha512  321b4c48fcea4413eb239c4904c806306de660f2844edfa1d2a2a15213db287070d0f923db976588dfe329559d565bd98bddef3aaf8f14502f8c3db2ee27757a  mariadb-10.3.36.tar.gz
>  
>  # Hash for license files
>  sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 4c855985b1..5fb8876278 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MARIADB_VERSION = 10.3.35
> +MARIADB_VERSION = 10.3.36
>  MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>  MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
>  # Tarball no longer contains LGPL license text
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
