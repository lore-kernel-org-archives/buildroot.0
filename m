Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EE2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 16:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D84F6818CA;
	Mon,  3 Jan 2022 16:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YI11zixMLXW1; Mon,  3 Jan 2022 16:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A907818A2;
	Mon,  3 Jan 2022 16:37:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FA151BF2B5
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 16:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BB8060AD0
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 16:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPSVPlXzYt-C for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 16:36:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp.ex10.biz (ikhexhub04.ex10.biz [178.170.125.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 596CE60A90
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 16:36:59 +0000 (UTC)
Received: from IKHEXMBXC02N01.ikhex.ikoula.com ([fe80::cde4:a1f9:1383:b44c])
 by ikhexhub04.ikhex.ikoula.com ([178.170.125.68]) with mapi id
 14.03.0487.000; Mon, 3 Jan 2022 17:36:54 +0100
From: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/qt5: fix parallel build qmake
 package (qt5) doesn't build when using parallel build.
Thread-Index: AQHX8L9yl/kCTeQkd0qHN9smmL9+iaw0E/SAgADGhsCAEIkmgIAMNMjw
Date: Mon, 3 Jan 2022 16:36:53 +0000
Message-ID: <FAABCD35A3EE5E419EC2DCD8792107CABC6FA3E0@ikhexmbxc02n01.ikhex.ikoula.com>
References: <20211214075133.4482-1-florent.aumaitre@medianesysteme.com>
 <20211215232839.22ae07a9@gmx.net>
 <FAABCD35A3EE5E419EC2DCD8792107CABC6F998E@ikhexmbxc02n01.ikhex.ikoula.com>
 <20211226235013.22faad2e@windsurf>
In-Reply-To: <20211226235013.22faad2e@windsurf>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [178.170.125.119]
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: fix parallel build qmake
 package (qt5) doesn't build when using parallel build.
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> -----Message d'origine-----
> De=A0: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Envoy=E9=A0: dimanche 26 d=E9cembre 2021 23:50
> =C0=A0: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
> Cc=A0: Peter Seiderer <ps.report@gmx.net>; Julien Corjon
> <corjon.j@ecagroup.com>; Naumann Andreas
> <ANaumann@ultratronik.de>; buildroot@buildroot.org
> Objet=A0: Re: [Buildroot] [PATCH 1/1] package/qt5: fix parallel build qma=
ke
> package (qt5) doesn't build when using parallel build.
> =

> Hello Florent,
> =

> On Thu, 16 Dec 2021 09:25:19 +0000
> Florent AUMAITRE <florent.aumaitre@medianesysteme.com> wrote:
> =

> > > Which failure? Does it happen with per-package enabled or without
> > > (would like to avoid the forced MAKE1 for all qt packages install)
> > > too? In case it happens with per-package disabled it should go to an =
extra
> patch...
> >
> > I observe a race condition with some install target
> > 2021-11-04T12:43:36 Makefile:886: recipe for target
> > 'install_do_install_qmltypes' failed
> > 2021-11-04T12:43:36 Makefile:400: recipe for target
> > 'sub-wavefrontmesh-install_subtargets' failed
> > 2021-11-04T12:43:36 make[4]: ***
> > [sub-wavefrontmesh-install_subtargets] Error 2
> > 2021-11-04T12:43:36 make[4]: *** Waiting for unfinished jobs...
> >
> > Qt5declarative generated makefile (qt5declarative-
> 5.15.2/src/imports/wavefrontmesh/Makefile) install twice
> /usr/qml/Qt/labs/wavefrontmesh/plugins.qmltypes in target install_qmlfiles
> and install_do_install_qmltypes.
> =

> Could you specify whether this happens with
> BR2_PER_PACKAGE_DIRECTORIES enabled or disabled? Also, do you have an
> example Buildroot configuration that exhibits this problem?

This appended with BR2_PER_PACKAGE_DIRECTORIES enabled.
This problem is random so I didn't have a configuration that exhibits the p=
roblem all times.
For info we build on a machine with 36 cores (Intel(R) Core(TM) i9-10980XE =
CPU @ 3.00GHz).
I think http://autobuild.buildroot.net/results/d0c/d0c43084edd4de1221d93dfd=
fa15dfdeae16ceeb/build-end.log is the same problem.

> =

> According to http://autobuild.buildroot.net/?reason=3Dqt5declarative%
> there are only 3 "recent" failures of qt5declarative-5.15.2 and they are =
not
> what you're pointing.



> We unfortunately can't "blindly" apply a workaround for a problem that is=
n't
> "visible".
> =

> However, your commit seems to mix up the $(MAKE) -> $(MAKE1) change
> with those PKG_QMAKE_FIXUP_ABSOLUTE_PATH and
> QT5BASE_CMAKECONFIG_FIXUP macros which are not explained in the
> commit log. Could you give more details?

Some part of the patch is for issue with linker like in http://autobuild.bu=
ildroot.net/results/8eb/8ebf6f8024ba32883e5c34c1c1c69de77246a7c3/build-end.=
log =

Sysroot path : --sysroot=3D/tmp/instance-0/output-1/per-package/qt5declarat=
ive/host/arm-buildroot-linux-gnueabihf/sysroot
And =

Library search path : -L/tmp/instance-0/output-1/per-package/qt5base/host/a=
rm-buildroot-linux-gnueabihf/sysroot/usr/lib

Are not with the same prefix path so linker didn't find system library.
So I add PKG_QMAKE_FIXUP_ABSOLUTE_PATH and QT5BASE_CMAKECONFIG_FIXUP to fix=
 this.


> Best regards,
> =

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> engineering and training https://bootlin.com


Best Regards
Florent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
