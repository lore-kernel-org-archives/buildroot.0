Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F7BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 13:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A27282564;
	Tue, 30 Nov 2021 13:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DoPncmvj3hB; Tue, 30 Nov 2021 13:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF3D8254D;
	Tue, 30 Nov 2021 13:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27D341BF2AF
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 13:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2043440477
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 13:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=fail (1024-bit key) reason="fail (body has been altered)"
 header.d=arachnodroid.de
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIzjutmGwChq for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 13:57:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from v220200749773122244.hotsrv.de (unknown
 [IPv6:2a03:4000:47:39d:747f:15ff:fe4f:d530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3C1640475
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arachnodroid.de;
 s=dkim; t=1638280617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJZitxach/4S8I9/vHfizwMDm42rkycwTcSQ8asAbqg=;
 b=YIu+JwS+C7JZYejYNaxASGXyFsAGl9yyK1YCEzRuU/Y+fHu25AOrMXJMiIhFAwjP7lin8b
 go+BJfvM084TGLxz0a88ihvuR0PZUyHZEI6NeM4+O0NdcDpO7bAcN4IdHhz93tZyU0vTMT
 Aumf71w6qSMCW0JQq7lQTWe5Q+TM+8s=
Received: from [192.168.1.5] (ip4d16315a.dynamic.kabel-deutschland.de
 [77.22.49.90])
 by v220200749773122244.hotsrv.de (OpenSMTPD) with ESMTPSA id 1846df8d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 13:56:57 +0000 (UTC)
To: buildroot@buildroot.org
References: <f3e486d3-af27-1c7c-7022-c2a733216a7f@arachnodroid.de>
 <20211130095243.4e0d68dc@gmx.net>
From: Michael Taubert <info@arachnodroid.de>
Message-ID: <2730d9bb-fca0-11ed-05fb-523ea2a02294@arachnodroid.de>
Date: Tue, 30 Nov 2021 14:56:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130095243.4e0d68dc@gmx.net>
Content-Language: en-US
Subject: Re: [Buildroot] Mesa3D / RPi4 - Failed to open bo 1: Permission
 denied
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks Peter,

yes it addresses this issue. Unfortunately, the KMSRO driver option has 
been removed, so it may render this issue (further down) partly invalid now.

Your patch doesn't apply anymore either, and is partly rejected. I've 
put some thought into this, but it looks quite complicated with all 
these dependencies, which might break something somewhere else.

The easiest solution to make it work, at least on the RPi, seems to be 
to change

ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)

to

ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER)
    $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)
    $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),)

That way it chooses to disable dri3 if none of the drivers is selected, 
which might take use of it.

According to https://bugs.buildroot.org/show_bug.cgi?id=13831 it might 
be a good idea to add the lima and panfrost driver too.

Well, I would consider this a short-term solution that people can get 
dri3 to work for their devices, without modifying mesa3d.mk. It doesn't 
solve the problem of a kind of broken logic in that matter.

To get this solved, someone with more insight should take a look at the 
logic and all the effects that a change might cause. Or, maybe this 
simple attempt is the solution already?

If there is anything I can provide to support a solution that will be 
merged into the repository, please, anybody let me know.

Best regards,
Michael

Am 11/30/21 um 9:52 AM schrieb Peter Seiderer:
> Hello Michael,
> 
> On Tue, 30 Nov 2021 08:30:01 +0100, Michael Taubert <info@arachnodroid.de> wrote:
> 
>> Hi list!
>>
>> I've switched from branch 2021.02.x to 2021.08.x and got a problem with
>> Mesa3D. Mesa3D does not build with DRI3 support by default, which leads
>> into the error message 'Failed to open bo 1: Permission denied' when
>> running glxgears -info.
>>
>> Earlier this year I already got caught by this problem, but could work
>> around by enabling DRI SWRAST driver for Mesa3D. But this driver is not
>> available anymore. The meson-log says, it's not built with DRI3:
>>
>> buildroot-rpi4/output/host/lib/pkgconfig -Dgallium-omx=disabled
>> -Dpower8=disabled -Dllvm=disabled -Dgallium-opencl=disabled -Dglx=dri
>> -Dgallium-xa=disabled -Dgallium-vc4-neon=auto -Dshared-glapi=enabled
>> -Dgallium-drivers=v3d,vc4 -Dgallium-extra-hud=true -Ddri-drivers=
>> -Ddri3=disabled ...
>>
>> This is the output of glxgears:
>>
>> root@buildroot:~# glxgears -info
>> Failed to open bo 1: Permission denied
>> Running synchronized to the vertical refresh.  The framerate should be
>> approximately the same as the monitor refresh rate.
>> GL_RENDERER   = V3D 4.2
>> GL_VERSION    = 2.1 Mesa 21.1.6
>> GL_VENDOR     = Broadcom
>>
>> It runs, but the screen stays black.
>>
>> When I change mesa3d.mk to this:
>>
>> ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>> MESA3D_CONF_OPTS += \
>>           -Ddri-drivers= -Ddri3=enabled
>> else
>> ...
>>
>> It works again and the error disappears. How am I supposed to enable
>> DRI3 support for my RPI4 now?
> 
> The problem is maybe addressed by the following patchset:
> 
>   -  [PATCH v1 1/2] package/mesa3d: add config option for DRI3 support (see [1])
>   -  [PATCH v1 2/2] package/mesa3d: gallium/kmsro drivers require dri3 for X11 (see [2])
> 
> But did not find enough spare time/interest to do further work on this ones...
> 
> Regards,
> Peter
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-June/312614.html
> [2] http://lists.busybox.net/pipermail/buildroot/2021-June/615147.html
> 
>>
>> Thanks in advance.
>>
>> Best regards,
>> Michael
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
