Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B37C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 13:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 915034166D;
	Fri, 11 Feb 2022 13:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kr8AVRaC2Kke; Fri, 11 Feb 2022 13:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67B64166B;
	Fri, 11 Feb 2022 13:37:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94FC51BF2CC
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 13:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B92460E1B
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 13:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1phNpG_ugF9Y for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 13:37:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1266760C0F
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644586663;
 bh=DDTcNsXiAynxpGkmVB67b4/UV/IcYX33bPhlHOGxTWg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=I2XHZBwwxR4UT7s35pC232WpW3HFeZmJJvRAt4T5to64kjFUE3AD927mDxzrgZhsD
 vAPvoiwRCA3a7mBsRr3L+OLvRhb6CnU3atJHIqVINe9Ice/4zgpsr0OXT1tWcCHq9n
 0j5IsExRG9HovMi/vQlK/k/A3hIdHXv0n9lxC1jg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.232]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUowV-1nj5Xi2ryL-00QjXj; Fri, 11
 Feb 2022 14:37:43 +0100
Date: Fri, 11 Feb 2022 14:37:42 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <20220211143742.1fdec542@gmx.net>
In-Reply-To: <20220211112245.1357817-1-kieran.bingham@ideasonboard.com>
References: <20220211112245.1357817-1-kieran.bingham@ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:ohynS+eN508gi9oEJNH8FqImVku/AQO96SVOh2zCr4rfoTDQvTu
 Bgm97dAzoblzu80Yx5ayaW90K1XOZNTBAAYSy3kAm+XTEfNJUqgF58VDv1l6nDQsybBg0kQ
 SDfH61gvEVA6LVD+VGXSL8Vtr4UebuB3uwYUBaRd4FFiNJNPuF5r2JTGZ246QgzO8Rq95Zn
 /cuyEE2bfkJD9v/ohZ++w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q7BrQR0Dltc=:dQN+4VFE9s8ZAUeb2/lp2L
 gXRzLJsnQ9tdD21agVoMBQ3FHw1bp4mHvu8ugzlOs0xqnTm0IWn5HBmZ6kcIB5PohhlIbx/YN
 but7vBhJsZQFYKL0MqmaBjpxos3DcQCmEH2Vbn5q36B7YQvY57080WYNSvH0tB4fR42g5/ir4
 KPG8fKElBWUiUCVq7UDEmir8WSvxwc2YlZ7VYiwb3HMgcbRdYGQd4O2xmbuDLmjnazk6Jaqkx
 JDnIq5seodGPSDS7nzwfzvSV1u2mGXGJbemYGgOhP/y8pVLXbr0dhj6uhRVZPFtZl5/JG4loH
 IkFA2kZDPcUL71H4ghLxaDnlWjUZBZfffyxq2bx5ipGHu07I97eUwyHpHM5KsjRcBAk/sha3K
 L/zxCuzwfZqRy+D9uQjtLiw5A9LIdlT3gqyXdq0WiENzaekr8Lu+TumJr3y4CBy3r/88qmUft
 R1OU6W/wZVeQoKzZU9gtr9BVSdICzHkdnTt+KmGq0RMQJcAH/RD22LFBvgKTSU26FFEhuLA7b
 qZm5GXYm4QVYLCa9JAWgdRcVOWsNhh3XoPhFvP7L2Cq31tnel/gXlf6U7n3MJl4rZrwALgedj
 hqqxm4xg9ssEKDvhi1DQg3yffyiklTG/jGCXm7IdxVwOp/P9j0WdVCZl9iJ2lu3bwgiNqOMdS
 hzHm6Yg/D/ZdGAZzyK9D78AUXbKlOpOTVe41bEEUtr3Acq1fsMpSd2W5otr3I4AYH9lGJkROR
 zfpKvzZsnZtmdCESZNaI7mKYTXSz2a/c4XGbzwi/1b2LU/6QHh6DNCxsiouJ+qGYH767xImCL
 GySjUOjG642bQCXVrLbOY6PU96b4pOWBNpQoHIDr3l/20D02/T9mpFOfYMAaTnMIIWN/oUhEG
 JsScBxc1dOMf9JI/dktzUjq5+ngj0ZA5OEqSFU5boj2r/gGuWAs4oWtsg4Rf/I92rMOhTRFjM
 788+wdr8jeq2trAyU+KZoI/cbhMirXC4C8ZJGSaN1uxw0wRvxMRWXA2Uby/Hk3fXmmcYDrJQB
 Hq+EuH99TOPc25dfTYlPS6naLcMpu++HuvbusBHsXRVWyCQoc7f1EnbqdourOgZXdVvABTl3G
 nGKbe9Yh0r5fC4=
Subject: Re: [Buildroot] [PATCH] package/libcamera bump to
 1966b9a58436fab51f8270aad6a228b935e4fac4
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

Hello Kieran,

one nitpick: the patch subject should be 'package/libcamera: bump to ...'
(instead of 'package/libcamera bump to ...')....

On Fri, 11 Feb 2022 11:22:45 +0000, Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:

> Update to the latest libcamera commit.
>
> This incorporates fixes and improvements for Raspberry Pi which will be
> needed to go along side the new libcamera-apps package.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index a7ca27a96b7f..8d5abf0e621c 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  305e6f458d2bf3d4b697ffe33e104b696db6b1492bb5422e2cce1937e58516f1  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8-br1.tar.gz
> +sha256  3624c71ba492c602c5335aab3dc87798193f7596c6cc75f7cfb847165f180930  libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4-br1.tar.gz
>
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 534d8d26371f..cf1af5aaf065 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = 40f5fddca7f774944a53f58eeaebc4db79c373d8
> +LIBCAMERA_VERSION = 1966b9a58436fab51f8270aad6a228b935e4fac4
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>  	host-openssl \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
