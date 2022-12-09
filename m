Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DFDC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 08:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4986F60B3D;
	Fri,  9 Dec 2022 08:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4986F60B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eq5Ci6YQnHZn; Fri,  9 Dec 2022 08:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F65860A6B;
	Fri,  9 Dec 2022 08:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F65860A6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72A0D1BF3F4
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 08:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D5FD41814
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 08:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D5FD41814
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmGYL2SSabKE for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 08:31:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53AAC41A15
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53AAC41A15
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 08:31:38 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 2B98VZv2002013
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Dec 2022 09:31:36 +0100
Date: Fri, 9 Dec 2022 09:32:28 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221209093228.2f71a0b5@x230_1.trabucayre.com>
In-Reply-To: <20221209092724.270a5a11@windsurf>
References: <20221209072525.527FF81ABA@smtp1.osuosl.org>
 <20221209092215.5dcd9460@x230_1.trabucayre.com>
 <20221209092724.270a5a11@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-12-08
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
Cc: gwe@trabucayre.com,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Fri, 9 Dec 2022 09:27:24 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Gwenhael,
> 
> On Fri, 9 Dec 2022 09:22:15 +0100
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > Weird: volk requires gcc >= 7 as explicitly noted in Config.in;
> > depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> > 
> > When applying this defconfig this warning is displayed:
> > WARNING: unmet direct dependencies detected for BR2_PACKAGE_VOLK
> >   Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=n] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_USE_MMU [=y]
> > 
> > It make sense because this defconfig for mips uses gcc 5.3.0 and this version has no support for c++17, resulting to this built failure.  
> 
> It's because BR2_PACKAGE_GNURADIO selects BR2_PACKAGE_VOLK, but does
> not have the BR2_TOOLCHAIN_GCC_AT_LEAST_7 dependency.
> 
> Essentially, commit 66215faa5237e3704d55ff171537468079dda9c4 from you,
> which added the gcc >= 7 dependency on volk is incorrect: it misses
> propagating this dependency to gnuradio.
> 
> Could you have a look at fixing this?
>
Of course! I have to prepare a patch because gnuradio itself requires gcc >= 9.3
so this will fix this issue and another one.

> Thanks a lot,
> 
> Thomas


Thanks!
Gwen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
