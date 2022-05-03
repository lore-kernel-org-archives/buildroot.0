Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8FDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 879EA812FB;
	Tue,  3 May 2022 19:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZifrN2P68AcL; Tue,  3 May 2022 19:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F7F831F2;
	Tue,  3 May 2022 19:22:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8481BF33A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A99880CDE
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2g-0-71DljQQ for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:22:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 808D282FDE
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:22:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e1bf:f1f7:9c5a:c735])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 995C619F5AE;
 Tue,  3 May 2022 21:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651605739;
 bh=bZjTW2X/xv3p2whp/VzWS5UlGAiEGvnfofgSUjAqWSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OgAIYbjv0ncHmEOoJCZTzGk4f5SiaqucAcgfHqxaUFN9hCDV+j2f1JYXALbAq/Nns
 rdfC6d6azjbw96EeEjR7rEfLiJNUfS6BPHng0lbIr1U1EfpCjnvAlRFCCYSkG99yD0
 NnPyTB3JcCS99dThDP3YyODFdDzGOFjknSa56bt9UE6I8GRRAaB4xGcqj+TxFv2Sb4
 9C0gqKA5VB6xTc9N2bwwX9fEns8SnMsY401/sor/784VhUlViadjesXxKowb2SS7Up
 HdR3VM7nhOGqXtrV9zicS54N507zuxi+BwBULf04o1Bz1Im+V0et8oxYxW3wHpxdon
 L0X2g2L8a0HWA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 May 2022 21:22:16 +0200
Date: Tue, 3 May 2022 21:22:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20220503192216.GB2575@scaer>
References: <20220503142701.14397-1-flaniel@linux.microsoft.com>
 <20220503142701.14397-3-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503142701.14397-3-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/sysdig: bump to version 0.29.2
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francis, All,

On 2022-05-03 15:27 +0100, Francis Laniel spake thusly:
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>  package/sysdig/sysdig.hash | 2 +-
>  package/sysdig/sysdig.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
> index 380c9dce1e..c953421f27 100644
> --- a/package/sysdig/sysdig.hash
> +++ b/package/sysdig/sysdig.hash
> @@ -1,3 +1,3 @@
>  # sha256 locally computed
> -sha256  3721c97f0da43c1a68d2962d30363525d8532ab5f2534dfefc86d175e17e423e  sysdig-0.29.1.tar.gz
> +sha256  38ea602085f706af5d07630189216fa240064122650a81456cb092579313ae8e  sysdig-0.29.2.tar.gz
>  sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> index 318746d44a..2d57c0043f 100644
> --- a/package/sysdig/sysdig.mk
> +++ b/package/sysdig/sysdig.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSDIG_VERSION = 0.29.1
> +SYSDIG_VERSION = 0.29.2
>  SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
>  SYSDIG_LICENSE = Apache-2.0
>  SYSDIG_LICENSE_FILE = COPYING
> @@ -32,6 +32,7 @@ SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR)
>  	-DENABLE_DKMS=OFF \
>  	-DUSE_BUNDLED_DEPS=OFF \
>  	-DWITH_CHISEL=ON \
> -	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson
> +	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson \
> +	-DSYSDIG_VERSION=$(SYSDIG_VERSION)

I've extended the commit log to explain why we need to explicitly set
the version string.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  $(eval $(cmake-package))
> -- 
> 2.25.1
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
