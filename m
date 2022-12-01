Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB52C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 20:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C9DA41802;
	Thu,  1 Dec 2022 20:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9DA41802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhvOp92UVzar; Thu,  1 Dec 2022 20:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75FCB417D4;
	Thu,  1 Dec 2022 20:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75FCB417D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0DF51BF83C
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC79E60B58
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC79E60B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxQIo424jztT for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 20:50:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87A0A60B1F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87A0A60B1F
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 20:50:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE5D3100006;
 Thu,  1 Dec 2022 20:50:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p0qVZ-006v37-Sp; Thu, 01 Dec 2022 21:50:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20221002144629.2105385-1-bernd.kuhls@t-online.de>
 <20221002144629.2105385-2-bernd.kuhls@t-online.de>
Date: Thu, 01 Dec 2022 21:50:13 +0100
In-Reply-To: <20221002144629.2105385-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 2 Oct 2022 16:46:29 +0200")
Message-ID: <87r0xic0hm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/kodi: fix build with fmt >= 9.x
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

 > For details see https://github.com/xbmc/xbmc/pull/21674
 > Build-tested using this previously broken defconfig:

 > BR2_x86_64=y
 > BR2_TOOLCHAIN_BUILDROOT_CXX=y
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 > BR2_PACKAGE_KODI=y
 > BR2_PACKAGE_MESA3D=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
 > BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 > BR2_PACKAGE_MESA3D_OPENGL_ES=y
 > BR2_PACKAGE_PYTHON3=y
 > BR2_PACKAGE_PYTHON3_PY_ONLY=y

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
