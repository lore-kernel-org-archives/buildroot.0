Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E9C47DB7
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C645E40AA4;
	Sat, 20 Jan 2024 23:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C645E40AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWNZtXDU19xA; Sat, 20 Jan 2024 23:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D465740AD5;
	Sat, 20 Jan 2024 23:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D465740AD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6D311BF27E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD87681AA7
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD87681AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0yIwqI1XVNj for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:04:22 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E86888188D
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E86888188D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2D40113F89C;
 Sun, 21 Jan 2024 00:04:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 00:04:15 +0100
Date: Sun, 21 Jan 2024 00:04:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaxRb7NoJYMfTXBQ@landeda>
References: <20240120201116.48735-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240120201116.48735-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705791860;
 bh=bGxHtXY9/5AvKLW3rOClRb/DhJZBlRr68d5bLlRH+nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EGZbl7pcYiFit+62G/uiW4rbvPLJdwfK+EntsimnFn0HWjXC9V4G5wGnZCu+pBMsA
 44ZQXcsizJSg7ZAcIQvuVj9lB2GYi1+TEpcyqf86k9OUN/DzbjsPsILNpuVh/iAYNN
 pZcw7vsaN1W5k0Xv2EUMvzIjUT9LELkUsyQIGbUniy2cmNmHECFKMdq9z1rQ4VxLOG
 fVUiE20kAHSNDfXfAQv7MDUpUpU2NXMjxY5ywxkkGovl8DJzsjlFQQoB16DQWdlisW
 9r2w4jlxkNX+noN49+6iS4rjBYMY9ltWH58yV3K9BjfLasXHbtEYc+T6DeZLznrHBf
 5DXZaoaEY7Q4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EGZbl7pc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlparse: add CPE
 variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-20 21:11 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:sqlparse_project:sqlparse is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/BB69AE3A-3268-4EDF-95AF-A05BB61B686F
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, along with all the similar patches up to
python-gunicorn, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/python-sqlparse/python-sqlparse.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
> index 23b1338e49..48b1a24822 100644
> --- a/package/python-sqlparse/python-sqlparse.mk
> +++ b/package/python-sqlparse/python-sqlparse.mk
> @@ -10,5 +10,7 @@ PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/ba/fa/5b7662b04b6
>  PYTHON_SQLPARSE_SETUP_TYPE = setuptools
>  PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
>  PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
> +PYTHON_SQLPARSE_CPE_ID_VENDOR = sqlparse_project
> +PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
>  
>  $(eval $(python-package))
> -- 
> 2.43.0
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
