Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516CEECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 14:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D919D4034B;
	Tue,  6 Sep 2022 14:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D919D4034B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sYX1jr9LFw4H; Tue,  6 Sep 2022 14:58:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E61C54051D;
	Tue,  6 Sep 2022 14:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E61C54051D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B76E1BF990
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35AE082CF9
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35AE082CF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DAPNthtMMK6 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 14:58:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B917181D7D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B917181D7D
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 14:58:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 95C67B00585;
 Tue,  6 Sep 2022 16:58:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 16:58:18 +0200
Date: Tue, 6 Sep 2022 16:58:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220906145818.GA1585594@scaer>
References: <20220829195831.397183-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829195831.397183-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662476301;
 bh=KTxuEKWF4Y8DenV5JSPjEzLzLBR6L0dWnB873PLlju4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OOlsxNqfGNh1BzYYRtR1VVaGeAF5B5usatUpGBh78i1RKdzxw4/S3qIw6qserwzwZ
 RDgUhY46b8hUtiR6LY2GVO3G7zrQSSzx11bSVqele5D3JMHVZV5PGQSmpaMy+2zFi1
 aA2U3BZ2lGfCzvbhdj/HjSL+XjSF3QdHi2Cw78Anw7mvce+nDdlHnBjlhmVNCEItHk
 fD2LrY42sMFmeEIEbkVyguj/+9ze5o5ZNTFWGmmuCRksZK5t5lmSUIuPcOvf0WxcpH
 nA6zx7p/Cq9/A4Us/cScTJP8zO5rrYfowIj9UZYcD5VIVBx9ihlhrNdN3cJjVZ/OGp
 FKSJKtZRcjy3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OOlsxNqf
Subject: Re: [Buildroot] [next 1/1] package/python-gnupg: bump to version
 0.5.0
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

Julien, All,

On 2022-08-29 21:58 +0200, Julien Olivain spake thusly:
> For change log, see:
> https://github.com/vsajip/python-gnupg/releases/tag/0.5.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> Tested on BR commit 04d3aef with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     make python-gnupg-legal-info
>     ...
>     LICENSE.txt: OK
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_python_gnupg.TestPythonPy3GnuPG
>     ...
>     OK
> ---
>  package/python-gnupg/python-gnupg.hash | 4 ++--
>  package/python-gnupg/python-gnupg.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
> index f7267308f6..7886ff7dae 100644
> --- a/package/python-gnupg/python-gnupg.hash
> +++ b/package/python-gnupg/python-gnupg.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
> -md5  e27cd8c6ce3b5c9197e931b65bbb4c9a  python-gnupg-0.4.9.tar.gz
> -sha256  aaa748795572591aaf127b4ac8985684f3673ff82b39f370c836b006e68fc537  python-gnupg-0.4.9.tar.gz
> +md5  19cc1aef3a612b7b5f13e388260e65d4  python-gnupg-0.5.0.tar.gz
> +sha256  70758e387fc0e0c4badbcb394f61acbe68b34970a8fed7e0f7c89469fe17912a  python-gnupg-0.5.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
> diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
> index 582a649f9a..b51ac61892 100644
> --- a/package/python-gnupg/python-gnupg.mk
> +++ b/package/python-gnupg/python-gnupg.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_GNUPG_VERSION = 0.4.9
> -PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/c8/cb/46fb80639cf0dd4251aeb075a1a5e2ebbb8c9656f28ddfe9d8c99b68b6da
> +PYTHON_GNUPG_VERSION = 0.5.0
> +PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/e3/5c/5ff9877001616912a74f4377cd5f80925b31a678087800beae5b28bdb80e
>  PYTHON_GNUPG_LICENSE = BSD-3-Clause
>  PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
>  PYTHON_GNUPG_CPE_ID_VENDOR = python
> -- 
> 2.37.2
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
