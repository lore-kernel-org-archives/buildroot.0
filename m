Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE00C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 541B060FA2;
	Mon,  5 Feb 2024 13:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 541B060FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Itnjd15P1THx; Mon,  5 Feb 2024 13:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1BD3606E6;
	Mon,  5 Feb 2024 13:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1BD3606E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 032D01BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBCF840A67
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCF840A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wS47pNB-eg1G for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:38:16 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89AE740A18
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89AE740A18
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 89CF02C80BF9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:38:14 +0100 (CET)
Message-ID: <02f46330-bc2b-4dec-a933-0e086db94f2c@bubu1.eu>
Date: Mon, 5 Feb 2024 14:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <170712853287.18164.6368517214119629150-0@git.sr.ht>
In-Reply-To: <170712853287.18164.6368517214119629150-0@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707140294; bh=V7+Doj/aQ7nuqUWdIIn7Iy96+RJPnLT2VMbbzEu/x8A=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=LkD2dGS7reFaKgW57b36vhBLBe6KfSP4OSrhlKpmiLTWmC6ooSfctEXc7VVqFB2UH
 TphGS22SVSvBwmU/m4Q4Oxlf4ekNflFzeER3Kw7sc892vdI8mestrsdPjitk0NEswN
 EQ8rbFTD2pocsAxwWG48IYMHdHABmDetJaMPPWmx2W9b+4Oa8bCCRfq0ME0XejVYtI
 qsqVkkutOkIgLNHAoStrgEw4h9yCeS/Qqwg4xcMWX917mNgQkue2jLWJ4BzYtqFkRE
 9aRWM3x9RKIMO386bg6Ts6yyRvAZIR+NT2DmF+pA0AW5TqmIvXrjOTaZmHT1u1h2W9
 rXX0kKJiqWulw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=LkD2dGS7
Subject: Re: [Buildroot] [PATCH buildroot] package/python-minimalmodbus: fix
 empty package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Forgot my SoB

On 21.09.23 22:39, ~bubu wrote:
> From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> 
> Calling `setup.py` build builds and installs  an empty package
> after upstream changed their packaging. Calling setuptools via
> `python -m build` builds the package correctly.

Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>

> ---
>   package/python-minimalmodbus/python-minimalmodbus.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
> index 5a6e7733be..cb8a0d8cc9 100644
> --- a/package/python-minimalmodbus/python-minimalmodbus.mk
> +++ b/package/python-minimalmodbus/python-minimalmodbus.mk
> @@ -7,7 +7,8 @@
>   PYTHON_MINIMALMODBUS_VERSION = 2.1.1
>   PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
>   PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
> -PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
> +PYTHON_MINIMALMODBUS_DEPENDENCIES = host-python-setuptools
> +PYTHON_MINIMALMODBUS_SETUP_TYPE = pep517
>   PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
>   PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
