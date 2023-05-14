Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D671CC7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D8C41E56;
	Sun, 14 May 2023 12:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38D8C41E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izzRbRvzdKG0; Sun, 14 May 2023 12:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D303041E40;
	Sun, 14 May 2023 12:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D303041E40
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E22531BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C023183C16
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C023183C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_ItF1Z4Ms4e for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:25:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB10683C14
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB10683C14
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:25:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0648FB0053D;
 Sun, 14 May 2023 14:25:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 14:25:14 +0200
Date: Sun, 14 May 2023 14:25:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230514122514.GU2582048@scaer>
References: <20230513213918.802893-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230513213918.802893-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684067117;
 bh=l2dXhS0WzZgi0o5Er1hBiRUyqkfQaRd89lJaJFd/fvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SjFbsa4CxLMRvU6Dp3Yt4k39vayG80U4+U+p7rZTGNDuJeY6xk4KezLtcBTVj28Nf
 qbzOnBb2Hd888WfTm2IV8aSxKmwM3OMX6yEgcgW5nTn1RcxTpAHzc59UfP6RZvXFa2
 n1cwdS4OTsgDWl4WYArSy3EritlunhrsIz0x0KvvZey0GVE4yWMyMSzWjyteNSPNqB
 e8SwbgtNK1QAvEImvM9TN3WmcVf0LTLCyQ9h52Xptx4Wlb5+B6/7m4WML4C/Q+dBqK
 At3kIdpYP7AKEgoiflJgA/uXj6d0jkugTtDWS/63r6vaY6GVhfEGj9J1bnOGFGOSfI
 KzUXQfSrL84uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SjFbsa4C
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: bump to version 8.2.0
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

Julien, All,

On 2023-05-13 23:39 +0200, Julien Olivain spake thusly:
> See release note:
> https://octave.org/news/release/2023/04/13/octave-8.2.0-released.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit b36e4b1 with commands:
> 
>     utils/docker-run make check-package
>     382265 lines processed
>     0 warnings generated
> 
>     support/testing/run-tests \
>         -d dl \
>         -o output_folder \
>         tests.package.test_octave
>     ...
>     OK
> ---
>  package/octave/octave.hash | 4 ++--
>  package/octave/octave.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/octave/octave.hash b/package/octave/octave.hash
> index f301feb6fd..6e82a589ec 100644
> --- a/package/octave/octave.hash
> +++ b/package/octave/octave.hash
> @@ -1,5 +1,5 @@
>  # Locally computed after checking signature
> -# https://ftp.gnu.org/gnu/octave/octave-8.1.0.tar.lz.sig
> +# https://ftp.gnu.org/gnu/octave/octave-8.2.0.tar.lz.sig
>  # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
> -sha256  79f35c249e5ed71c6cafcf26ef72ffcf4845637093efde309b499a6690154b4f  octave-8.1.0.tar.lz
> +sha256  8ac875a9f8e44b8eb4b75ca8638531e2ca47cd9d13a6ca39d3a0eccd175f8a05  octave-8.2.0.tar.lz
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
> index 63265e7d25..81954bbdd3 100644
> --- a/package/octave/octave.mk
> +++ b/package/octave/octave.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OCTAVE_VERSION = 8.1.0
> +OCTAVE_VERSION = 8.2.0
>  OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
>  OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
>  OCTAVE_LICENSE = GPL-3.0+
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
