Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5683FC64ED6
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 14:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A88E581334;
	Tue, 14 Feb 2023 14:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A88E581334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1i26-ehC5yKD; Tue, 14 Feb 2023 14:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD0681288;
	Tue, 14 Feb 2023 14:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD0681288
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6E031BF40E
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE70D40B5A
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE70D40B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJbx3AZwy7BA for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 14:01:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D26E40116
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D26E40116
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 14:01:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 18F94E0014;
 Tue, 14 Feb 2023 14:01:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pRvsZ-003KMb-1c; Tue, 14 Feb 2023 15:01:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230117200821.2882597-1-bernd.kuhls@t-online.de>
Date: Tue, 14 Feb 2023 15:01:55 +0100
In-Reply-To: <20230117200821.2882597-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 17 Jan 2023 21:08:19 +0100")
Message-ID: <87zg9g8hws.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi: fix armv5 build
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Disable neon support when not available.
 > Fixes build error not yet found by autobuilders

 > /tmp/cc8LvPwi.s: Assembler messages:
 > /tmp/cc8LvPwi.s:28: Error: selected processor does not support `vldmia r1,{ q4-q7 }' in ARM mode
 > /tmp/cc8LvPwi.s:29: Error: selected processor does not support `vldmia r0,{ q8-q11 }' in ARM mode
 > /tmp/cc8LvPwi.s:30: Error: selected processor does not support `vmul.f32 q0,q8,d8[0]' in ARM mode
 > /tmp/cc8LvPwi.s:31: Error: selected processor does not support `vmul.f32 q1,q8,d10[0]' in ARM mode
 > /tmp/cc8LvPwi.s:32: Error: selected processor does not support `vmul.f32 q2,q8,d12[0]' in ARM mode
 > /tmp/cc8LvPwi.s:33: Error: selected processor does not support `vmul.f32 q3,q8,d14[0]' in ARM mode
 > /tmp/cc8LvPwi.s:34: Error: selected processor does not support `vmla.f32 q0,q9,d8[1]' in ARM mode
 > /tmp/cc8LvPwi.s:35: Error: selected processor does not support `vmla.f32 q1,q9,d10[1]' in ARM mode
 > /tmp/cc8LvPwi.s:36: Error: selected processor does not support `vmla.f32 q2,q9,d12[1]' in ARM mode
 > /tmp/cc8LvPwi.s:37: Error: selected processor does not support `vmla.f32 q3,q9,d14[1]' in ARM mode
 > /tmp/cc8LvPwi.s:38: Error: selected processor does not support `vmla.f32 q0,q10,d9[0]' in ARM mode
 > /tmp/cc8LvPwi.s:39: Error: selected processor does not support `vmla.f32 q1,q10,d11[0]' in ARM mode
 > /tmp/cc8LvPwi.s:40: Error: selected processor does not support `vmla.f32 q2,q10,d13[0]' in ARM mode
 > /tmp/cc8LvPwi.s:41: Error: selected processor does not support `vmla.f32 q3,q10,d15[0]' in ARM mode
 > /tmp/cc8LvPwi.s:42: Error: selected processor does not support `vmla.f32 q0,q11,d9[1]' in ARM mode
 > /tmp/cc8LvPwi.s:43: Error: selected processor does not support `vmla.f32 q1,q11,d11[1]' in ARM mode
 > /tmp/cc8LvPwi.s:44: Error: selected processor does not support `vmla.f32 q2,q11,d13[1]' in ARM mode
 > /tmp/cc8LvPwi.s:45: Error: selected processor does not support `vmla.f32 q3,q11,d15[1]' in ARM mode
 > /tmp/cc8LvPwi.s:46: Error: selected processor does not support `vstmia r0,{ q0-q3 }' in ARM mode

 > with this defconfig:

 > BR2_arm=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 > BR2_PACKAGE_KODI=y
 > BR2_PACKAGE_MESA3D=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 > BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 > BR2_PACKAGE_MESA3D_OPENGL_ES=y
 > BR2_PACKAGE_PYTHON3=y
 > BR2_PACKAGE_PYTHON3_PY_ONLY=y

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
