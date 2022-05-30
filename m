Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A71C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFA0883ECA;
	Mon, 30 May 2022 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id naxeqyP4I2ql; Mon, 30 May 2022 21:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D2C83E89;
	Mon, 30 May 2022 21:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7A7E1BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A54E141A21
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8xWWIw_Exd9 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:46:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 809EB41A09
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:46:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f587:e70b:15ff:66a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 32AA45FF33;
 Mon, 30 May 2022 23:46:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653947216;
 bh=A1ZaaFB3D9i+d8WdQ0gKr27pVr29U3slukVHZW8QLp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hv457S6n7xgTLKYTMlqLdz72+p6ZIK24wFk6dhWLT7Jd38YHTkbSBiVPvHLKOawpR
 ZWPRvkRQG2bhI8uAxAhVXU+HmDYiEW5RjQTimOKqnMlKTv7Lb/H31ORV2ElfgXhAw1
 oOCqPhmliRblIo5PRPHfKTIBomHrfOzJrB/NVTP8gWjnkz+zDYR11TFixNt384GZIt
 Lcbh4i55hNji+CDJ0Rpv8WRgboGj0zHg7yHxZXcI1Ur5C9IzJDzsHdqalQAUt+gZSS
 msGTCSBBSbFmpLd+wI9RLGiE1WJd15eePehPyDEfaneKMW4ZVq6CPfqthuJrZ5ezEZ
 +QbQCMRctfVEA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 May 2022 23:46:53 +0200
Date: Mon, 30 May 2022 23:46:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220530214653.GC1390376@scaer>
References: <YggrcBOVfufdvm8G@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YggrcBOVfufdvm8G@waldemar-brodkorb.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] board/qemu/ppc-bamboo: use path to vmlinux
 image for copy and paste users
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

Waldemar, All,

On 2022-02-12 22:49 +0100, Waldemar Brodkorb spake thusly:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/ppc-bamboo/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/qemu/ppc-bamboo/readme.txt b/board/qemu/ppc-bamboo/readme.txt
> index 0b70d2fa54..53d1970698 100644
> --- a/board/qemu/ppc-bamboo/readme.txt
> +++ b/board/qemu/ppc-bamboo/readme.txt
> @@ -1,5 +1,5 @@
>  Run the emulation with:
>  
> -qemu-system-ppc -nographic -M bamboo -kernel vmlinux -net nic,model=virtio-net-pci -net user # qemu_ppc_bamboo_defconfig
> +qemu-system-ppc -nographic -M bamboo -kernel output/images/vmlinux -net nic,model=virtio-net-pci -net user # qemu_ppc_bamboo_defconfig

Since the correponding defconfig does build host-qemu, it would have
made sense that the path to qemu-system-ppc also had been changed to
output/host/bin/qemu-system-ppc, but I see that other readmes do not
use that either...

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  The login prompt will appear in the terminal that started Qemu.
> -- 
> 2.30.2
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
