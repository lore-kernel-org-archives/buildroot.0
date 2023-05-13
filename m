Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88DAC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 11:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BC07822A3;
	Sat, 13 May 2023 11:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC07822A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3WBHue24XS3; Sat, 13 May 2023 11:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8FD080E5E;
	Sat, 13 May 2023 11:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8FD080E5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD13C1BF21A
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 11:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B78FF80E5E
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 11:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B78FF80E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1ldh5s3v3dq for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 11:59:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE23880E59
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE23880E59
 for <buildroot@buildroot.org>; Sat, 13 May 2023 11:59:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D844A19F747;
 Sat, 13 May 2023 13:59:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 13:59:18 +0200
Date: Sat, 13 May 2023 13:59:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>,
 James Knight <james.d.knight@live.com>
Message-ID: <20230513115918.GP2582048@scaer>
References: <20221007133912.2869000-1-james.hilliard1@gmail.com>
 <20221007133912.2869000-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221007133912.2869000-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683979163;
 bh=NmXgtY0HdwVLeCb6vxdj88CJ6jnHzqwyXiR/nzQNlHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LVrDGBTDc5lHir6j/Oiadgt26M1pruNNV2CTiXZ5HFzIPKY9EpfeBUK6ffPeeNGod
 oxpq7MQsLNOZwBEhMlfqUt0/ud8lbPxV8jLrEdqsi9JSbcbF2YqRqNjGVMdgXlnSY7
 hML8IKNEmr1qffFRsd77RdDKM3Fq7LjSGT7XuY3XLMFXyEQWsX864Rz0qSecHuB2KJ
 nB5OERpvajDVoL3n+SCeP8nh/F2GBpSNnhl4bxXeJ2gluADbBZHcJFbctJL26YhlAv
 8aamFeUG/t51eH0TYMhJXF5M8xGENhyDRfu55I29zG8cArcdQH6nBH9hcEpYYzYwzU
 fnxrnXMgomk3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LVrDGBTD
Subject: Re: [Buildroot] [PATCH 2/2] package/gobject-introspection: bump to
 version 1.74.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James H., All,

+James K. for having bumped libglib2 to 1.76.x:

On 2022-10-07 07:39 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gobject-introspection/gobject-introspection.hash | 4 ++--
>  package/gobject-introspection/gobject-introspection.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
> index 8f9d323d9a..c1a1363ddb 100644
> --- a/package/gobject-introspection/gobject-introspection.hash
> +++ b/package/gobject-introspection/gobject-introspection.hash
> @@ -1,5 +1,5 @@
> -#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.70/gobject-introspection-1.72.0.sha256sum
> -sha256  02fe8e590861d88f83060dd39cda5ccaa60b2da1d21d0f95499301b186beaabc  gobject-introspection-1.72.0.tar.xz
> +#From https://download.gnome.org/sources/gobject-introspection/1.74/gobject-introspection-1.74.0.sha256sum
> +sha256  347b3a719e68ba4c69ff2d57ee2689233ea8c07fc492205e573386779e42d653  gobject-introspection-1.74.0.tar.xz
>  sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
>  sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
>  sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index c8ad9b3c72..436c12aa48 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.72
> +GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.74

Do we have to make sure that the "major" version of the GNOME packages
be aligned, or is it possible tix-n-match versions?

I.e. can we keep goi 1.74.x with libglib2 1.76.x, or should both be
1.76.x ?

Regards,
Yann E. MORIN.

>  GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
>  GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
>  GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
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
