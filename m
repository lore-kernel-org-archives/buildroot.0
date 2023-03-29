Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A287EC6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 15:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1435184188;
	Wed, 29 Mar 2023 15:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1435184188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7cQX8AZLepA; Wed, 29 Mar 2023 15:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AECB78410D;
	Wed, 29 Mar 2023 15:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AECB78410D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE911BF3C3
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 15:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9FBF40A54
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 15:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9FBF40A54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uH4USGkWHL-k for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 15:38:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9AB54000B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9AB54000B
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 15:38:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.135]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1pbnGR2PSF-00BpX0; Wed, 29
 Mar 2023 17:38:52 +0200
Date: Wed, 29 Mar 2023 17:38:51 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
Message-ID: <20230329173851.18816793@gmx.net>
In-Reply-To: <1619D009AA8C9E469331A8EE22395AEC8C24E05A@Exchange2013.PRIMES.local>
References: <1619D009AA8C9E469331A8EE22395AEC8C24E05A@Exchange2013.PRIMES.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:8ny7MVLK4ODh+U4leaSsLZBH050QZ3SMNa2PmkG/BJBDgjWluRV
 zPSrBZaVi8Cle3pwrraQkvq2Vr6Dj4ivHfZutRUGoARddyNLhoJtWJJl1Vuq9l4FrnXCJyA
 llSpB6ENjBDbdZS8mMvrektNDSzs7R/d/U6WkJru0Un1Nd1WIOmCMoxYfzyRWDYeI2usdk0
 7Z22d13aYKu9ylDGgmXnQ==
UI-OutboundReport: notjunk:1;M01:P0:R8Ds7dnBVDk=;OlRzOVSdY1YxopimNj2tVGq0f4Q
 zIVVjCKlTBezVvklN1pHowpkgDXH9fJEl+ZUHw64MrMFfwEOVQqe3QT3cpsxgjiSexp8ONaX0
 XDKQDUAf+nrOL5vSa+ZAYoVV3VJeaC21PunjgE1iIwthwBkUBp7ckEcNaaHCJoa0+Bqrf+n0I
 YiQAkKaBZEc9BVz5LCKKhCB3JcJGf1lw8g1pUg4GOpKXWWW7SIgX1HOh+xjrkZ+nNR8aZB8I0
 On2G6bknzyVuLJeNYuAVCf0UspyFDxAz05GRsR5CgJhW2J+8l3F59Of5nGjKh32dg1vImOAs6
 5+NQ+JILQ5gMCqOUPp2pVIZPhlvW3hY70btn20MG24evkwxPopWvdbyyOzX8Ef9uI807hrhex
 czI+LwNGEa457pB0UVkd+qvBYLaqWdz+R29uKt/PCKug9bgA9OPA79gL6+Wy8KsLx8NZjTKJN
 MLDge6455pLwr4BqiLG+A3HhW0zt1rAB0SU9SJxrAvp8Es7o60+JTqSVRWcTzDmvSogQ1kNGL
 3g3A83duZxPMfnhnERf6vR5sT84ONaO+74F4eGTJ3iyIhQqXqRLeczPaFC6eREYQsh+9iLz0W
 aVzqtDR7BPSJk1uVt61wBmxyCmkP6Z8Ik/o+jWDxEMwGVx6/AItTB1stdp9kotCeRFsM3uuL3
 yBrC+2QBaKjAu4UIvnWTTrVbp2MJBnsTcx05Qtw63AW168YsW8AAp922qX5m7AkZfu5rtyiMi
 nTux+8xBo3Ma/0Q3sh87CB6fKQteyqZNablH+z4LjI78nz8Sod4CXNtEW7TmwxmRTq4nAdX21
 LCU4Wyf/k/0S01lRhzOZnxMR7OYF6xc3GUbmkqe5izJ5zQUVPTdCmHLlF+h2tygpboeyzsvI6
 oOPYZutAa1bCYc0kO/5w1f2FgDkFxDn5QePwFgITGll0TNaq0ZkBrX4wlnv7aNJy8Dh/V/bX4
 XChqPwy71/3CJJjX5dRDxs6xDqA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1680104332; i=ps.report@gmx.net;
 bh=mH+TyddrwkEbeWCYcnIxWjs3VF6w7ytzkGnZcGvmMUQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=tfSjTnC35qs80wVt/Dg2Ji2S4AGCX5RECIJKUAZFZKEHjuKkf4ATJ9UM3uI2+B38N
 6dZ9xAUAAaDjZz97R0x3dgHviJ6l8PHP6SSOzL1P62KnwjuSXYfcKKt4o0xPXkT2t8
 S8OHALJRWePtK0oRqHZPWwXChaDXHHY8ghqeNrRjitA2AGg+qM4ym3BAOY4zGklhPc
 q6MC7cuSPPowoGm1ctfIJXDHEQaMRINctSXAJ67SrAg/SR4CQDdhZv8Ft3p3NPXl9P
 mYyP0FmQE4tnyeFWP1wJo2oKvUP/dBsxe9LYN5UvdIOaqtvvaZ+x6mbLc6WMuFmk9M
 p825I9l46Utyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=tfSjTnC3
Subject: Re: [Buildroot] generating a kernel with camera support (video 4
 linux)
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gerd,

On Wed, 29 Mar 2023 15:22:23 +0000, Gerd Kautzmann <G.Kautzmann@PRIMES.de> wrote:

> Dear audience,
>
> I need you help generating a complete image for a Raspberry4 with camera support.
>
> I'm new to buildroot, currently I'm trying to generate an image with the support for a camera using video4linux.
>
> The sytem I generated is booting but doesn't use the connected imx219 camera, it has the drivers(?) needed in
>
> /lib/modules/5.10.92-v7l/kernel/drivers/media/i2c/imx219.ko
> /boot/overlays/imx219.dtbo
>
> But it will not generate the /dev/video0 device needed.

Add 'dtparam=i2c=on' and 'dtoverlay=imx219' to the config.txt file on the
first partition, reboot and (dependent on your configuration) load the
module via 'modprobe imx219' (or re-build your buildroot image with
'/dev management' set to Dynamic mdev or eudev which will enable the
udev autoload magic of the kernel modules)...

Regards,
Peter

>
> Do you have any ideas or doe you know where I can get further help?
>
> Thanks for you help.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
