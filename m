Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E92C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 14:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B1D81288;
	Tue, 14 Feb 2023 14:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58B1D81288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkGUC4nfEF2V; Tue, 14 Feb 2023 14:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD13981E7C;
	Tue, 14 Feb 2023 14:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD13981E7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D414B1BF40E
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AED4760C22
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED4760C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZFutkaelUhl for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 14:02:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B49CA61133
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B49CA61133
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 14:02:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4E432000A;
 Tue, 14 Feb 2023 14:02:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pRvso-003KN1-Ou; Tue, 14 Feb 2023 15:02:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230117200821.2882597-1-bernd.kuhls@t-online.de>
 <20230117200821.2882597-3-bernd.kuhls@t-online.de>
Date: Tue, 14 Feb 2023 15:02:10 +0100
In-Reply-To: <20230117200821.2882597-3-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 17 Jan 2023 21:08:21 +0100")
Message-ID: <87r0us8hwd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/kodi: fix riscv build
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

 > Fixes build error not yet found by autobuilders
 > -- System type: Linux
 > CMake Error at cmake/scripts/linux/ArchSetup.cmake:42 (message):
 >   Unknown CPU: riscv32

 > using this defconfig:

 > BR2_riscv=y
 > BR2_RISCV_32=y
 > BR2_TOOLCHAIN_EXTERNAL=y
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
