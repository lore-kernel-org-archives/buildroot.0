Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A1DC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 838C440256;
	Tue,  3 May 2022 19:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIpjR7g5_mFv; Tue,  3 May 2022 19:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FC2540298;
	Tue,  3 May 2022 19:15:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C8131BF33A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDEB740298
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-5LTdw1aL_Y for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:15:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D17FA401C5
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:15:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e1bf:f1f7:9c5a:c735])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AC7DD19F553;
 Tue,  3 May 2022 21:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651605310;
 bh=ukRJnWpgu+9GsMIxeTtD5UT15L0A/hOpHHGixmz/3FE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q/4TXw62SSo6mdlZ/Io9HUBdcK1enYNPoJPBlwGxm6ng/Gwq/6T8Z0jAHhhuQhtcl
 PXemvPMshMGtU6aoNKIB6b9JN9e4JiXbJtvHrENWrG4xTneCJ+q788XDH96qkKyhRr
 sOgjETOTuHbIuPGr8VVk2Gk0Mhn12yIw1LDLk2izQtOTsWppYjys4RTlFAzuC6bIkZ
 jRy0NVynpnyjmEnZMqXy4oNQyWpGmqcoyB5gUx0Z5VPiP1EeCG72cyCaH5Ff1FroFq
 2gTlXe0yVJJf3aNk3CnsG83Ex23xlaLswBmzaDCdgmwFvPOSfBhA6pEQeAN4tHxlrc
 pWmVxCHlXPkKA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 May 2022 21:15:07 +0200
Date: Tue, 3 May 2022 21:15:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20220503191507.GA2575@scaer>
References: <20220503142701.14397-1-flaniel@linux.microsoft.com>
 <20220503142701.14397-2-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503142701.14397-2-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/sysdig: fix DRIVER_NAME
 definition
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
> When I wrote the previous commit, I was not fully focused and wrote:
> -DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME.)
> Which leaded to DRIVER_NAME to be empty.
> So, it was not possible to use sysdig due to the following error message:
> error opening device /dev/0. Make sure you have root credentials and that the  module is loaded.
> 
> Fixes: ea86757e51cf ("package/sysdig: bump to 0.29.1")
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysdig/sysdig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> index 76cabcaeca..318746d44a 100644
> --- a/package/sysdig/sysdig.mk
> +++ b/package/sysdig/sysdig.mk
> @@ -28,7 +28,7 @@ SYSDIG_DEPENDENCIES = \
>  SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
>  	-DBUILD_DRIVER=OFF \
>  	-DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
> -	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME.) \
> +	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
>  	-DENABLE_DKMS=OFF \
>  	-DUSE_BUNDLED_DEPS=OFF \
>  	-DWITH_CHISEL=ON \
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
