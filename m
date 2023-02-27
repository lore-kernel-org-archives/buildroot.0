Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A0AC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 21:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525FF417A1;
	Mon, 27 Feb 2023 21:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 525FF417A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2_8XALT6Dzh; Mon, 27 Feb 2023 21:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 201154098D;
	Mon, 27 Feb 2023 21:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201154098D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 884DB1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61AF081F71
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61AF081F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xp-RctaGzQiX for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 21:56:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C722B81E1B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C722B81E1B
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 21:56:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.73]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1oPO6030TF-017mtm; Mon, 27
 Feb 2023 22:56:01 +0100
Date: Mon, 27 Feb 2023 22:56:00 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230227225600.786e1389@gmx.net>
In-Reply-To: <20230227224113.0eb16910@gmx.net>
References: <PH1P110MB16030F6BC0949CA7477F0B829FAF9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <20230227224113.0eb16910@gmx.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:64rIVc0PMdItEXInOZfaCt0yEzq9IFphkuvS76CSC5ChAFOQ8tN
 SrCLAt/IIp6iswlb7O3Ts1ba5PsJ0mb3loCd4dSS0zgQAYKM5bIpqQOYSYyiCX/wSiMcJYu
 eMGJ8vdpKzD7j+W3c4D+JM81WhNY4wHpivYs0Hl1RHwyNriSVfCqv6KpVNv9VfE6ilkZY/s
 oMVB0QRUvoh3z21+wwuMQ==
UI-OutboundReport: notjunk:1;M01:P0:ghYPQUAF/1I=;A4il2GBmvmiWGn4v8M5Fb0gWHne
 B3K1Ti/xems/vLKM/e5l+90Jd8h3T/Es2EAmxT73qLgacyFJu/PElydF1J3xWTNwMijOJhkhA
 Ak83U6y+HIZpfASQJ/8n26NCF0lzXxLV+sa/ll5tnSPe5YtgqQ2d1uWQeLJ2CJnjjrTiVVnNM
 v97td8b0IR4LJgWDqihnvGmC18bi6r2OAPNQPHbZQD8sEHDbm1d1k8jq5uzDFogWluZ67N7SV
 TezCXX/c92j52DB1dA3ndyDvKpmChoOOtI94MRk3QYjLA6kvp6DXVRmKnugc3BuCYTznkS0Hz
 E2ZL410QS2U4fuuOccPB3iD3MKd8hXrhLk6jb/Ek/iQfTXkT1gaKTph88wgTqclnnFsc1E55G
 ftiL+vh4KSs1XTanjL8NQ30fHg/WgkydNLnjoCfPUxBbijLowHEFudhaVCfuEYZq0m9GoC+xx
 N0Q1ZBno+b4jhnusXut2N5opHjnBwOqq/sCSFEdw7bHnCuYScL7A+JVIV/CnOzoYmPPlmS3GE
 ZBRCr7U7RwCKYB2fj+G3YTSDCjo+uO1BVw33e3StTb6BN0CJcci/vfpp1AuwGz6evFf1PQg7j
 1r74dlTQ78HyObG357/WKFzsrlN+b25Q6XufwXmH56//74VFEBWdoMXZXyFiZrdyfzO3Y+JVr
 Ux8a1Mncm4OfyK8QhTcwCG9PcX11xuFs66pNhyv31X3CLE5fhIjsKjNVnZ5o5HErAfPQ46MWs
 YdnrKiTvQ1jUlgm0Kdxz3eicEBx0ykLg6bRi/5MRTtHGFL6gl/WdvANv3olmAO8wPDo7l5YUl
 +bNdcv4CqfpdZ4xSE7r2f2sNaCFmaMWp4Rm0bTVm5MbQy1BtVMOTZ6DX0GbsNvxXDLVlRCn35
 LJrsUXdNT2AFD+JkhF1jLEqdd3aQuBncGNzOETW8/nUAO1FeBc/xccPPH9XNSiPHHCoHuJg6u
 Ke4LyV44Fsd59j3wzfcdTY5i+8Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1677534961; i=ps.report@gmx.net;
 bh=FO53GVArPSHtxXkNT8DddFxv/Aw7omg1z0HTwCKf26s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=RuboVkeK0yqQHfzvoTscMlv1mi5+4Y4hPGKusrfDLuFWB1zf6Z7N67Ms5vV8U8vE4
 HJlAOqlQX7e4SoTPnfs7t4GpJh2d4U9TlZbfLnDxkTnPF3mXPbtiXYuL4j/hAbrKB8
 swYMueC2drJqIPp3BZcTBg2MNZEp10kKduE3/6/cmWdjaBN/9iRvThd0jcRhvEnlwi
 U2CIpGTiLPqM39nDPKJIKNzpR3cluOwi50k1A5DypvIoh0kIYgBKknlsG2v89yzFET
 Hn81SeXRicecW2rbs709g1k3kmxzp7Bl4fGMjalcq/IC6AadkDH8XC+WQGLIJYg03S
 23iu1xbrs5VYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RuboVkeK
