Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C12C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 18:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D5F6109F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 18:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8D5F6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEF34613C0;
	Thu, 19 Aug 2021 18:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGCdXV1lOdhs; Thu, 19 Aug 2021 18:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F5F613CE;
	Thu, 19 Aug 2021 18:17:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCB851BF402
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 18:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93DD81985
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 18:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcjqKB3_-a9b for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 18:17:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08AD981975
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629397055;
 bh=lrTYVXJaDdxyzUPDoWvGXL1cpL0LtPivs+1hoD8vzvY=;
 h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
 b=EbkxyN8wI9B4Hi0gkA9BaG/71lx7YFChcBX8hY6hKw1iRlhnS6CrKweo3V+qJATS6
 9u3lrj+hPcXS1LkJsmvjmWcBwHwB0EHaz+IDJY+NRD2jYvZZL1NpGhLZWhLHpVwCyd
 xPXSFitAVo8aw3shf3eep3iYrMzQVu9g+hw3Ye9k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.105]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsJ5-1n690K30r9-00stbM; Thu, 19
 Aug 2021 20:17:35 +0200
Date: Thu, 19 Aug 2021 20:17:34 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Scott Bartolett <SBartolett@thorlabs.com>
Message-ID: <20210819201734.37d522bb@gmx.net>
In-Reply-To: <SJ0PR08MB6542F6819B55EBB098177E0FB8C09@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210817201014.235cf403@gmx.net>
 <SJ0PR08MB6542F7DD403856DB9A0CDA0CB8FF9@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210818181126.38fe82d9@gmx.net>
 <SJ0PR08MB6542F033192E0D422DEE4FDDB8FF9@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210818231110.390d9064@gmx.net>
 <SJ0PR08MB6542F6819B55EBB098177E0FB8C09@SJ0PR08MB6542.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:s4lEMCp3PqloyeSddz6L2QJV1s/ezdS/EPsGz9B8cMULgcT7vag
 v/jBW/kIos4F+PbFKBF5YqcedGW/4Q9Z7YlogPtmz+/Qx2wC1F2UgpNM8Q/2A2TXQPpOAZ4
 ygCtShxJK3aKoaGUhbCDqucf5wWDrURSHNV9ih6FHRR+X2Kx2V3YD0+N7AvZiOM+GgbyhUJ
 ZvB5/AnwuSK3q0WPQ0W+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AbbMZJ7vFAY=:6JkTVKooRPZmjETU1F90t/
 adbPtYLVL1OQl/z6h8WdBuZOJdTD/mw3YNeSwCZnFO4C5+KVu0w+Esmt40xCqU+WVTJO3eijK
 y6EdnYGt9X7ViboaDWyUbKR8jv5KQ8CZjRVxwkTb66z14M5hqJNi0HP6y/UiK9BpPPrl+Qnrs
 f4O9leYEU5lhmJ20Ij8kLDXEwaFYLjaAab/6+zincAfh0F0KDugAhjQXm+W9qBDNiaYxoNlrJ
 lNmq38KmwTsQoVpCVRg4sswcvzcXXPCm5aE9y7WuzF/hrSa7tbpC6obe3TfOmiSYU4DxS9tfe
 8fyqLbm1AFHFVUXymvcx4oyir7kbPMVeaLMBNz1MubfSrOwvCMbdWnGkef2zL3HUcSx/1LAv+
 hvQBfOHoGORxzL5qDDJLGwZyjlpgyu/beStWal/DO+h0qZpWD8wK+sFNGxUbl9I/pE2M7pB9i
 1Cr0lHFsFsObbeO0ab9dw1O2xNXEGM03ntvNyoL1xBnrWSYEZ2Cnt+7wbadGmsJbGCmBPibic
 HHXTxAWK6uS/V5/qAt7sbyo4a19kvFFbnuzIyLqyeu5gSbJ1ojbnLDyhNOVoMTQsvARfcujIQ
 5QfSy2HHqU2E1o6XmF7ovJrcNHuUrE+xtXrKNSoKo0ImPslqDDUFz7G05lqIB769tnpSTVURJ
 bsaVitC8RzUgIJVMw1szQj6veQ5fIKMq9D/Mgvf7Bi1vrxsXmkr4n8D1Bt6S+b5LECgCwj2ao
 KxVROmK6R4I8ibrorcPZoH494HLm1giwzg0cbcnk72sbT6ubQaGER1tLpvliShk81k8Op9FAJ
 JfzIOV/ivki8oZKszXV5UhMaDHnAohJB+oJDaeSs1jb5l9Qy+4f8/ENjIQ58PbaE4zp66ZZc3
 QfJesraZq97ZWDcqDQI4scPPsI5e96ltrkYu7vcJcS7csDgc2q3eAMzgSyxyiuCsfSkJ4oS+r
 De69O1bg+SpfrRCfeYlR2JaRjpAMfQ9txiOrKzkpTu9euOR918LoDZNsiFpt0iN/osREwlQ9I
 ZDjceUo2FkVB0vi3jbfCa4q/kMPTN+auE8DQSBjoLlHw+0HlZUjpSrtUA3xgaT0kKq0Z+qOAp
 tGCNtgqkFsRNTEITYhjhG2w0LNlWbBolsyqJjNb69rexQ4cGJGAyv/jUQ==
Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Scott,

On Thu, 19 Aug 2021 17:32:33 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Of course.  I should have realized that.
>
> Hope this doesn't turn out to be a stupid question also, but I just tried to run dtoverlay from the command prompt and it says command not found.  Searched for it on the target machine and did not find it.  Searched for it in the buildroot output folder and found this:
> ./output/build/rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35/hardfp/opt/vc/bin/dtoverlay
> ./output/build/rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35/opt/vc/bin/dtoverlay

