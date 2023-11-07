Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D64BC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5AEF60D77;
	Tue,  7 Nov 2023 21:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5AEF60D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fusENCoiaZ9Z; Tue,  7 Nov 2023 21:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E789260D62;
	Tue,  7 Nov 2023 21:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E789260D62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3EA51BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C82660D6E
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C82660D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yob47Qsot709 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:37:06 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 475BE60DCA
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 475BE60DCA
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4A23B13F861;
 Tue,  7 Nov 2023 22:37:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 22:37:01 +0100
Date: Tue, 7 Nov 2023 22:37:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231107213701.GI229059@scaer>
References: <20231105052255.2835263-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105052255.2835263-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699393024;
 bh=1Jz2dG0oAJiiQD2zEZrfAmi9KpC9ttOMYiHJTnt6s9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IDUm8PtBctiDaaP8/e6gHtsnbX7AFSBvKVu6qfZfp+SRWqrF4d7NZnxZo6m7o5I9m
 gCOfVnMnc/TaI/zu64iKVdmkGuzF00DUmTqaF0PYSH/KMmm8AJBqy/C83BZDKRlW2U
 LMQQ1mXlg84gojO2flHUVhyilXbm32qRZebIouI6jMtQwVDkSjAKrSKtl0pu0rlWdG
 KPxRt9dgL5jkkmayHVv8zJ0JPhwDSukpG4OxdWDOGXmQeQjjgvcxmG6vI4jmBZ3xFG
 ihIA3q/WyVR3/z3kdbqvSFU+TmrFU5Uchh1ZLsxwz2mumLRbIgDyS7l7CEbJ9WxP6n
 7pyXh4dwuVN9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IDUm8PtB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-executing: bump to
 version 2.0.1
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

James, All,

On 2023-11-04 23:22 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-executing/python-executing.hash | 4 ++--
>  package/python-executing/python-executing.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
> index 40fd43b5fd..e21418aae9 100644
> --- a/package/python-executing/python-executing.hash
> +++ b/package/python-executing/python-executing.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/executing/json
> -md5  e6fa9a6abf00555ccc8a6b3524729238  executing-1.2.0.tar.gz
> -sha256  19da64c18d2d851112f09c287f8d3dbbdf725ab0e569077efb6cdcbd3497c107  executing-1.2.0.tar.gz
> +md5  91da12f933267a5fe085033db2a3b84d  executing-2.0.1.tar.gz
> +sha256  35afe2ce3affba8ee97f2d69927fa823b08b472b7b994e36a52a964b93d16147  executing-2.0.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
> diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
> index 4c968323ea..071e867941 100644
> --- a/package/python-executing/python-executing.mk
> +++ b/package/python-executing/python-executing.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_EXECUTING_VERSION = 1.2.0
> +PYTHON_EXECUTING_VERSION = 2.0.1
>  PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
> -PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/8f/ac/89ff37d8594b0eef176b7cec742ac868fef853b8e18df0309e3def9f480b
> +PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/08/41/85d2d28466fca93737592b7f3cc456d1cfd6bcd401beceeba17e8e792b50
>  PYTHON_EXECUTING_SETUP_TYPE = setuptools
>  PYTHON_EXECUTING_LICENSE = MIT
>  PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
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
