Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA8BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:53:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203DF60F48
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 203DF60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E00EC40764;
	Fri, 15 Oct 2021 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzZ_QzL19z_j; Fri, 15 Oct 2021 19:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03224078F;
	Fri, 15 Oct 2021 19:53:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0580E1BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E85454025C
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIEtuQh8bpl9 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:53:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5965D4011F
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:53:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86F062E3;
 Fri, 15 Oct 2021 21:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634327581;
 bh=+uyl9xbIM1FMZolNyYUo5GA5CmpKhGztoh+MRWiABaA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lUVj0X4JMetbcM+nQbSgI4To1o+5cO2UEHrFH/xIyoMgO1HEHrD+EheTwINRyGbNO
 aKsHzSk40Wu1z/tp8gitxYYSyQ3z2a9JzJKpHv72+7OK2P4nBWDoHt5Z/c0J0/sqo8
 ELWcHxVG7a6px4Sqma7u8x5isk0RLHsvJJT3yt0o=
MIME-Version: 1.0
In-Reply-To: <20211015183113.1149243-1-fontaine.fabrice@gmail.com>
References: <20211015183113.1149243-1-fontaine.fabrice@gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Date: Fri, 15 Oct 2021 20:52:59 +0100
Message-ID: <163432757903.316423.10402680805521169861@Monstersaurus>
User-Agent: alot/0.9.1
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: raspberrypi depends
 on arm or aarch64
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

Quoting Fabrice Fontaine (2021-10-15 19:31:13)
> Add a dependency on arm or aarch64 for
> BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI to avoid the following build
> failure with one powerpc64 toolchain since commit
> c09f126f570355b8ec134724b453300a4811339c
> as suggested by upstream in
> https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/025796.html:
> 
> In file included from ../include/libcamera/base/log.h:10,
>                  from ../src/ipa/raspberrypi/raspberrypi.cpp:18:
> ../src/ipa/raspberrypi/raspberrypi.cpp:64:53:   in 'constexpr' expansion of 'std::chrono::operator/<long double, std::ratio<1>, double>(std::literals::chrono_literals::operator""s(1.0e+0l), 3.0e+1)'
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/powerpc64-buildroot-linux-gnu/include/c++/9.3.0/chrono:502:32: error: '(1.0e+0l / 3.0e+1)' is not a constant expression
>   502 |  return __cd(__cd(__d).count() / __s);
> ../src/ipa/raspberrypi/raspberrypi.cpp:73:56:   in 'constexpr' expansion of 'std::chrono::operator/<long double, std::ratio<1>, double>(std::literals::chrono_literals::operator""s(1.0e+0l), 6.0e+1)'
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/powerpc64-buildroot-linux-gnu/include/c++/9.3.0/chrono:502:32: error: '(1.0e+0l / 6.0e+1)' is not a constant expression
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/49caebe7ef7e3d63de49e78d5d6839dd0aedf10c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcamera/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 92c17df849..c510e34924 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -40,6 +40,7 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
>  
>  config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
>         bool "raspberrypi pipeline"
> +       depends on BR2_arm || BR2_aarch64

Yes, I think filtering the pipeline handlers is reasonable in this way.

I'd go further and filter the IPU3 on only x86 for instance, and the
RKISP on (arm||aarch64).

But that could be separate patches too.


>         depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
>         select BR2_PACKAGE_BOOST
>         select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> -- 
> 2.33.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
