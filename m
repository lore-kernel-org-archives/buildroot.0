Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE10C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 19:56:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D38E61051
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 19:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D38E61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A46382751;
	Sat, 25 Sep 2021 19:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8wmySIAoszP; Sat, 25 Sep 2021 19:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9003182702;
	Sat, 25 Sep 2021 19:56:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4A811BF575
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 19:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14B740106
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 19:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2t9AXOlPbgCU for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 19:56:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 262C0400E1
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 19:56:35 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEA7E2BA;
 Sat, 25 Sep 2021 21:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632599792;
 bh=yBtf5yP1IaNVKJypVQxTWxt0Ln/zckhOpNC2b6ANGeI=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=OrRWwjhtYfxmpQPwJqPs7Zv0GGTLY1KPi2JGT4hGbwUK4DeKmBxkWNYsfUqMNAWgL
 RVCCOCETzKypXpNPtab7bgfkoWQk64Ec3/xNuEpcfYDdxWdkZBdHoA5UGnh1ImG+kE
 C2YCsGz/l7CqTiHOG2b5r/U2JM0k1P1aDJSEVRnk=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210924214321.2920421-1-fontaine.fabrice@gmail.com>
Message-ID: <593068bf-e5aa-2597-26fb-bfa8f3abaaee@ideasonboard.com>
Date: Sat, 25 Sep 2021 20:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924214321.2920421-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: bump to version
 40f5fddca7f774944a53f58eeaebc4db79c373d8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/09/2021 22:43, Fabrice Fontaine wrote:
> This will fix the following build failure raised since commit
> c09f126f570355b8ec134724b453300a4811339c thanks to
> https://git.linuxtv.org/libcamera.git/commit/?id=c52e8429cce91dadf98378d87015d8f476a44f70:
> 
> /tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/message.cpp.o: in function `libcamera::Message::registerMessageType()':
> message.cpp:(.text+0x290): undefined reference to `__atomic_fetch_add_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6e3471df8e9312a1789ca05ae70cc2283bfeec23
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Excellent, Yes - I think this is a good time for a bump.

Acked-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 52c584bc16..a7ca27a96b 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  a5ed581416719b914140eda76ca8a4e0e9c944b859f8fb018fc17497278c5ae1  libcamera-e355ca0087cd93ef80f74c61018e9e9228a93313-br1.tar.gz
> +sha256  305e6f458d2bf3d4b697ffe33e104b696db6b1492bb5422e2cce1937e58516f1  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8-br1.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 677da8ac4c..8ab95fb42a 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = e355ca0087cd93ef80f74c61018e9e9228a93313
> +LIBCAMERA_VERSION = 40f5fddca7f774944a53f58eeaebc4db79c373d8
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>  	host-openssl \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
