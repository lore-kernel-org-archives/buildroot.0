Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D045BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:32:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543F2611EE
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 543F2611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8F04149C;
	Sun,  3 Oct 2021 20:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijm2Qgo0YBQN; Sun,  3 Oct 2021 20:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA934148E;
	Sun,  3 Oct 2021 20:32:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D5A31BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB834148E
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kljsl06O4sFF for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:32:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09FC741480
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:32:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1CCB413F899;
 Sun,  3 Oct 2021 22:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633293134;
 bh=BtIbsvZjSXpZCom1/ykxDDxL+P79ej2YBdWk4Glwovw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AmX5Ng159JTGJF6/LVJbCu8fBAaxwRcsLqQlCpw5Pto8ltw0Qu4xaDDrRpU/oFCh5
 IkBrvu3XkyRZrZzQHH8YuNdd2rxL8nf/0xbfg6ECF4At7CH1l1TmKQcFiYvnSoUYLr
 hSU0iBizOvkk5WNSzxjY8uPrL0J+SGG3FnrJADvkJlfl4CVh6LuSZ26Bv+oBBA9r5j
 2/WOQcTH5P2gYRSerNCutGkkRJ3BPmI6PkmbDBy/8mAxdiSM9G75N9g1BK0kvBLmLg
 7IJTM0M+PRH6vQFHC57nwgNA232F53diJR245NSofGph1BtPQzHnmeKBcG/Zhc/S4Z
 SJAtZoM3H9x1g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 22:32:05 +0200
Date: Sun, 3 Oct 2021 22:32:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211003203205.GZ1504958@scaer>
References: <20210929163144.1779192-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210929163144.1779192-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-psycopg2: needs python3
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-09-29 18:31 +0200, Fabrice Fontaine spake thusly:
> python 2 support has been dropped since version 2.9 and
> https://github.com/psycopg/psycopg2/commit/d956eaa3b1842a14895685be0d6d5e380fd029fc
> resulting in the following build failure since bump to version 2.9.1 in
> commit 09417e47d706e5d7d58c0f886b4679064c5175fa:
> 
>   File "setup.py", line 117
>     f"Unable to find 'pg_config' file in '{self.pg_config_exe}'")
>                                                                ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f8a2cf9eea500e2c617381840b849225f12b56f1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-psycopg2/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
> index 5ffe179517..fba781c014 100644
> --- a/package/python-psycopg2/Config.in
> +++ b/package/python-psycopg2/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PSYCOPG2
>  	bool "python-psycopg2"
> +	depends on BR2_PACKAGE_PYTHON3
>  	depends on BR2_USE_WCHAR # postgresql
>  	select BR2_PACKAGE_POSTGRESQL
>  	help
> @@ -21,5 +22,7 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
>  	  Psycopg 2 is both Unicode and Python 3 friendly.
>  
>  	  http://initd.org/psycopg/
> +
>  comment "python-psycopg2 needs a toolchain w/ wchar"
> +	depends on BR2_PACKAGE_PYTHON3
>  	depends on !BR2_USE_WCHAR
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
