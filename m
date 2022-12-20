Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBDAC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 20:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EE7B40926;
	Tue, 20 Dec 2022 20:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE7B40926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jITnfOR3bQP2; Tue, 20 Dec 2022 20:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F12F403E2;
	Tue, 20 Dec 2022 20:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F12F403E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECB441BF2C9
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 20:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3244410E4
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 20:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3244410E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2lJABXkZY04 for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 20:29:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFA7740935
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFA7740935
 for <buildroot@uclibc.org>; Tue, 20 Dec 2022 20:29:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1p7jEb-0007D4-Kh
 for buildroot@uclibc.org; Tue, 20 Dec 2022 21:29:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Dec 2022 21:28:41 +0100
Message-ID: <pan$e9c76$f81cd308$b705d028$1027881e@ID-313208.user.individual.net>
References: <20221212211428.2036144-1-bernd.kuhls@t-online.de>
 <878rj2h75o.fsf__38979.5937271387$1671520929$gmane$org@dell.be.48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-input-keyboard: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Tue, 20 Dec 2022 08:21:39 +0100 schrieb Peter Korsgaard:

>>>>>> "Bernd" == Bernd Kuhls
>>>>>> <bernd.kuhls@t-online.de> writes:
> 
>  > According to the upstream release notes of version 2.0.0:
>  > https://lists.x.org/archives/xorg-announce/2022-July/003180.html
> 
>  > "This keyboard driver is primarily used with BSD, GNU Hurd, illumos,
>  > &
>  >  Solaris systems. Linux systems should instead use either xf86-input-
>  >  libinput or xf86-input-evdev.
> 
>  >  While versions 1.9.0 and earlier had rudimentary support for Linux
>  >  as well, that has been removed in this release."
> I've reworded this to say "no longer support Linux" and committed,
> thanks.
> 
> Does the same not apply for the input-mouse driver?

Hi Peter,

according to https://lists.x.org/archives/xorg-announce/2022-November/
003247.html "xf86-input-mouse is the Xorg server mouse driver for non-
evdev OS'es." No talk of not being usable on Linux so I kept that package 
to be used by BR2_ROOTFS_DEVICE_CREATION_STATIC defconfigs.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
