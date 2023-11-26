Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCB4C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 20:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E0B640474;
	Sun, 26 Nov 2023 20:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E0B640474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHt7f7JNIwKm; Sun, 26 Nov 2023 20:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82F7C40425;
	Sun, 26 Nov 2023 20:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82F7C40425
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 492541BF867
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21EDD60BE7
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EDD60BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CZP-GA6n5O4 for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 20:57:02 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E442A60BE3
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 20:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E442A60BE3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CC97178034D;
 Sun, 26 Nov 2023 21:56:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 21:56:54 +0100
Date: Sun, 26 Nov 2023 21:56:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231126205654.GD3177259@scaer>
References: <20231126203341.2116704-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126203341.2116704-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701032219;
 bh=E7xLf6rboO5LEiK/ySD5P4oEJnMIr+nynTR2Hqw0qjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LGtlgWgdET8JRLKz5IDQutdhy25VRhCfbMOuSAa+j8iXrxx1rEdZVs5nK0Vw1Wbi4
 IZ3pMu99jLS/xVdEYmGQqs26aRWn6Je7YMeYfFSZTCbAlWFf9PRgKXwC3hHmPiL2hR
 qpgBABYcWOQy0MDrsyzET/oy81PEZvO9wZndGouEQhmymT+nJdm0oHJ1LcoEtXBEZe
 YqR21bL0hQ3Q9h2Ez4f9OaeIFTP8darRKvUVRaUBnunn8teQh3bANeeN6l/kj47ms4
 hFwqqaL0TsVl8vS0sb+r8NpoRLcR7Z34VEFLscnnyvujyjfSxb75xbK64lVZNGAh0s
 FD6Ik6aE1oJIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LGtlgWgd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-msgpack: fix build
 without cpp toolchain
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-11-26 13:33 -0700, James Hilliard spake thusly:
> Prior to being updated to version 1.0.7 in
> 014a66fcde68bd0b612b62ec722ccc93bdc0d7f9 python-msgpack would
> automatically fall back to the pure python version if the cpp based
> optimized extension would fail to build for any reason.
> 
> This however is no longer the case after updating to 1.0.7 where it
> is now required that we explicitely set the MSGPACK_PUREPYTHON=1 if
> we do not have cpp support enabled in the toolchain.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/361/36185a19bed4bd57421a4d909bce1976c89d130f
>  - http://autobuild.buildroot.net/results/477/477f822cb196ebc2246bcbdc1b6eaf940fc018cd
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-msgpack/python-msgpack.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
> index 061ff5a761..82110b1776 100644
> --- a/package/python-msgpack/python-msgpack.mk
> +++ b/package/python-msgpack/python-msgpack.mk
> @@ -11,4 +11,8 @@ PYTHON_MSGPACK_LICENSE = Apache-2.0
>  PYTHON_MSGPACK_LICENSE_FILES = COPYING
>  PYTHON_MSGPACK_SETUP_TYPE = setuptools
>  
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),)
> +PYTHON_MSGPACK_ENV = MSGPACK_PUREPYTHON=1
> +endif

As you explained on IRC, the value we set it to does not matter:
whatever the value (even empty!), it forces to use pure python code.
I.e. there is no way to force it to use C++.

Applied to master with a comment explaining that, thanks.

Regards,
Yann E. MORIN.

>  $(eval $(python-package))
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
