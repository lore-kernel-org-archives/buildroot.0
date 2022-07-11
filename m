Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F318C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E33683E91;
	Mon, 11 Jul 2022 19:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E33683E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWQB13CSJYx9; Mon, 11 Jul 2022 19:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B10283E24;
	Mon, 11 Jul 2022 19:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B10283E24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A05A1BF301
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 19:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42D5F60FA4
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 19:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D5F60FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYYOpT9B8uAe for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 19:51:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E0CE60A46
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E0CE60A46
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 19:51:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FD4A326;
 Mon, 11 Jul 2022 21:51:09 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <CADvTj4raCkFMggd_Z3ye36q_RYNMn8wzKSbzAumq5M-zL8AmSg@mail.gmail.com>
References: <20220711130054.110406-1-foss+buildroot@0leil.net>
 <CADvTj4rXHbym30M=8wypZSC6GeH++C-h1OHcd_7O44eWC+pUhw@mail.gmail.com>
 <a2c47071-f64f-356e-31f2-4eecf7c3fb27@theobroma-systems.com>
 <CADvTj4raCkFMggd_Z3ye36q_RYNMn8wzKSbzAumq5M-zL8AmSg@mail.gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Date: Mon, 11 Jul 2022 20:51:07 +0100
Message-ID: <165756906720.1398129.15174501461755746022@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1657569069;
 bh=j3HTzrESBTQesqDRiq+Nan/ScjF9iTA5CFsJMjVFSeQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=k16JVT/hDbBpxA3dJw8q6+L0oNUBKaWI0BhrHaYYl/shi6VPZSu8dFDXjelRp6pGD
 yeUiNDxrCyjCorscAuBVXlOUL72p2xMG7UuRtNWwgM0Em9L+zhjzIMQGqJc6rb3sMq
 xgvVBbUbIJ9CBehKSvaVTKsDXD2QHfwLOqmOknyo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=k16JVT/h
Subject: Re: [Buildroot] [PATCH] package/libcamera: add explicit dependency
 on libevent if libevent package to be built
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting James Hilliard (2022-07-11 14:28:59)
> On Mon, Jul 11, 2022 at 7:11 AM Quentin Schulz
> <quentin.schulz@theobroma-systems.com> wrote:
> >
> > Hi James,
> >
> > On 7/11/22 15:05, James Hilliard wrote:
> > > On Mon, Jul 11, 2022 at 7:01 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
> > >>
> > >> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > >>
> > >> The cam application requires libevent. Since there's no Kconfig option
> > >> for it, cam building ability is checked by meson build system by default.
> > >>
> > >> If libevent is present in the sysroot, cam is built.
> > >>
> > >> The issue is that there's no explicit dependency on libevent in
> > >> libcamera package. This means that it is possible for libevent AND
> > >> libcamera to be built, but have libcamera be built before libevent.
> > >> Meaning that even if all requirements seem to be fulfilled, cam still
> > >> won't be enabled in some cases.
> > >>
> > >> This fixes the possible race by expliciting the dependency to libevent
> > >> if the libevent package is enabled. Otherwise, explicitly disable cam
> > >> building as it's already known that it isn't going to build.
> > >>
> > >> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> > >> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > >> ---
> > >>   package/libcamera/libcamera.mk | 6 ++++++
> > >>   1 file changed, 6 insertions(+)
> > >>
> > >> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > >> index 41d6a5abef..78243add18 100644
> > >> --- a/package/libcamera/libcamera.mk
> > >> +++ b/package/libcamera/libcamera.mk
> > >> @@ -84,6 +84,12 @@ else
> > >>   LIBCAMERA_CONF_OPTS += -Dqcam=disabled
> > >>   endif
> > >>
> > >> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> > >> +LIBCAMERA_DEPENDENCIES += libevent
> > >
> > > You should also explicitly add this as autodetection logic may
> > > otherwise mask errors:
> > > LIBCAMERA_CONF_OPTS += -Dcam=enabled
> > >
> >
> > Where do we draw the line between implicit enabling of build options and
> > adding a proper Kconfig option? Because if the list of dependencies for
> > cam increases, it'll get less and less obvious to the user how to enable
> > cam support without reading the makefile of the package.
> 
> It's somewhat subjective, but generally if a feature is useful based on the
> presence of a dependency auto-enabled via makefile is generally ok, provided
> that it doesn't trigger a build time behavior change that can't be modified
> via other means like overriding a runtime config via overlay.
> 
> Enabling/disabling via kconfig is usually needed when there's either a
> behavior side effect for enabling an option or if one is using selection logic
> from another kconfig option to enable something, but then things can
> get more complex as one must ensure indirect dependencies are also
> correctly propagated.
> 
> In general if one has a valid use case for enabling/disabling an option in
> the build separately from the presence of a dependency then it should
> probably have a kconfig option.

As 'cam' is a specific test tool, I would of thought perhaps it
warrants a specific option to explicitly enable it or disable it.
Of course enabling it should then declare libevent as a dependency.

If a user wants to test their camera bring up - they likely want to
'enable cam' (or disable it when making a released image).

But they probably don't expect to 'Enable libevent to add in cam'..?

--
Kieran

> 
> >
> > But adding this line to the makefile makes the maintainer's life easier
> > as it'll fail to build next time there's an upgrade and cam has added
> > dependencies. So that's already a win :)
> >
> > Thanks,
> > Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
