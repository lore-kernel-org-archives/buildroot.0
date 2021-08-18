Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAA3C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 16:11:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC89610A6
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 16:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAC89610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E47B404BA;
	Wed, 18 Aug 2021 16:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYGebJlC6MBv; Wed, 18 Aug 2021 16:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F749405F7;
	Wed, 18 Aug 2021 16:11:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B23611BF836
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 16:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A26C280D88
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 16:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id th3R2SOp7TY3 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 16:11:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40F2580D78
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629303087;
 bh=7QPInlwyRbEzN1InX29RxYa/jbkhsGLNMaoNR4GoBLs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hGv0AqD5lgvOhzJKIYeZ7EBQHfdTMxtKDJ17bn6T8Z2W3fYugEVbQfA/27reyYlXb
 yXcgFwmbNAABOk7dV465F++iF0m+TuSMaULrkZIWUN3x6D/v3EX5Lchh0npizQlvUa
 /Uzk6zZWpETZlM+GD6Ccky8cMmsJYVs5BdLI5i3U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.105]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1mCWY12MaI-0054dM; Wed, 18
 Aug 2021 18:11:27 +0200
Date: Wed, 18 Aug 2021 18:11:26 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Scott Bartolett <SBartolett@thorlabs.com>
Message-ID: <20210818181126.38fe82d9@gmx.net>
In-Reply-To: <SJ0PR08MB6542F7DD403856DB9A0CDA0CB8FF9@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210817201014.235cf403@gmx.net>
 <SJ0PR08MB6542F7DD403856DB9A0CDA0CB8FF9@SJ0PR08MB6542.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:07oIUGyMhBheTUjAHy0/hONliubS2d9FIz9X6AzS5I0apriYF5w
 lU70Y6IwsnBXVK+W4M0YlgqChTmwhwaiIVdIQ8CsebDh1hRALYaxESpId8SDOmHRQv7Zg8g
 MXGbsdMiJs87/OAy177H2MurDaFdOu8O5SrjuL2hH0KSjhA5WGJKZ2bZxLgy2/FZ7VIX10y
 cIw7tJvJSrlnrIrfSCcbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hk/j2Ug2xvQ=:Su48MUyA0PrGbrkN56Xl1a
 uKGmpciFVD9oZbMIeDSaIg+iD/Q4TSb/wXu3Trk+CAw9cQeCIRtSgVsNLDsbZBqbhWx3emglR
 IpgFAgCQUZtFdwjEpH/MSpcGsk6WqR5XN5d2jc1XMzaXtBEcnQ4F+nLwFUFCY2j/NkcFQd95v
 UYhS7p1eYnSgJkDMr1pX+dfzIwzmxFiGZNR6mPY4YwrHsPVSmMfMpscKJzUIS6Iqv9SeRXQKi
 Ul/UhqjKNXdSCZy7/LGDdFvsOog3WeAEne4FsoWtUV38t9+hf10FxQXXu3Xe6xwv5QM3M1W8V
 YtW+YcvnOaTmMhxfYa7/2o65RDiHjvP+aebkf1MGFQGFnZZbcDLJaJn5P7WQpEmFbDFD5tFZJ
 4PpR6si9XZ3vfhinsyye2iRRuDir1rXO6MUj0JTHcJfueUwH94r3o/PndTdcIzsvQoX6utPpv
 IAIwG6rlkFlCHcwhKoRdHYgkZbaX1VaaLY1H1jUpTUNR1cjCzz2uVwFIeCgAQiFGq2wTw4tWk
 AiOfvKzPoZ8U8wiS6ccmObjCYgGZBRf0rxjC1q4B5OWp+fJwdudSNCLKDPcLjIfMdXYRyz9H1
 iHuObPIkp0efaBxzK5hmmG0efPdLVfbWATbl0Z2gdJq11w4p8xLXaHEvOYX0IS/jdncT7KTkm
 N7tpm95yqL07L08FosmV6kpGAYiqg1hZIB8BZ56iBVUQ9qE3H42Xu59yWO0ZmcRKijIKL35TH
 loWQyy9SQp3PzYydZ33U128zavaWuR4B8fQLYuQUtLzYKcXyRRQqQVka6PqWbGRF5NvdGZNtN
 9EmUFfyYD2FUYS6a4O879XjIPDZ8crOBdpEaljez/FDLDWYzC1h+S0QAHFNB+bTqO8N7ahWBB
 8lTkyi+Lo8wBtVK6yjL/BB45nMQk5rv3keNXIlmuvoNwBlx42lHKw5XG2gmDbsRRmdhS7PC5F
 yLEuWfKABEwOKWg83oQVVRVVzKeBG8nhYQ2d23Q1dhl1RBI8E+UbxHLJC+rN+W6N/otTO5MBe
 2d920wyhbC+D6HHIjopb24l2R4ihib6C+6FE88lgVtXGAUXzgy1NAPc0JYzaUOzQ0uHOa9913
 JjXagNWxXA+tMccVPr5xizu9VL9UAQRWFBiiBD2ijE9iJonyec5GHJwaEDiY34xeu7h8lChtv
 aK/UdemiLSEnvZxJSH+DtErPgGCXyBFgrSOwzAmNoyxNAo3g==
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
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Scott,

