Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15824C4320A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 18:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC07A6102A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 18:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC07A6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776EF40279;
	Tue, 17 Aug 2021 18:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7YP6XWbOmYO; Tue, 17 Aug 2021 18:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC0F340289;
	Tue, 17 Aug 2021 18:10:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2F31BF955
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 18:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 891A680D5B
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 18:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZJHPrEieh0Z for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 18:10:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C62180D5A
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 18:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629223816;
 bh=nd4mfNmlyFRXYcTuM0eynhfYR9uWYIAke/Zlb3KfKto=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=F3hGhw5nIeLSSwxOFrNKqFdyfv5G8CfxcjDd+LbZ/mZUENEnZzdYhU3C7IcgDzOeC
 gIggj/g7AEfBQvPU2fPTKcU7xiPB/locyNyhKJ025kvHt2v2j24bmzrCLs1gvgfseK
 qD+6b+wWsXt+N9uCebKdXBJO5VkOE+JjslcgwyNE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbG2-1n7CM53hkE-00sfip; Tue, 17
 Aug 2021 20:10:16 +0200
Date: Tue, 17 Aug 2021 20:10:14 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Scott Bartolett <SBartolett@thorlabs.com>
Message-ID: <20210817201014.235cf403@gmx.net>
In-Reply-To: <SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:vh36TB+qy5ckXJJBhkJABnMTvJDWO7h/wt+Y0o15t25LlOkOZYf
 xyXs36J1iEAdOfmKGxrEkggEEx5tI1o7GYiKegYQJl0RP0NyeFXwGcxmeEBx/MjFJY+T7a0
 nji+uVpKtizUEcr5bSRcFP++XALqru1KsLjEPJR0MKYfm2wzDB5eZUQnNGY1USHQnFkhq5q
 PRAJO2dZGO4+Ze7BsIhPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2pisyzrdDpI=:jYfG1yCegbIpXbMWlwJ6KQ
 yBP8/pdAQaXfujV9RmG1G39GM8RhjvLRbRXJuWDch2WTPq4PptTUoKyr2RMetGnAbAcZs+BhY
 CGYYcvtoY8eu7cKBedaF9TjFqi71doHGuu/92eocUq/YiC8mfVr45LIVTSQ+a2BKu0DwEZd/4
 EQBpVymjZZoM/JM0RExl9oXVvtClRGgiqKeq7c4dx4fhXVg8BEdTg4Euyw449d45Fe8eXie7g
 9uZvZJXfPJNZ9qV8bf4jYNDtnR+7R0lYAsZ/4iDINztMrU+mMU977x4R7Xm8l/1NK9pZaRiBF
 TZMQTpobcCWFkZUvAOmMWA5Hpc0eg01S7wmruujk1d11/W0DM4m846OnLBlG+uiDQExmgUTzW
 Z4xI562Qdv0wWD/UkADBCzyl8YQYuMCONuFBaLEO0HFm1qemGT9K4YBLfn77eQ0oYDSPZWnbr
 5b0ZJHtZf9uCRlAJ/ubdT7SJKY6u+Dnw7oQ2N1cGZz6Wc+5p7J8cCOOM3I2DgM2/tNovmY6lY
 CXbT09I+oHQEHKf/1XcUA13OveeTsPV2lAWMR7CKxletVj28vcjDhGQLMoTUlAd/Yf2UYKMRL
 B5IdRrId14X/mV1xUDPUi4SS3rStTdZQHu2sKOaG7ryfTSNOIhrhcQut8dMUWxpysGYyFrcZe
 Qz0zKS2GIRYg8VktumgfZoF7134z+wbxJEmpVEsiI+mCqorGNt9mDcyJev9FgphfL6j1RrvMT
 yGawzxP0dWIultxfNmWblBWzp4JKf6LW4EivT5lGIrc0BiMDJbPwM2Plc8BejpKDPwTDS3OVI
 wJxgWb0dZi94BrZlzy36cvySKtZ6FEs2hDtRkQ6E2Rv0Ee2+1IpndMLlGPRfC039y5uy1ilcH
 GFLH9ephM0lsWDrc1ZdKBV+9CnUsiucpv6FFKPdY0M3Cn5MP9i4FrWLS4Wek6tdh3ItdrHoXP
 KOZ8K96+OZPA3aR/njVmnaFjiWn36yU0yuQd2MyZZrjY8crUgGryUMBopJnKk3Z8aFn5kdBTO
 gyoBNH/1TI+J9DRBPjDz+kd4NRP9N+uCzvJZnZvt6N8nkccgHlrtX/VwX/9rtJk4be1tAymJW
 D2+xfQKrxMfBegM6DLY7SL3161tbq30gK/ETYXkyJCM6v1qns2v8CJ1AQ==
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

On Tue, 17 Aug 2021 17:47:49 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Hi all,
>
> I'm trying to run a Qt5 application on a Raspberry Pi running buildroot.  The application runs fine when I use the platform plugin linuxfb.  But when I try to use eglfs I'm getting the error that the DRM Device is not found.  I see this error message mentioned often when doing a search, but so far have not found any solution that works for me.  I've selected:
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> BR2_PACKAGE_MESA3D_OPENGL_ES
> BR2_PACKAGE_QT5BASE_OPENGL_ES2
> BR2_PACKAGE_QT5BASE_EGLFS
>
> Does anyone have any suggestions?

Edit the config.txt file on the first/boot partition on the SD card and
add (for RPi4):

	dtoverlay=vc4-kms-v3d-pi4

or (for Rpi3,...):

	dtoverlay=vc4-kms-v3d

See [1] for details...

Regards,
Peter

[1] https://github.com/raspberrypi/firmware/blob/master/boot/overlays/README

>
> Thanks,
> Scott
>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