Subject: Re: [Buildroot] [PATCH v1] package/speechd: fix gettext version
 mismatch
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

Hello Vincent,

On Mon, 27 Feb 2023 22:41:13 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Vincent,
>
> On Mon, 27 Feb 2023 21:17:40 +0000, Vincent Fazio <vfazio@xes-inc.com> wrote:
>
> > Peter,
> >
> > > -----Original Message-----
> > > From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Peter
> > > Seiderer
> > > Sent: Monday, February 27, 2023 3:08 PM
> > > To: buildroot@buildroot.org
> > > Subject: [External] - [Buildroot] [PATCH v1] package/speechd: fix gettext
> > > version mismatch
> > >
> > > - fix gettext version mismatch in case of BR2_SYSTEM_ENABLE_NLS and
> > >   BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-gnu" by setting
> > >   SPEECHD_GETTEXTIZE
> > >
> > > Fixes:
> > >
> > >   -
> > > http://autobuild.buildroot.net/results/283333290c5adb48d0c6e592b3261992
> > > 537f92d3
> > >
> > >   Making all in po
> > >   *** error: gettext infrastructure mismatch: using a Makefile.in.in from
> > > gettext version 0.19 but the autoconf macros are from gettext version 0.20
> > >
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > ---
> > >  package/speechd/speechd.mk | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
> > > index dee94a6752..ec62980986 100644
> > > --- a/package/speechd/speechd.mk
> > > +++ b/package/speechd/speechd.mk
> > > @@ -11,6 +11,7 @@ SPEECHD_LICENSE_FILES = COPYING.GPL-2
> > > COPYING.GPL-3 COPYING.LGPL  SPEECHD_INSTALL_STAGING = YES  #
> > > speechd source code is released without configure script
> > > SPEECHD_AUTORECONF = YES
> > > +SPEECHD_GETTEXTIZE = YES
> >
> > I wonder if this will actually be necessary after https://patchwork.ozlabs.org/project/buildroot/list/?series=343029
> >
> > Can you test to see if it's still a problem after applying the series and using autopoint?

package/speechd needs 'SPEECHD_AUTOPOINT = YES'...

Regards,
Peter


>
> Yes, already on my ToDo list ;-), in the meantime (and for master branch/2023.2) this minimal patch...
>
> > Otherwise I'll try to find some time to test your patch with autopoint to see if there's still an issue.
>
> Thanks for taking a look at it...
>
> Regards,
> Peter
>
> >
> > >  SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
> > > SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
> > >  SPEECHD_CONF_OPTS = --without-kali
> > > --
> > > 2.39.2
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > > CAUTION: This email originated from outside of the organization. Do not click
> > > links or open attachments unless you recognize the sender and know the
> > > content is safe.
> >
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