Do not know about a dtoverlay command, the dtoverlay I know is a RPi bootloader
feature controlled by the config.txt file on the first/boot partition of
the SD card, once again:

> > > Edit the config.txt file on the first/boot partition on the SD card and add (for RPi4):
> > >
> > > 	dtoverlay=vc4-kms-v3d-pi4
> > >
> > > or (for Rpi3,...):
> > >
> > > 	dtoverlay=vc4-kms-v3d

Regards,
Peter


>
> I just tried the same using the default raspberrypi3_defconfig and get the same result.  Any idea why this would be the case?  I am assuming now that without dtoverlay, vc4-kms-v3d.dtbo is not loading and that is the cause of the DRM Device not found.
>
> We are trying to support a feature that requires rotating our GUI.  This is why we are trying to use the plugin eglfs which supports the rotate=X option.  LinuxFB does not appear to support this.  If I cannot get this to work today, we are going to abandon this feature for now.
>
>
> -----Original Message-----
> From: Peter Seiderer [mailto:ps.report@gmx.net]
> Sent: Wednesday, August 18, 2021 5:11 PM
> To: Scott Bartolett <SBartolett@thorlabs.com>
> Cc: buildroot@busybox.net
> Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
>
> Hello Scott,
>
> On Wed, 18 Aug 2021 20:28:12 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:
>
> > Yes I have the BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS enabled and rpi-firmware/overlays entry in genimage.  If I search the buildroot output folder I find this:
> >
> > ./output/images/rpi-firmware/overlays/vc4-kms-v3d.dtbo
> > ./output/images/rpi-firmware/overlays/vc4-kms-v3d-pi4.dtbo
> > ./output/build/rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35/b
> > oot/overlays/vc4-kms-v3d.dtbo
> > ./output/build/rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35/b
> > oot/overlays/vc4-kms-v3d-pi4.dtbo
> >
> > But I do not find those files anywhere on the target machine.  I am using a root file system overlay.  Might that be my problem?
>
> The overlays are stored in the first/boot partition (vfat one where the dtb files, config.txt and cmdline.txt, bootcode.bin and start.elf and fixup.dat and zimage are found) and not on the second/root (ext4 one with the complte root file system) partition of the SD card...
>
> Regards,
> Peter
>
> >
> > I appreciate your help with this.
> >
> > Scott
> >
> >
> > -----Original Message-----
> > From: Peter Seiderer [mailto:ps.report@gmx.net]
> > Sent: Wednesday, August 18, 2021 12:11 PM
> > To: Scott Bartolett <SBartolett@thorlabs.com>
> > Cc: buildroot@busybox.net
> > Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
> >
> > Hello Scott,
> >
> > On Wed, 18 Aug 2021 13:08:28 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:
> >
> > > Hi Peter,
> > >
> > > On a raspbian install I find the file vc4-kms-v3d.dtbo.  However on the buildroot install, I do not find any files that match vc4-kms-v3d*.   I've searched for and enabled additional items in the buildroot config that might be related, but nothing has helped yet.
> >
> > The buildroot config option is name
> > BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS,
> > do not forget to do a full re-build of the rpi-firmware package after enabling...
> >
> > For inclusion of the overlay files to the target/SD-card boot/first partition check/add the 'rpi-firmware/overlays' entry in the genimage file (see e.g.
> > board/raspberrypi3/genimage-raspberrypi3.cfg for an example)...
> >
> > Regards,
> > Peter
> >
> > >
> > > Thanks,
> > > Scott
> > >
> > >
> > > -----Original Message-----
> > > From: Peter Seiderer [mailto:ps.report@gmx.net]
> > > Sent: Tuesday, August 17, 2021 2:10 PM
> > > To: Scott Bartolett <SBartolett@thorlabs.com>
> > > Cc: buildroot@busybox.net
> > > Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
> > >
> > > Hello Scott,
> > >
> > > On Tue, 17 Aug 2021 17:47:49 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:
> > >
> > > > Hi all,
> > > >
> > > > I'm trying to run a Qt5 application on a Raspberry Pi running buildroot.  The application runs fine when I use the platform plugin linuxfb.  But when I try to use eglfs I'm getting the error that the DRM Device is not found.  I see this error message mentioned often when doing a search, but so far have not found any solution that works for me.  I've selected:
> > > > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> > > > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> > > > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> > > > BR2_PACKAGE_MESA3D_OPENGL_ES
> > > > BR2_PACKAGE_QT5BASE_OPENGL_ES2
> > > > BR2_PACKAGE_QT5BASE_EGLFS
> > > >
> > > > Does anyone have any suggestions?
> > >
> > > Edit the config.txt file on the first/boot partition on the SD card and add (for RPi4):
> > >
> > > 	dtoverlay=vc4-kms-v3d-pi4
> > >
> > > or (for Rpi3,...):
> > >
> > > 	dtoverlay=vc4-kms-v3d
> > >
> > > See [1] for details...
> > >
> > > Regards,
> > > Peter
> > >
> > > [1]
> > > https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgi
> > > th
> > > ub.com%2Fraspberrypi%2Ffirmware%2Fblob%2Fmaster%2Fboot%2Foverlays%2F
> > > RE
> > > ADME&amp;data=04%7C01%7CSBartolett%40thorlabs.com%7C2be70acef94f4fd7
> > > a6
> > > 6e08d96262d8bf%7C411510044224448aa787d4279c1f087d%7C0%7C0%7C63764899
> > > 89
> > > 66807962%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
> > > iL
> > > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TRayRYYU6JoOopJfA9zsp
> > > OI
> > > n%2FGObRgfP2zYF2bS%2BCEA%3D&amp;reserved=0
> > >
> > > >
> > > > Thanks,
> > > > Scott
> > > >
> > >
> >
>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
