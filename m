Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20583C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 20:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E07EC81E7C;
	Thu, 21 Mar 2024 20:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVCFaP-mEr69; Thu, 21 Mar 2024 20:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEA2382231
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA2382231;
	Thu, 21 Mar 2024 20:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7971BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58E4882231
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hh7JwVjLodoe for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 20:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26BA181E7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26BA181E7C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26BA181E7C
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 20:50:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC42DE0007;
 Thu, 21 Mar 2024 20:49:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnPMN-005bHZ-0Y;
 Thu, 21 Mar 2024 21:49:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240314211557.20391-1-bernd@kuhls.net>
 <af2a398a-8147-4a86-8df0-b74b58114325@mind.be>
Date: Thu, 21 Mar 2024 21:49:59 +0100
In-Reply-To: <af2a398a-8147-4a86-8df0-b74b58114325@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Fri, 15 Mar 2024 20:30:54
 +0100")
Message-ID: <87il1f48eg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mesa3d: rework dri3 handling
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Bernd Kuhls <bernd@kuhls.net>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 14/03/2024 22:15, Bernd Kuhls wrote:
 >> From: Bernd Kuhls <bernd.kuhls@t-online.de>

 >  Could you make sure that your From is set the same as your SoB?

 >> While fixing a build error
 >> ../src/egl/drivers/dri2/platform_x11.c: In function
 >> 'dri2_x11_get_msc_rate':
 >> ../src/egl/drivers/dri2/platform_x11.c:1229:44:
 >> error: 'struct dri2_egl_display' has no member named 'screen_resources'
 >> with this defconfig:
 >> BR2_x86_64=y
 >> BR2_TOOLCHAIN_BUILDROOT_CXX=y
 >> BR2_PACKAGE_MESA3D=y
 >> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
 >> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
 >> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 >> BR2_PACKAGE_MESA3D_OPENGL_ES=y
 >> BR2_PACKAGE_XORG7=y
 >> (crocus and i915 drivers are also affected) it turns out that we can
 >> assume the need for dri3 support when X.org is enabled as a hard depen-
 >> dency even if mesa3d's configure does not throw errors when missing,
 >> like for the Intel drivers.
 >> Before this patch these Config.in options were used:
 >> config BR2_PACKAGE_MESA3D_DRI3
 >> select BR2_PACKAGE_XLIB_LIBXSHMFENCE
 >> select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7

 >  THere was another select like that in
 >  BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM. I removed that one as
 >  well, and applied to master, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
