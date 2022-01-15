Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF013C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 14:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BE4940004;
	Sat, 15 Jan 2022 14:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPSsgvascb2i; Sat, 15 Jan 2022 14:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62678404ED;
	Sat, 15 Jan 2022 14:22:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC1D11BF293
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6ED2403EC
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mgpv-QrYE2pK for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 14:22:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E84E440345
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 14:22:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a19f:b904:d24b:da3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 51FCB13F892;
 Sat, 15 Jan 2022 15:22:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642256554;
 bh=mqZ4bVuATRyN9SIiWopfiL3oOFXe06xgS1PLmX1Q2nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bl3uBnoSOXscfdYjzReoAAXNlGRBSn/5GVrdAzaWponOVxme+Yd4aaASxwYdLOdoV
 pQuiLLULQgzC5aNDHdMqjJYlIwqxUSiBRCTyRe5P9gGR8lxpWvI3KM8ZWoondq8i5m
 CURkmZiq+TTcF7+nksU72EGUvHbKU2yNMgvjLhu64KDV6u6ejyrlgJgHDWWG6W/oY8
 zWaUksN8GACwZEUJt0NI0QBRgd0Q7l4QwdsDPv2QWwncfFEzBYV9/2oFhy2jfgo0pr
 c/wcm3YXfpxgJSfpfNb8n7YRbXXNAn+9jnHUTdlpWyDYZurPgMVmZcwpfBhtGbbdgp
 /K+07WoDJ3V9g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 15:22:30 +0100
Date: Sat, 15 Jan 2022 15:22:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115142230.GO1945846@scaer>
References: <20220115114244.1912724-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115114244.1912724-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 3.2.11
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
Cc: Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-15 12:42 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - CVE-2021-45115: Denial-of-service possibility in
>    UserAttributeSimilarityValidator
>  - CVE-2021-45116: Potential information disclosure in dictsort template
>    filter
>  - CVE-2021-45452: Potential directory-traversal via Storage.save()
> 
> https://www.djangoproject.com/weblog/2022/jan/04/security-releases
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 3eea17e70f..89bc5ffb19 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  eaf0c3b4ac6b22cae9068360e6fd2d1b  Django-3.2.10.tar.gz
> -sha256  074e8818b4b40acdc2369e67dcd6555d558329785408dcd25340ee98f1f1d5c4  Django-3.2.10.tar.gz
> +md5  6c4a53d2ccb464bc3dd772c6f2f07df9  Django-3.2.11.tar.gz
> +sha256  69c94abe5d6b1b088bf475e09b7b74403f943e34da107e798465d2045da27e75  Django-3.2.11.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 4f80208f0e..25a645823b 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 3.2.10
> +PYTHON_DJANGO_VERSION = 3.2.11
>  PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a5/8e/c6dfc718d572e4b33b56824b9e71e5ab9be8072e6747fc6184d206c3fdb3
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/20/86/e4348aac45bc83fc8e9dda2cfd81004b007c65b68c1499a4233acabdaa3b
>  
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE
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
