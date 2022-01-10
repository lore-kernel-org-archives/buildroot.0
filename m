Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CC4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 15:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B39402C3;
	Mon, 10 Jan 2022 15:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPTVLbgQJ7t5; Mon, 10 Jan 2022 15:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C9F402A4;
	Mon, 10 Jan 2022 15:58:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87D7E1BF317
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EAA4825CA
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 15:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55K3rPG-xqlC for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 15:58:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AE358254A
 for <buildroot@busybox.net>; Mon, 10 Jan 2022 15:58:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dcf:1110:8dc6:b258])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8F64C19F59D;
 Mon, 10 Jan 2022 16:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641830306;
 bh=gEkHumvCgUYJ8xqMSxabDw/gYzaE2nG8efXq+D7kgJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BrgZ2sv3UMTLRBsBWRWk/C/WSzzNqAL63ZFYbnTyaj5m2YY9LyP0suFKeMKiqoCQt
 ckY3Sz+if5SW4Bvp0KULnTQVO/olCmJ1qLsehPXnyH4tzCUn74wRyKoT2u7kUWa3v7
 HwjLkLvjH/Rr9kCUwVmAyKT4UOdTTi7QnVl6dnBhMV1MvbgQ11+vzppqQAKgO+8Nj8
 1gQwwymielSLLXjJ93VB0LjEcjLFFhjII7yYxYp7zWD03JwPyEzgIMOdXIU9+dlmoq
 3R/5U/EPiCUjbayUc2AyFmKsZz5g6GCwsn601oeQzVs/oveiTJA4ZBCs6YgzMmVrYk
 u7PYkv1qUjxQA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 16:58:23 +0100
Date: Mon, 10 Jan 2022 16:58:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220110155823.GS1477939@scaer>
References: <20220110151302.21093-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110151302.21093-1-mf@go-sys.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8723bu: bump version to
 d34603a39a7c925d810fe17c6e8dea5063d43a33
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-01-10 16:13 +0100, Michael Fischer spake thusly:
> patch 0001: Disable concurrrent mode. This causes disconnections.

That patch is missing a commit log and a sign-off for itself:

    # ./utils/check-package package/rtl8723bu/0001-disable_concurent_mode.patch
    package/rtl8723bu/0001-disable_concurent_mode.patch:0: missing Signed-off-by in the header
    (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)

But see below...

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/rtl8723bu/0001-disable_concurent_mode.patch | 12 ++++++++++++
>  package/rtl8723bu/rtl8723bu.hash                    |  2 +-
>  package/rtl8723bu/rtl8723bu.mk                      |  2 +-
>  3 files changed, 14 insertions(+), 2 deletions(-)
>  create mode 100644 package/rtl8723bu/0001-disable_concurent_mode.patch
> 
> diff --git a/package/rtl8723bu/0001-disable_concurent_mode.patch b/package/rtl8723bu/0001-disable_concurent_mode.patch
> new file mode 100644
> index 0000000000..037b1642fc
> --- /dev/null
> +++ b/package/rtl8723bu/0001-disable_concurent_mode.patch
> @@ -0,0 +1,12 @@
> +diff -purN a/Makefile b/Makefile
> +--- a/Makefile	2021-11-04 20:36:55.000000000 +0100
> ++++ b/Makefile	2022-01-10 14:35:17.333934039 +0100
> +@@ -18,7 +18,7 @@ EXTRA_CFLAGS += -Wno-unused-label
> + EXTRA_CFLAGS += -Wno-unused-parameter
> + EXTRA_CFLAGS += -Wno-unused-function
> + EXTRA_CFLAGS += -Wno-unused
> +-EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
> ++#EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE

When patching out unused code, don't comment it; just remove it.

Can you fix those two issues and resubmit, plese?

Regards,
Yann E. MORIN.

> + ccflags-y += -D__CHECK_ENDIAN__
> + 
> diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
> index 04bc776a07..df990a8d63 100644
> --- a/package/rtl8723bu/rtl8723bu.hash
> +++ b/package/rtl8723bu/rtl8723bu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  4c7314dccebda1e55ec8dcf0d5ca8915c2490d17a9f56923f25e6e0e945c10cc  rtl8723bu-9ce1c38439f4f574bb7adaf33949835c25536a28.tar.gz
> +sha256  c9cde757941c88c6117560a2c350dc9c4382dcd6a313b1cae7c6e7eade7055bf  rtl8723bu-d34603a39a7c925d810fe17c6e8dea5063d43a33.tar.gz
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index c35fad5832..e73987cfeb 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8723BU_VERSION = 9ce1c38439f4f574bb7adaf33949835c25536a28
> +RTL8723BU_VERSION = d34603a39a7c925d810fe17c6e8dea5063d43a33
>  RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
>  RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>  
> -- 
> 2.20.1
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
