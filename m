Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C42C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 05:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737EF4191A;
	Tue, 17 May 2022 05:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_ivVxjGG2v3; Tue, 17 May 2022 05:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 098E94188C;
	Tue, 17 May 2022 05:38:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 320FB1BF33C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2005360B77
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3UFIypz1fDs for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 05:38:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE4F160B5D
 for <buildroot@buildroot.org>; Tue, 17 May 2022 05:38:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0DCE2B0051E;
 Tue, 17 May 2022 07:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652765886;
 bh=yF1FOcQQLuLdvAsd+3WQ4Lk3YGEBvhfDy0FjpuystWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j35aa8ulG2kt9n951B1a1hurIZgiso+7YDKlg6ejbO+z1NomnLribUesxpDZNcKiO
 pCmyW5sqbAD4O2P8hifZBJXSe2jnoUc/39PvjVKVCV+tSx3Vy1LLMgMeX3mZPtbolw
 hXtBMlj5HxsMkmlOQ9LhftdGeHXPz7tf9JD5JwjQ4fpR5usE4K7qJj5VeI+OT8gRvw
 pAajTuGe2Yovk4h9Z+/7IKnK4V0nUkqBS0p6yaIy+a2LrzsloPKkox8hDHWyXbmRlJ
 16PdC54HirtdCU/VsKPsoBYN3KUZAI5cHPfpkGUDu/tA2P3o8viYeNW4iJY9gkStnF
 lyrv8XQfjtJMw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 07:38:03 +0200
Date: Tue, 17 May 2022 07:38:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Linus Kaschulla <linus@cosmos-ink.net>
Message-ID: <20220517053803.GN1597494@scaer>
References: <20220517032459.3400-1-linus@cosmos-ink.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517032459.3400-1-linus@cosmos-ink.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] fs/squashfs: Add block size option
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

Linus, All,

On 2022-05-17 03:24 +0000, Linus Kaschulla spake thusly:
> One advantage of squashfs over similar technologies is the support for
> bigger block sizes. However the default size is not a lot bigger
> (typically 128k if no `-b` flag specified).
> 
> This patch adds the ability to select from common block sizes
> which for example can aid in improving compression ratio.
> 
> Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
> ---
>  fs/squashfs/Config.in   | 50 +++++++++++++++++++++++++++++++++++++++++
>  fs/squashfs/squashfs.mk | 14 +++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> index 70d4a20cf0..341e50a08c 100644
> --- a/fs/squashfs/Config.in
> +++ b/fs/squashfs/Config.in
> @@ -5,6 +5,56 @@ config BR2_TARGET_ROOTFS_SQUASHFS
>  
>  if BR2_TARGET_ROOTFS_SQUASHFS
>  
> +choice
> +	prompt "block size"
> +	default BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
> +	help
> +	  Data block size. Bigger values can improve
> +	  compression ratio.
> +
> +	  If unsure, leave at 128k (default).
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
> +	bool "4k"
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
> +	bool "8k"
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
> +	bool "16k"
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
> +	bool "32k"
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
> +	bool "64k"
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
> +	bool "128k"
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_256K
> +	bool "256k"
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_512K
> +	bool "512k"
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K
> +	bool "1024k"
> +
> +endchoice
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_BS
> +	string
> +	default "4K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
> +	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
> +	default "16K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
> +	default "32K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
> +	default "64K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
> +	default "128K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
> +	default "256K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_256K
> +	default "512K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_512K
> +	default "1024K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K
> +
>  config BR2_TARGET_ROOTFS_SQUASHFS_PAD
>  	bool "pad to a 4K boundary"
>  	default y # legacy was always ON
> diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
> index 7a5e3e313e..1790773f7e 100644
> --- a/fs/squashfs/squashfs.mk
> +++ b/fs/squashfs/squashfs.mk
> @@ -6,7 +6,19 @@
>  
>  ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
>  
> -ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
> +ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS) -b $(BR2_TARGET_ROOTFS_SQUASHFS_BS)

Here you added the value to the option list using the hidden option
string, so...

> +ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_64K),y)
> +ROOTFS_SQUASHFS_ARGS += -b 64K
> +else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_128K),y)
> +ROOTFS_SQUASHFS_ARGS += -b 128K
> +else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_256K),y)
> +ROOTFS_SQUASHFS_ARGS += -b 256K
> +else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_512K),y)
> +ROOTFS_SQUASHFS_ARGS += -b 512K
> +else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_1024K),y)
> +ROOTFS_SQUASHFS_ARGS += -b 1024K
> +endif

... there is no need to add it a second time based on the booleans.

Finally, it would have been nice to add two test cases that at least the
4K and 1024K options do work (the existing test tests the defaultm i.e
128K). Tests are in:  support/testing/tests/fs/test_squashfs.py

Note that adding tests can be done in a followup patch, of course.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
>  ROOTFS_SQUASHFS_ARGS += -nopad
> -- 
> 2.35.1
> 

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
