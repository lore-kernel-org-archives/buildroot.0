Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A6EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 21:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB22B404F7;
	Sun,  6 Mar 2022 21:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNAr7nsgr572; Sun,  6 Mar 2022 21:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A318940121;
	Sun,  6 Mar 2022 21:32:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDE461BF2B9
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7A1F4056A
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aeCOl3t-2ekq for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 21:32:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C740140510
 for <buildroot@buildroot.org>; Sun,  6 Mar 2022 21:32:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b52b:1138:2d2c:406c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 134ADB0051E;
 Sun,  6 Mar 2022 22:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646602335;
 bh=YZCY2xyoDejxKQxw1axufRHv5BoSV2EiKxNGn56aeWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BAkuFaxUbIEXsMpSGTwuI9G6q3V8Tb3/bkzfwPXXAWHZjpUVY7DyNhDm+sy/L7lzl
 uv2SNKW9ZX37Dz77hsV6v6/mZG/j4GSLftm/GGErhcwCP1yU2yJeL+gwRlsQCRAgo6
 z+ol6ATm7BtIU5EnuFXubB+6/vAxJoqthH8E+rgHloXVnDOzJTp3MWjTe95U1qgPwK
 5BRR6v846d0wVkQBIozIupdksPESokO2zSsjgtsEAma5CICqEWh719KvsEpY1CCxi+
 5DvkPFodW8WkkUgqLHVD8MjcuUNrWhMyw57NOXu6s4IMd16Ko+ONJc1haC3+0unpBh
 qT8QlaWKE1ulg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Mar 2022 22:32:12 +0100
Date: Sun, 6 Mar 2022 22:32:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220306213212.GH228549@scaer>
References: <20220222204034.3139362-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222204034.3139362-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.6.0
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

Fabrice, All,

On 2022-02-22 21:40 +0100, Fabrice Fontaine spake thusly:
> 2.6.0 is an maintenance and security release.
> 
> https://github.com/FreeRDP/FreeRDP/releases/tag/2.6.0

You claim 'security bump' in the title, but the announcement does not
seem to identify any actual security fix, as compared to 2.5.0 which did
explicitly list security fixes:
    https://github.com/FreeRDP/FreeRDP/releases/tag/2.6.0

So, I don;t think this is material for master, is it?

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freerdp/freerdp.hash | 4 ++--
>  package/freerdp/freerdp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
> index e31b8d5b96..780061bdbb 100644
> --- a/package/freerdp/freerdp.hash
> +++ b/package/freerdp/freerdp.hash
> @@ -1,5 +1,5 @@
> -# From https://pub.freerdp.com/releases/freerdp-2.5.0.tar.gz.sha256
> -sha256  0fd9396068cda8e6d884d063a4993001f140f46c36464ccae261b9475050cd2b  freerdp-2.5.0.tar.gz
> +# From https://pub.freerdp.com/releases/freerdp-2.6.0.tar.gz.sha256
> +sha256  a4ba0a75e30ed25fffc4cd4e89d0eb92e66894caeb6c78dc5e23b6b7c04f60fe  freerdp-2.6.0.tar.gz
>  
>  # Locally calculated
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index c536f6cb1c..edbfb6801a 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREERDP_VERSION = 2.5.0
> +FREERDP_VERSION = 2.6.0
>  FREERDP_SITE = https://pub.freerdp.com/releases
>  FREERDP_DEPENDENCIES = libglib2 openssl zlib
>  FREERDP_LICENSE = Apache-2.0
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
