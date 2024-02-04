Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39090C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94308519D;
	Sun,  4 Feb 2024 10:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94308519D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoRYHCTr3s2X; Sun,  4 Feb 2024 10:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F5E3837A4;
	Sun,  4 Feb 2024 10:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5E3837A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 845641BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A80B60FCA
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A80B60FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEB6h5CdJMXZ for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:18:04 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78CA360FE4
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78CA360FE4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 90A0CB0037C;
 Sun,  4 Feb 2024 11:17:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 11:17:58 +0100
Date: Sun, 4 Feb 2024 11:17:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb9kVuX1mEB-C7NM@landeda>
References: <20240121213513.2636195-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240121213513.2636195-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707041882;
 bh=yLTnI2jb3yXL1nTErhyIhmAi9Iw+0Fcw9VgllUc6ikc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RcnkPofJNXYht6ZFmmpFN57yUPDlwo3EBN9Qv2LLJFBbM0FIgL0pnbm4OI0x6ltGN
 VxzkmwzykB+zPC/8veApegwJ67s++D3oUXWgpbG2QshDsKyNNpwQP/9Nh496AhNrV+
 sAwEqkPcOD5DxFPjHw+OxbgO0JNskNQKohjEdI5zdONf5pKJVPDq2Mj8IYEEuV+oi7
 erxQT8Ygqa7HjDIXGn7TQf1RHw+zSLvrGH5K5qXG4j5FiGlGH/X+m1c1IT/txmS23n
 AeazLAM2zyFRY58ybspKPTTOPimZuXwrYF4VD1e1EFnqLFMSIxhP54H8vCi2oKvaeq
 3lmoh4el0yEwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RcnkPofJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wheel: add CPE variables
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

On 2024-01-21 22:35 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:wheel_project:wheel is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/402C4B59-237A-4399-8189-CC9FC1B4BF39
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-wheel/python-wheel.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
> index 159598fd1e..320995521e 100644
> --- a/package/python-wheel/python-wheel.mk
> +++ b/package/python-wheel/python-wheel.mk
> @@ -10,5 +10,7 @@ PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8
>  PYTHON_WHEEL_SETUP_TYPE = flit
>  PYTHON_WHEEL_LICENSE = MIT
>  PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
> +PYTHON_WHEEL_CPE_ID_VENDOR = wheel_project
> +PYTHON_WHEEL_CPE_ID_PRODUCT = wheel
>  
>  $(eval $(host-python-package))
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
