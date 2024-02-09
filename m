Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409C1C4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 15:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D478541ED1;
	Fri,  9 Feb 2024 15:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_T-rEAC9yzE; Fri,  9 Feb 2024 15:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E118641F14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E118641F14;
	Fri,  9 Feb 2024 15:05:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFF431BF3BC
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 15:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7F6041ED1
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 15:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEwadhpH8aMx for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 15:05:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64BD341F14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64BD341F14
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64BD341F14
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 15:05:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.3]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MA7GM-1rirUc0otG-00Bend; Fri, 09
 Feb 2024 16:05:08 +0100
Date: Fri, 9 Feb 2024 16:05:04 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240209160504.1d6f7ae5@gmx.net>
In-Reply-To: <20240209142326.2570138-2-roy.kollen.svendsen@akersolutions.com>
References: <20240209104705.1825396-1-sebastian.weyer@smile.fr>
 <20240209142326.2570138-2-roy.kollen.svendsen@akersolutions.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:JckUmzlJNQ83oKDyDKamF4iDpGOioPn3Fl5gpZcdOWy1JAxVoHe
 DOGlRfyxEeACLF1YJe48IbkkJFMFurOFwPSRuAkeiB5EYL0Oip17nWfrVjelGAp/V1zYCw3
 voUPSmZWdOSmMHTeqnwfGCKqCJCwx1Yj/Z6cy4SiDustdeqGk+1jAor5r7P+mw+TzkppCBx
 cptzjXO3dFvnIVZ2o++Iw==
UI-OutboundReport: notjunk:1;M01:P0:iGBOwVcmGJs=;izT6RwE15sM1C4+3qjX7wudlonQ
 8Aqc2PGAsEV9kDNur2A1t6m47pDYyIE/U1LuvN3Q9IfuR70aRaOvjMGOAA6uoLfetiF3dH4h2
 GZ5/POoAqbY3MpDUTC48rwiPKVmVkK4Ezz6UZ1mro5F0bfz8lAMb6xRq1qtTV5rfXl0y/0ekZ
 tdXb28Ig4hbiruXaZ3CUaoDdfXS7plyjAzyX4cChAQ/hiD0XPttv5Mps/iA4y4fGJCOatl8C8
 fWIPW8DZR3kSJu7TUCzbeJVTC4Dssp6jOB+GeI9aQHQ8nO673P34AFd0sVQ6WhxKVQb2Mtjvd
 3feijkeXSXIctN0WRhoh/7uXmuCbVDXvBzlYWHbGBeqrNFdXYDKNu+lbpnSGZN+PjbPME1ZvC
 r3WOvgGpzod38bYufmOkxtB5WSmTuTGtWLFbHh+xThpe4TVyJY9rXtsswumkORKD7+bHO8+QT
 FFCXfNkjDDv+eL1p07LtssKl0wK6vPX4CMbEZLFDPQJoHgg/bUJdZDj6Kw2Ad7qSgofXwLLxR
 oBk5adDP2osbcrFjo4Pw20v8xqnwQKSOas/9hLcVInxlb3sC5CyvpSgJmlaYBFwDywmqr6Qfa
 7HDGrCFLC1a4D3xXSyX4k8uVVADttWCRl1yv55UnYeFULTXZRjzQdbIDGa6DIKMVi1CY58JR0
 uScI55wTmuzsUWCZ5g9qn6M7HYMvVHu411K4g0dC7SUilvxvl4aO5HhASiBxjXAtVaf/uzL9n
 hX9FQyIIGlFxcF/VMZite31XbF2HodQy6bpfWIM3eRQ9uu1/cG/W6fRux3PASgJ5OQeKQIOIw
 9mTklIGzpbcThddvFLE0LNDitR7Iwxn14rk8WgZKVWJ+Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1707491108; x=1708095908; i=ps.report@gmx.net;
 bh=LwJ1q1UQ1uKH9oedNWmsY4nat23J0pXlAosbLaBjtoA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=X6qTM4n9OrmHGzX1bC4mbvKPLNLGTqRfnoSN9phzmQdMuo7FKSpR1iexTTcqi7E9
 8a6N8NmXVsfpwp/yIl8sOQzk+U19iFoKSMI7P1Wiv8nQuxsTIet+WtPFltk1RVB1x
 14KmQd/HRvcygESyGDw3zHw6p2rPvjR+XMySD4vxCUwODkV+Br53Pgtcju4ByfoTZ
 wWS9+WFQ/T8fupXJX8zGvWW1XKbLceCIl2hHkGjuy8Qo3MxEcgCEw5TqmIlyOIOhE
 oA0mzSMg074a/xVKB3+dLN8eDcuhkaGw9HM/qavtK8G11kmpbwu/8fDJV4EbYIcj6
 0vLZVheQeb3M07Mm0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=X6qTM4n9
Subject: Re: [Buildroot] [PATCH 1/1] package/qt53d: bump to latest kde
 submodule version
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 sebastian.weyer@smile.fr, Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  9 Feb 2024 15:23:26 +0100, Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> The build failed because assimp was missing.

There is already an assimp dependency in package/qt5/qt53d/qt53d.mk (see [1]):

14:  ifeq ($(BR2_PACKAGE_ASSIMP),y)
15:  QT53D_DEPENDENCIES += assimp
16:  endif

Regards,
Peter

[1] https://gitlab.com/buildroot.org/buildroot/-/blame/master/package/qt5/qt53d/qt53d.mk?ref_type=heads#L14


>
> Use git instead of downloading the tar-ball so that
> we also fetch the associated assimp src submodule.
>
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> ---
>  package/qt5/qt53d/qt53d.hash | 2 +-
>  package/qt5/qt53d/qt53d.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
> index 0f63aab72a..81de91558e 100644
> --- a/package/qt5/qt53d/qt53d.hash
> +++ b/package/qt5/qt53d/qt53d.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4adc7fd7173  qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2
> +sha256  bab48eab35184144fc8789d2958a983a60bfc8dfa242cb65966a3d129fddaea7  qt53d-e1b1a0d2970fd384bd52c734a72536d8452ad070-br1.tar.gz
>
>  # Hashes for license files:
>  sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index 4b748a4972..8fcfb72fec 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>
> -QT53D_VERSION = 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016
> -QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
> -QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
> +QT53D_VERSION = e1b1a0d2970fd384bd52c734a72536d8452ad070
> +QT53D_SITE = $(QT5_SITE)/qt3d
> +QT53D_SITE_METHOD = git
> +QT53D_GIT_SUBMODULES = YES
>  QT53D_DEPENDENCIES = qt5declarative
>  QT53D_INSTALL_STAGING = YES
>  QT53D_SYNC_QT_HEADERS = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
