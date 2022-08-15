Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B7C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 921C040256;
	Mon, 15 Aug 2022 19:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 921C040256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6AS6_BhR5Fl; Mon, 15 Aug 2022 19:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93D5640207;
	Mon, 15 Aug 2022 19:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93D5640207
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 684031BF96B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43E5560B68
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43E5560B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8nPGCx0YI6M for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:36:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2962360B67
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2962360B67
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:36:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 506266013C;
 Mon, 15 Aug 2022 21:36:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 21:36:17 +0200
Date: Mon, 15 Aug 2022 21:36:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815193617.GK2854108@scaer>
References: <20220815191914.568237-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815191914.568237-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660592179;
 bh=CS/8Jot7nHnnI4jauI1VcpufH7cY4wU6BSTe+vZq44g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MLjfoFbihrAzH2CpxK6CpUj+7SXOh5MJG6A1g6jNbnW0v7vPPvv9tv+JFEBNKNWW/
 YhozXUBBFouHTIt0Yn5N4YNtXe7Q+guw8wtd/xzjyFSbzT7CupBb4XFFINFne8nDMF
 yy+WLSJRx/vYuYYIqIkhUAdY+ZEniWIqkq+ITxNnwkrSdfZlGmZqcK/5BpndeIEz73
 mhbxUXAB4nCnPHLr3tYS6M3JFjEwvUnp7qZQoWnYuECmtXDH7Gk/jmEZLhIe8WtQ6Z
 J+udiTJf6YFBGDk605TgM6DxAO3h/tXVgw3hQzMCdtxWGsvRxFUOdNozf1HdRjgGXt
 Db57W4KVmUxYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MLjfoFbi
Subject: Re: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.1.0-45
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

On 2022-08-15 21:19 +0200, Fabrice Fontaine spake thusly:
> - Fix CVE-2022-1114: A heap-use-after-free flaw was found in
>   ImageMagick's RelinquishDCMInfo() function of dcm.c file. This
>   vulnerability is triggered when an attacker passes a specially crafted
>   DICOM image file to ImageMagick for conversion, potentially leading to
>   information disclosure and a denial of service.
> - Fix CVE-2022-32545: A vulnerability was found in ImageMagick, causing
>   an outside the range of representable values of type 'unsigned char'
>   at coders/psd.c, when crafted or untrusted input is processed. This
>   leads to a negative impact to application availability or other
>   problems related to undefined behavior.
> - Fix CVE-2022-32546: A vulnerability was found in ImageMagick, causing
>   an outside the range of representable values of type 'unsigned long'
>   at coders/pcl.c, when crafted or untrusted input is processed. This
>   leads to a negative impact to application availability or other
>   problems related to undefined behavior.
> - Fix CVE-2022-32547: In ImageMagick, there is load of misaligned
>   address for type 'double', which requires 8 byte alignment and for
>   type 'float', which requires 4 byte alignment at
>   MagickCore/property.c. Whenever crafted or untrusted input is
>   processed by ImageMagick, this causes a negative impact to application
>   availability or other problems related to undefined behavior.
> - Update hash of LICENSE (year updated with
>   https://github.com/ImageMagick/ImageMagick/commit/80629dfb3fea55eefa2dd8bdd9ca1be341502e16)
> 
> https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/imagemagick/imagemagick.hash | 4 ++--
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index 278becd2ab..ff0f3e26c6 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  385ca5bd8ce9b37e685779c46868171af949265c9db40067c1c4d7442dbc723e  imagemagick-7.1.0-19.tar.gz
> -sha256  040badb77b659e751ea16113490a937e1e01f3f5d32181e966b8982413533fb2  LICENSE
> +sha256  3df6ca6dff15a4e8a20b4593c60285a59e38890440494d91a344e5c0e2bb3eec  imagemagick-7.1.0-45.tar.gz
> +sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 64a530c6d2..893606ff01 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.1.0-19
> +IMAGEMAGICK_VERSION = 7.1.0-45
>  IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>  IMAGEMAGICK_LICENSE = Apache-2.0
>  IMAGEMAGICK_LICENSE_FILES = LICENSE
> -- 
> 2.35.1
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
