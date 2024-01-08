Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEF3C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43238420A4;
	Mon,  8 Jan 2024 22:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43238420A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sD6GBqKBOvKn; Mon,  8 Jan 2024 22:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A8B4209A;
	Mon,  8 Jan 2024 22:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A8B4209A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AAEC1BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 542B28210F
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 542B28210F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waKciBP9RsHQ for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:20:28 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A88381EE8
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A88381EE8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 164B3B0037C;
 Mon,  8 Jan 2024 23:20:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 23:20:22 +0100
Date: Mon, 8 Jan 2024 23:20:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZx1Jp2GjNB2HiA5@landeda>
References: <20240108220026.435160-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108220026.435160-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704752426;
 bh=pPd9g39W+xLspLTFjqGbW+6Xjs/BLaxZUnmfF2YBNuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uz3Sby/wJs35QEmlgmZ3fSKnokQfxZybk4fhPXOkPODx+aSe1bTsQdY63mR+NB9Af
 mb44FYLTm/J+Gj/gQ2iJsvmzKcRWoCly/IpUAzWX919CJv4N2GCztOHD5upkHHkt1R
 JaaqF26N8jbCLWcKAFCtW5qGRofYgwh77RdvYmDgUCQj+CMqwX3KmZFVLbd4p286Yk
 n9t1ynOmNaZz+nRzZ2qRiDQ8AnCDZg166bIaKZOy55Nc/pfpQV4jQ7MR2GcM+ybkCr
 x86zfb0oDytQcm46Rujm6sXEt7LNCznff0ZML3QMLh4NRTSbtp3lP2+D1gJcdzCPwf
 vbPKtmHrlOVMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Uz3Sby/w
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: security bump to
 version 1.22.0
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-08 23:00 +0100, Fabrice Fontaine spake thusly:
> - Use official tarball
> - Update hash of license file (some packages have been added or removed
>   but the list of licenses is the same)
> - Fix CVE-2023-7158: A vulnerability was found in MicroPython up to
>   1.21.0. It has been classified as critical. Affected is the function
>   slice_indices of the file objslice.c. The manipulation leads to
>   heap-based buffer overflow. It is possible to launch the attack
>   remotely. The exploit has been disclosed to the public and may be
>   used. Upgrading to version 1.22.0 is able to address this issue. It is
>   recommended to upgrade the affected component. The identifier of this
>   vulnerability is VDB-249180.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/micropython/micropython.hash | 4 ++--
>  package/micropython/micropython.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
> index 7bff7de4e2..43551866b9 100644
> --- a/package/micropython/micropython.hash
> +++ b/package/micropython/micropython.hash
> @@ -1,3 +1,3 @@
>  #locally computed
> -sha256  c980ad7e742491df0dc10db2958137dbbf9aa7a8009e102fc75f4c0cac2d6b5e  micropython-1.19.1.tar.gz
> -sha256  0f678c2abd7fe2cfca36693630506bbcbdfc219bd04bf4a02fe3b094ae4c666f  LICENSE
> +sha256  a042764f0b6f6d92b267454c5bd5afcb83fc3900119f2583672aac571e661924  micropython-1.22.0.tar.xz
> +sha256  d9e0e0395867c899090e150213bc2b417e970c17355a8d48300089875b3c8037  LICENSE
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index d73cdb28db..7dbca0f1c2 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -MICROPYTHON_VERSION = 1.19.1
> -MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
> +MICROPYTHON_VERSION = 1.22.0
> +MICROPYTHON_SITE = https://micropython.org/resources/source
> +MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
>  # Micropython has a lot of code copied from other projects, and also a number
>  # of submodules for various libs. However, we don't even clone the submodules,
>  # and most of the copied code is not used in the unix build.
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
