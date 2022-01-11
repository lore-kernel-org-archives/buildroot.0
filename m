Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71118C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC01A83E5E;
	Tue, 11 Jan 2022 22:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdGS8oZ7jAvg; Tue, 11 Jan 2022 22:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D0B683E4C;
	Tue, 11 Jan 2022 22:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D82FD1BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D157D4160E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAKomFNbpR1W for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:00:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1B8641606
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:00:08 +0000 (UTC)
Received: from [77.244.183.192] (port=63634 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1n7PBW-0009ty-5R; Tue, 11 Jan 2022 23:00:06 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220111211708.517341-1-yann.morin.1998@free.fr>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <5c2d7de5-56e5-d98a-3f13-3ef18ffcaa5e@lucaceresoli.net>
Date: Tue, 11 Jan 2022 23:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111211708.517341-1-yann.morin.1998@free.fr>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH] package/zynq-boot-bin: drop legacy package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 11/01/22 22:17, Yann E. MORIN wrote:
> Since commit 6dd5a33c485c (zynq_zed: bump U-Boot to xilinx-v2016.2), we
> have no in-tree users of zynq-boot-bin.py, as U-Boot has since v2016.01
> been able to natively generate Xilinx images.
> 
> zynq-boot-bin.py is python2-only and there is zero chance that upstream
> will move it to python3. WE could carry a pytohn3-compatible copy, but

s/pytohn3/python3/

> that tool is now virtually unused.
> 
> 6 years have passed now; let it rest in peace at last.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Config.in.legacy                         |  7 +++++++
>  boot/uboot/Config.in                     | 12 ------------
>  boot/uboot/uboot.mk                      | 11 -----------
>  package/zynq-boot-bin/zynq-boot-bin.hash |  2 --
>  package/zynq-boot-bin/zynq-boot-bin.mk   | 22 ----------------------
>  5 files changed, 7 insertions(+), 47 deletions(-)
>  delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.hash
>  delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b3e8d5a6d8..16d5ac40b3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2022.02"
>  
> +config BR2_TARGET_UBOOT_ZYNQ_IMAGE
> +	bool "Generate image for Xilinx Zynq"
> +	select BR2_LEGACY
> +	help
> +	  Since 2016.1, U-Boot can natively generate the Zynq boot image,
> +	  and so the Xilinx-specific format and tools have been removed.

As said in the discussion after James' patch, I would add something like:

  Should you still need zynq-boot-bin.py you can download it at <URL>
  and call it from a post-build script. You will need to install python2
  on your host to run it.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
