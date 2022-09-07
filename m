Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE29ECAAD3
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 07:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0E4040393;
	Wed,  7 Sep 2022 07:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E4040393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhMMajzZqu8M; Wed,  7 Sep 2022 07:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7A7E40328;
	Wed,  7 Sep 2022 07:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A7E40328
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 738FE1BF957
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F3BD60AA0
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3BD60AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXwEKWNth6bK for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 07:02:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F5D160A94
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F5D160A94
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 07:02:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f72e:cac9:64c4:382d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3B3B313F8CC;
 Wed,  7 Sep 2022 09:01:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Sep 2022 09:01:57 +0200
Date: Wed, 7 Sep 2022 09:01:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220907070157.GF1490660@scaer>
References: <20220907052332.156919-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220907052332.156919-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662534121;
 bh=Ms5FSBD7G9pkn+MXYUJScwjmph753kb3P7v4UIroYU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKrjjzQp8o3DQ1/3QUE8kaVSuMFtwOmLe/ZTh7OmOBWOIGZajobe4DBxxEIdZD/nz
 2jm/op6f3Geoua+6jU7VobUpAA6Bnb9eeR7Oeh0DMlDR7dcWfUoxGa7nRf9tJcHEu0
 YEQpsG2k1PhCa9NU+QmgMvQ//lEamHEPTanpbRhmJ+WFUDmfEFWU5ygJy7AMwNFiQ3
 ouGkJr7ScTuLrKhohon44USwcx+CY79Pwwa7ZGuAf2VRLOwUnpgK8bBmxioOnxhpc4
 r5ycXCoN80lC8NH7B94skdwxRJtMxzQQVcJhKptOk/sITlwzEO+tFEj8K2k2WZOxJz
 AIejFM6YLKU7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TKrjjzQp
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.18.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-09-06 22:23 -0700, Christian Stewart via buildroot spake thusly:
> go1.18.6 includes security fixes to the net/http package, as well as bug fixes
> to the compiler, the go command, the pprof command, the runtime, and the
> crypto/tls, encoding/xml, and net packages.
> 
> https://github.com/golang/go/issues?q=milestone%3AGo1.18.6+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 2a0f02abfd..959387cb6a 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,3 +1,3 @@
>  # From https://go.dev/dl
> -sha256  9920d3306a1ac536cdd2c796d6cb3c54bc559c226fc3cc39c32f1e0bd7f50d2a  go1.18.5.src.tar.gz
> +sha256  a7f1d50424355dabce66d1112b1cae439b6ee5e4f15edba6f104c0a4b173e895  go1.18.6.src.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 16602e590b..a8c84bd312 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.18.5
> +GO_VERSION = 1.18.6
>  GO_SITE = https://storage.googleapis.com/golang
>  GO_SOURCE = go$(GO_VERSION).src.tar.gz
>  
> -- 
> 2.37.3
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
