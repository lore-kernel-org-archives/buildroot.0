Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 23:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF290818D4;
	Sat, 15 Jan 2022 23:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMqFBzfm7VlR; Sat, 15 Jan 2022 23:03:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B08F818C9;
	Sat, 15 Jan 2022 23:03:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE2C1BF373
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 23:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 592E5818C9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 23:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5T0nUW4qBuq for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 23:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F19E8176D
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 23:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642287785;
 bh=jVQQevBjIsW1GZUl4AUbNbBeZVhQpz2KP9SD+IN/J4U=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Iyp1iQl8RvhKvPV6zFkBTGsc1gaDAtY7u2iA6ciKxpE+DzrSSnYxb9xPr1CjVvVx0
 Q33yrb1wE4+u6XKgR8LNrxADaUhAsuzZLGjTlBB4nuZP7O9qkRlOuLJRep3i82s/xu
 NwN+D02rArZgS37QJSzSwSl+rMh+iSn43vuXT/UM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.238]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNct-1mggCM2nKJ-00hrvR; Sun, 16
 Jan 2022 00:03:05 +0100
Date: Sun, 16 Jan 2022 00:03:04 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220116000304.15e7dcf8@gmx.net>
In-Reply-To: <20220109142748.4f7c1a59@windsurf>
References: <20201221203952.22168-1-ps.report@gmx.net>
 <20201221203952.22168-3-ps.report@gmx.net>
 <20220109142748.4f7c1a59@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:/QNrqwvDFQ2Hm1PlH5Ehw3aIiSPaQi6UPf10ypFKh5c10mUb/Xt
 J7htca2savf9bUDYL1aoDxyNpZ+ToVyGvI6BcbXGit2/heXZkf8V1gwA7iH5ojgD/iWiJZJ
 +fcqOdo4TtSzSkkijynJaB+HwJfHiuOKU1gPw+7rtazGGbIZXX+nyvWHbsZ6RZwfvNO1vio
 CCWAZL5QyUz1eQfQaFFXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d6s644qUb3U=:Fd5ysGAcCeat4suqwq5jLd
 ++O0qmQZ3+1DTce/YofH6dqWlCY8V4q3rkAKzWhRQ9A7H7s2LjWsmEYqCrq566X1+c92TBTKR
 ux3W3381rfDjag9BU/4XRRAc+IkTiKi03sYf0jH7nJ6DeZ6FikdI5x0xldIgbMVs6NCQCai5q
 BzRVx5SX1kN7czEK1CbOZWjKQCnL8hpHfeVorvcOev1tePyKQf2vQPQZF0V+WZkoLLREcyB+R
 27v2OkiubuDdKSnUixqSpD5ZVzjY95sbHGbvubTProqJmRBrCaCaT2D3fjviDvVrRo8ygDwZk
 3KYjqE1oZCiSUWyVvrWnE4214sZAsabgHcxyD+08WGcEWspJ6BqdMRj4q6SRde42V3gah14T1
 IQ7vAX6eyguOTnVoCAVfNFvA/sSkJltbHeZ51TNb9tqCp4JlKdhHQoYlgx4nQ+b+YFy5Kn3Ay
 VEKE4/nwHOr7j4rh5VS1gvo3TxJgNHbeBcw+NJl5MNkUICEGkzkho2SEcZJg6UdlqnE0hBSp8
 my8ukgWdnctrAIyBNC1b7bSsCwy1W6hFMkyyNGUye8YbthbMPyy8G5FP/1FD2NwNQx9gGAZaC
 N7Ev+a2urkIPcXOwBuR7yByE7X2nQWSULuLs3MG5Swpqip27XsvtvnU1S5Wy/E2xAry0Qa7si
 Vsbybs6ZNd0jjhAV+lvR7UdlkQV58G7lLZShjaFuFfjuPRnoWE5/oWLR8hbJYmaAxhKa04tVU
 zoUAKEfrxfsxic8oQ45OBzdajDH+JF4eZLknYwEBjgNQcgNzW4wQoL2Wz6kCScZfi22uUjhJK
 9XDqW7jTCSLffkZfr76p5x7FuiA69JmjTx7dFhiVvfLx00N9htMQ1F5AypILBxGLNTKYkIqY3
 meAqtWrhgee/HUdjt8ESmDZm3tdl/GlL4mi6Sdix0bbf8PaXsStE71uZCSAF1M5tl/RF7ik7m
 Ksdr4XQHgQkgoBjwAzIB0IA0c7ax2loxvzKdcxUUgsOjFcajHg1XsYQOyn2gumDFHOaDH6H7o
 Qal3u9OWaf5/FFYSvOywDTVJdOvQid0Z6G2sYbfOCXW2OknapG+lSEAsHjhNiVpoOZc82S/L6
 VY76pxQN6B+AJI=
Subject: Re: [Buildroot] [PATCH v1] package/qt5webengine: add optional
 host-freetype/host-libjpeg dependency
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@busybox.net,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sun, 9 Jan 2022 14:27:48 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 21 Dec 2020 21:39:51 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - add optional host-freetype dependency
> >
> > Fixes:
> >
> >   Command: .../host/bin/python2 .../build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py -p .../build/qt5webengine-5.15.2/host-bin/host-pkg-config freetype2
> >   Returned 1.
> >   stderr:
> >
> >   Package freetype2 was not found in the pkg-config search path.
> >   Perhaps you should add the directory containing `freetype2.pc'
> >   to the PKG_CONFIG_PATH environment variable
> >   Package 'freetype2', required by 'virtual:world', not found
> >   Could not run pkg-config.
> >
> >   See //build/linux/BUILD.gn:24:3: whence it was called.
> >     pkg_config("freetype_from_pkgconfig") {
> >     ^--------------------------------------
> >   See //build/config/freetype/BUILD.gn:10:24: which caused the file to be included.
> >       public_configs = [ "//build/linux:freetype_from_pkgconfig" ]
> >                          ^--------------------------------------
> >   Project ERROR: GN run error!
> >   make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 3
> >   make[3]: *** [Makefile:79: sub-core-make_first] Error 2
> >   make[2]: *** [Makefile:49: sub-src-make_first] Error 2
>
> I am falling into this issue while building the following defconfig:
>
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5WEBENGINE=y
> BR2_PACKAGE_RPI_USERLAND=y
>
> Did you had the chance to investigate more deeply why having fontconfig
> support in Qt leads qt5webengine wanting to find freetype2 on the host?

The observation is that all (optional) qt target options are requested by
qtwebengine for the host (and buildroot package fontconfig selects freetype)...

Regards,
Peter

>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
