Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFAAC7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ECF141BAA;
	Sun, 14 May 2023 12:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ECF141BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCfGqr_dBVCF; Sun, 14 May 2023 12:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 423AF41B9B;
	Sun, 14 May 2023 12:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423AF41B9B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC9A1BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01D2441916
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D2441916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FICRvzil6pQO for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:28:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C489141912
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C489141912
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:28:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C3CF8B005A3;
 Sun, 14 May 2023 14:28:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 14:28:31 +0200
Date: Sun, 14 May 2023 14:28:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230514122831.GX2582048@scaer>
References: <20230509122309.192610-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509122309.192610-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684067316;
 bh=JkpCTXHpQNJpOVbVVRVW+/tG5t+naUKaJlesSGDsVt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t/SiCDysNrAkSz8PD5abkSTT4JeeYWXbGZeSr7FIZB29qw/O2OPijwG5QlWhHH0WC
 t1yiH3abKizoACwPhpWtbejeSzcWUzlJ0OhvVyfanMvRgCOqqvwFRCM9Q3t3E6j4WZ
 KIV4l92cvDTjSZGR+T5x7gPL5NgjGXq73CqWzx44CcKQVNOQoSlHQcFtV6rE+5osGg
 VWlGrk6onsrqbc6gKMuVqg2oxWzt7wu/EbovdQZxFRNn4QkwpTe1Hec3F/x8mK8RV4
 Q7p7XDyvYPlhQzhf9JDWJoEp5rGcHc1B87iUUaAa88SxvVkg8+8BzXyehvaYXsbsQW
 AA/pX2LWTzYAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t/SiCDys
Subject: Re: [Buildroot] [PATCH] package/glibmm: bump to version 2.76.0
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-05-09 14:23 +0200, Daniel Lang spake thusly:
> https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.76.0/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glibmm/glibmm.hash | 4 ++--
>  package/glibmm/glibmm.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
> index ea256c3add..ee50ccdb01 100644
> --- a/package/glibmm/glibmm.hash
> +++ b/package/glibmm/glibmm.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/glibmm/2.68/glibmm-2.68.2.sha256sum
> -sha256  91e0a8618f7b82db4aaf2648932ea2bcfe626ad030068c18fa2d106fd838d8ad  glibmm-2.68.2.tar.xz
> +# From https://download.gnome.org/sources/glibmm/2.76/glibmm-2.76.0.sha256sum
> +sha256  8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2  glibmm-2.76.0.tar.xz
>  # License files, locally calculated
>  sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
> index 7f37da8449..da95329a3d 100644
> --- a/package/glibmm/glibmm.mk
> +++ b/package/glibmm/glibmm.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -GLIBMM_VERSION_MAJOR = 2.68
> -GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).2
> +GLIBMM_VERSION_MAJOR = 2.76
> +GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
>  GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>  GLIBMM_LICENSE_FILES = COPYING COPYING.tools
>  GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
> -- 
> 2.40.1
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
