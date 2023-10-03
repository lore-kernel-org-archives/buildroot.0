Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E4CE8FDB4
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 20:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0207F611BC;
	Tue,  3 Oct 2023 20:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0207F611BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n40dKKbtnk9q; Tue,  3 Oct 2023 20:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 434E46116D;
	Tue,  3 Oct 2023 20:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 434E46116D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB641BF3D2
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0468A408D9
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0468A408D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5Yu9KtQXGZG for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 20:36:50 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4FDD404B1
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 20:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4FDD404B1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c4b3:c81e:8436:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0F14D78034D;
 Tue,  3 Oct 2023 22:36:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Oct 2023 22:36:46 +0200
Date: Tue, 3 Oct 2023 22:36:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20231003203646.GG2957@scaer>
References: <20231003152101.40980-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003152101.40980-1-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696365409;
 bh=1D/cqzQgqu00Rfy+QVjdWz2Evq0SdL9ETddwQHU/yHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MC6XxbR8KQRSUjYBhx6pCJFKPeS7PpfZGecz4IpPuAJZj8JhusXVITqEt0T+H0nOM
 QTXKpE9yKYCVsClXgPUuEkg+7YuZi9zcorxAEwf+/fssTEYNecw5ze4biL5y5egY1d
 3Fm19yns/3wQ/JF8DCEMBuxpF+FMcG/Z1Qe240BAn4T1tfbubzaTg82C6plTjgJ8EF
 QsJ3VRLi9k6I1Bvd9T6Ov0pF7hyVtaWLkdXSZ+MoRmUAzsgSXYVV+80j1xJYYDUuR7
 n3pKKeO4nKzSk6tgMm5bbs+3I9AeK2boBPbiMuoz7xy231BKWFh4orzBHAKpnDB3ES
 yamTsSJSHXhWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MC6XxbR8
Subject: Re: [Buildroot] [PATCH 1/1] package/tbb: bump to version 2021.10.0.
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

Francis, All,

On 2023-10-03 18:21 +0300, Francis Laniel spake thusly:
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tbb/tbb.hash | 2 +-
>  package/tbb/tbb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> index 579581cfe4..1caf81c5c5 100644
> --- a/package/tbb/tbb.hash
> +++ b/package/tbb/tbb.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b  tbb-2021.8.0.tar.gz
> +sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b  tbb-2021.10.0.tar.gz
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
> diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> index c3e06a4e6d..75cca5e99d 100644
> --- a/package/tbb/tbb.mk
> +++ b/package/tbb/tbb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
> 
> -TBB_VERSION = 2021.8.0
> +TBB_VERSION = 2021.10.0
>  TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
>  TBB_INSTALL_STAGING = YES
>  TBB_LICENSE = Apache-2.0
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
