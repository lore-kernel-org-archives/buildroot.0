Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADC4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 09:22:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DBDE60E96
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 09:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DBDE60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F8E83B52;
	Thu, 21 Oct 2021 09:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxflpg2VbGm1; Thu, 21 Oct 2021 09:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 142A083B14;
	Thu, 21 Oct 2021 09:22:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 620B21BF909
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 09:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50A13402A2
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 09:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_mrfqe3Rwrt for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 09:22:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8B4E40255
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 09:22:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 188D42BA;
 Thu, 21 Oct 2021 11:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634808163;
 bh=FIWyyBueZrNQf8kCh7e6zMro0+V7W8DPzKidGsqtg2I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=KdiymBlvaMwUp/t5T6QE1AyY6fmtJasufP2xLbqArk86DwyrQJk2Ly5CghFtPGkxv
 DoorG1FjbGB3CwhuJcm9X9jOsFEZDaPuPyUf34lXS2iBeEB+D7MsIdbQErjSJ8yA25
 dNvJ4/PYdnWAN736AyW1IIVAJvj0x5/OMqv1VvPQ=
MIME-Version: 1.0
In-Reply-To: <20211020190423.3547893-1-fontaine.fabrice@gmail.com>
References: <20211020190423.3547893-1-fontaine.fabrice@gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Date: Thu, 21 Oct 2021 10:22:40 +0100
Message-ID: <163480816021.2663858.13418966210945898355@Monstersaurus>
User-Agent: alot/0.9.1
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: disable compliance
 tool
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

Quoting Fabrice Fontaine (2021-10-20 20:04:23)
> Disable compliance tool to fix the following build failure
> raised since commit e1d37ab0a7b2b8735e69c070519978d2898d2e79 and
> https://git.linuxtv.org/libcamera.git/commit/?id=02bc1108578e8b8eb68fa7d9ae3eeea558723931:
> 
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lgtest
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e1bb8aa1de310f3d27b74ec7d8748d170ad444e2
> 

Any idea why we're failing to find gtest?

Our meson.build for src/lc-compliance contains the following:

"""
# SPDX-License-Identifier: CC0-1.0

libevent = dependency('libevent_pthreads', required : get_option('lc-compliance'))
libgtest = dependency('gtest', required : get_option('lc-compliance'))

if not (libevent.found() and libgtest.found())
    lc_compliance_enabled = false
    subdir_done()
endif

lc_compliance_enabled = true
"""

Which implies that libgtest was found during the configuration phase,
but not during the linking phase....

Is libgtest built as part of this build configuration? If it is - I'd
expect lc-compliance to get built against it. If not - then it would
automatically be disabled by our build...


> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcamera/libcamera.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 8ab95fb42a..638c9ac553 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -17,6 +17,7 @@ LIBCAMERA_DEPENDENCIES = \
>  LIBCAMERA_CONF_OPTS = \
>         -Dandroid=disabled \
>         -Ddocumentation=disabled \
> +       -Dlc-compliance=disabled \
>         -Dtest=false \
>         -Dwerror=false
>  LIBCAMERA_INSTALL_STAGING = YES
> -- 
> 2.33.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
