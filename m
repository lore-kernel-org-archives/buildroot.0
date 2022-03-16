Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D05C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 22:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72C6E60F70;
	Wed, 16 Mar 2022 22:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMtIB_Y5A12a; Wed, 16 Mar 2022 22:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5E860AD0;
	Wed, 16 Mar 2022 22:10:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22D5F1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF1440286
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fP8PTDN02vD8 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 22:10:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD56040214
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 22:10:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8A86F13F854;
 Wed, 16 Mar 2022 23:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647468648;
 bh=zzhiXVEM7afiMfq5R8xe3saYyXElgKclKS8eNWwBoPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BPKVqJb67Ow32DTNCMRiwe8Eq4+T83oVSWcsNX2L2LD1AvK1+lh3MAhi46Pu+n7S0
 lloW18XRY33sVHiPahW0Qy/l4LqvD++t7m7CLFloSQgB1IE3DZk6g2IfvPDwyYkebl
 Dpalf17XMRVO39aVNv/NRTTFggyxH2V5ThXN/Ykhx3y/bElN+FJyhT3LpZUfnhkIpN
 RljGaGkJoFD1eFIGVlCy+sv6/Li/5glrtRXsPyDM+ZIPr0S4hlfxdmaxskjiehHUim
 RYGDzjuRDiecgm+27abnj/HsVS1tjxQEkQvuoEZwdPrW1gPlJttu6euY3nPIaemeW5
 gv9SPnEhNyuUg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 23:10:46 +0100
Date: Wed, 16 Mar 2022 23:10:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220316221046.GD283544@scaer>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 00/12] package/gstreamer1/*: bump version
 to 1.20.1
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

Peter, All,

On 2022-03-16 22:36 +0100, Peter Seiderer spake thusly:
> For details see [1] and [2].
> 
> [1] https://lists.freedesktop.org/archives/gstreamer-devel/2022-March/079724.html
> [2] https://gstreamer.freedesktop.org/releases/1.20/#1.20.1
> 
> Peter Seiderer (12):
>   package/gstreamer1: bump version to 1.20.1
>   package/gst1-plugins-base: bump version to 1.20.1
>   package/gst1-plugins-good: bump version to 1.20.1
>   package/gst1-plugins-bad: bump version to 1.20.1
>   package/gst1-plugins-ugly: bump version to 1.20.1
>   package/gst1-devtools: bump version to 1.20.1
>   package/gst1-libav: bump version to 1.20.1
>   package/gst1-vaapi: bump version to 1.20.1
>   package/gst1-rtsp-server: bump version to 1.20.1
>   package/gstreamer1-editing-services: bump version to 1.20.1
>   package/gst-omx: bump version to 1.20.1
>   package/gst1-python: bump version to 1.20.1

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

>  package/gstreamer1/gst-omx/gst-omx.hash                       | 4 ++--
>  package/gstreamer1/gst-omx/gst-omx.mk                         | 2 +-
>  package/gstreamer1/gst1-devtools/gst1-devtools.hash           | 4 ++--
>  package/gstreamer1/gst1-devtools/gst1-devtools.mk             | 2 +-
>  package/gstreamer1/gst1-libav/gst1-libav.hash                 | 4 ++--
>  package/gstreamer1/gst1-libav/gst1-libav.mk                   | 2 +-
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash     | 4 ++--
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk       | 2 +-
>  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash   | 4 ++--
>  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk     | 2 +-
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash   | 4 ++--
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk     | 2 +-
>  package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash   | 4 ++--
>  package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk     | 2 +-
>  package/gstreamer1/gst1-python/gst1-python.hash               | 4 ++--
>  package/gstreamer1/gst1-python/gst1-python.mk                 | 2 +-
>  package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash     | 4 ++--
>  package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk       | 2 +-
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.hash                 | 4 ++--
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.mk                   | 2 +-
>  .../gstreamer1-editing-services.hash                          | 4 ++--
>  .../gstreamer1-editing-services.mk                            | 2 +-
>  package/gstreamer1/gstreamer1/gstreamer1.hash                 | 4 ++--
>  package/gstreamer1/gstreamer1/gstreamer1.mk                   | 2 +-
>  24 files changed, 36 insertions(+), 36 deletions(-)
> 
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