On Wed, 18 Aug 2021 13:08:28 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Hi Peter,
>
> On a raspbian install I find the file vc4-kms-v3d.dtbo.  However on the buildroot install, I do not find any files that match vc4-kms-v3d*.   I've searched for and enabled additional items in the buildroot config that might be related, but nothing has helped yet.

The buildroot config option is name BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS,
do not forget to do a full re-build of the rpi-firmware package after enabling...

For inclusion of the overlay files to the target/SD-card boot/first partition
check/add the 'rpi-firmware/overlays' entry in the genimage file (see e.g.
board/raspberrypi3/genimage-raspberrypi3.cfg for an example)...

Regards,
Peter

>
> Thanks,
> Scott
>
>
> -----Original Message-----
> From: Peter Seiderer [mailto:ps.report@gmx.net]
> Sent: Tuesday, August 17, 2021 2:10 PM
> To: Scott Bartolett <SBartolett@thorlabs.com>
> Cc: buildroot@busybox.net
> Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
>
> Hello Scott,
>
> On Tue, 17 Aug 2021 17:47:49 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:
>
> > Hi all,
> >
> > I'm trying to run a Qt5 application on a Raspberry Pi running buildroot.  The application runs fine when I use the platform plugin linuxfb.  But when I try to use eglfs I'm getting the error that the DRM Device is not found.  I see this error message mentioned often when doing a search, but so far have not found any solution that works for me.  I've selected:
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> > BR2_PACKAGE_MESA3D_OPENGL_ES
> > BR2_PACKAGE_QT5BASE_OPENGL_ES2
> > BR2_PACKAGE_QT5BASE_EGLFS
> >
> > Does anyone have any suggestions?
>
> Edit the config.txt file on the first/boot partition on the SD card and add (for RPi4):
>
> 	dtoverlay=vc4-kms-v3d-pi4
>
> or (for Rpi3,...):
>
> 	dtoverlay=vc4-kms-v3d
>
> See [1] for details...
>
> Regards,
> Peter
>
> [1] https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fraspberrypi%2Ffirmware%2Fblob%2Fmaster%2Fboot%2Foverlays%2FREADME&amp;data=04%7C01%7CSBartolett%40thorlabs.com%7C919da371d81c4cb2c6b308d961aa4771%7C411510044224448aa787d4279c1f087d%7C0%7C0%7C637648206254285944%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QZiffVLIgJEx40pM6%2BtT7y9teGDYDYaqrl8T%2Fz861rM%3D&amp;reserved=0
>
> >
> > Thanks,
> > Scott
> >
>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
