Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82F2C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 22:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 520E1402F4;
	Wed, 28 Dec 2022 22:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 520E1402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MRH8S52fM7W; Wed, 28 Dec 2022 22:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74AB240220;
	Wed, 28 Dec 2022 22:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74AB240220
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1931BF5F5
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43D3A40220
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43D3A40220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TYb2SxM7nD0 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 22:23:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D9B40179
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09D9B40179
 for <buildroot@uclibc.org>; Wed, 28 Dec 2022 22:23:13 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pAepM-0003KQ-0V
 for buildroot@uclibc.org; Wed, 28 Dec 2022 23:23:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 28 Dec 2022 23:22:34 +0100
Message-ID: <pan$cd265$a6191214$644fb1ff$63f4a61e@ID-313208.user.individual.net>
References: <20221226180353.1897840-1-bernd.kuhls@t-online.de>
 <20221227224354.3b1d1fdf__40547.9438648158$1672177457$gmane$org@windsurf>
 <pan$60b46$ce6281f3$ccde7c98$d5e8f550@ID-313208.user.individual.net>
 <20221228110017.1d376f11@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/dvb-firmware: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Wed, 28 Dec 2022 11:00:17 +0100 schrieb Thomas Petazzoni via buildroot:

> This would certainly be OK, *but* you would need to first clarify under
> what license these particular firmware files are released.

after several hours of research I am abandoning this patch because I was 
unable to find any license infos for these files...

Although I found alternative sources besides the LibreELEC repo

- dvb-demod-m88rs6000.fw
http://www.dvbsky.net/download/linux/dvbsky-firmware.tar.gz
http://palosaari.fi/linux/v4l-dvb/firmware/M88RS6000/4.1/

- dvb-demod-si2168-d60-01.fw
https://launchpad.net/~b-rad/+archive/ubuntu/kernel+mediatree+hauppauge/
+sourcefiles/linux-firmware-hauppauge/0.1.8+xenial/linux-firmware-
hauppauge_0.1.8+xenial.tar.gz

- v4l-cx23885-avcore-01.fw
https://linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2

- all of the three mentioned above
https://github.com/tbsdtv/media_build/releases/download/latest/dvb-
firmwares.tar.bz2

for the firmware needed here there is no license information available 
anywhere.

> Even though I'm not sure it's totally useful, I've noticed that the
> kernel ships with a scripts/get_dvb_firmware script that allows to
> download some DVB firmware from various locations. One of the locations
> is https://linuxtv.org/downloads/firmware/. But it hasn't been updated
> since 2014, and seems to have less firmware that the LibrELEC repo.

Thanks for investigating but you are right, that source is outdated.

> For me, the LibreELEC repo is fine, as long as there is licensing
> information for the different firmware files.

I can fully understand the need for license files but they seem out of 
reach.

The closest "license" text I could find was for the "linux-firmware-
hauppauge" launchpad.net repo mentioned by Hauppauge:
https://hauppauge.com/pages/support/support_linux.html
https://launchpad.net/~b-rad/+archive/ubuntu/kernel+mediatree+hauppauge/
+sourcepub/12873406/+listing-archive-extra

which includes this in debian/changelog:

"- Hauppauge Computer Works has redistribution rights for these firmwares"

But this repo only includes one of the three files needed.

On another support page Hauppauge ( http://www.hauppauge.de/site/support/
support_linux.html?n=FAQ.Linux#tv_tuner ) is linking firmware files to 
the OpenELEC repo: https://github.com/OpenELEC/dvb-firmware/, also no 
license infos available...

> Or we need to invent a special license mechanism in Buildroot that
> clarifies that the build results cannot be redistributed (which would of
> course be confusing with _REDISTRIBUTE = YES/NO, which means a different
> thing).

What about 

BR2_PACKAGE_DVB_FIRMWARE_INSTALL_TARGET = NO

to force users to pick the files needed by BR2_ROOTFS_POST_BUILD_SCRIPT?

Privately I added the files to a rootfs overlay now, closing this topic...

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
