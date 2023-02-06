Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35445C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 07:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B36FA60888;
	Mon,  6 Feb 2023 07:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36FA60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzybZfBvXSJ1; Mon,  6 Feb 2023 07:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D556360806;
	Mon,  6 Feb 2023 07:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D556360806
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47EAA1BF573
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 07:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E1FC60806
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 07:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E1FC60806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JE_3e7gONJ_g for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 07:39:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7729B607F6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7729B607F6
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 07:39:39 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A696C100003;
 Mon,  6 Feb 2023 07:39:32 +0000 (UTC)
Date: Mon, 6 Feb 2023 08:39:31 +0100
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20230206083931.759b3ee3@pc-7.home>
In-Reply-To: <db5852a56a1ea7adb916e3831da75975@umbiko.net>
References: <mailman.18015.1675100677.179342.buildroot@buildroot.org>
 <db5852a56a1ea7adb916e3831da75975@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675669174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dacGUK099Fl5nPw95n0sA0xRDWqnSwAnyrvN8issz6s=;
 b=ZnBsAx+OSyND9s94y4jiBs9xh7dOgybNLHeEYEWv7BD+IGS5KUXUmW624/PvfiyTcO5XYM
 LIzfoujgHX7klyvU1POspwy+CrlL6qtn3M0iEQZZdRtH9zeOMEbSnOFE7WCRuDdkZenuMy
 YKrtWCdJflxPLx0db+kTfpeM8zgCHB9im28GAYEZVbpQ/axEz8DViQV5BzPTrdaRIkTph3
 drl9CBjfuilz/0kySB8Id6lYgsKDXmAEQidvK9o2cfBOfBAcqY4XaC2Zahohosnq9S0yCb
 BxI9P2XeqyvwHjT5jby/j83feWu0OVX3mjhxA2wUQk300fGbpquhlMYjQ6D/pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZnBsAx+O
Subject: Re: [Buildroot] [PATCH 3/4] package/linux-tools: add rtla
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Sun, 05 Feb 2023 09:22:56 +0100
Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Maxime,
> 
> I was able to build RTLA after some adaptions, see below.

Thanks for the effort, I appreciate !

> On 2023-01-30 18:44, Maxime Chevallier wrote:
> > 
> > The RealTime Linux Analysis tool includes a set of commands that
> > relies on the osnoise and timerlat tracers from the ftrace kernel
> > subsystem, allowing to analyze the lantency sources coming from the
> > hardware and the kernel itself.
> > 
> > This tool was introduced in v5.17, and relies on libtracefs and
> > libtraceevent, although libtraceevent itself is already a
> > dependency for
> > libtracefs.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  DEVELOPERS                                |  1 +
> >  package/linux-tools/Config.in             | 10 +++++++
> >  package/linux-tools/linux-tool-rtla.mk.in | 32
> > +++++++++++++++++++++++ 3 files changed, 43 insertions(+)
> >  create mode 100644 package/linux-tools/linux-tool-rtla.mk.in
> > 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index fe7194f817..8f459c796a 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2109,6 +2109,7 @@ F:	package/timescaledb/
> >  N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
> >  F:	package/libtraceevent/
> >  F:	package/libtracefs
> > +F:	package/linux-tools/linux-tool-rtla.mk.in
> > 
> >  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
> >  F:	board/arcturus/
> > diff --git a/package/linux-tools/Config.in 
> > b/package/linux-tools/Config.in
> > index 8a0b6d5802..186392b816 100644
> > --- a/package/linux-tools/Config.in
> > +++ b/package/linux-tools/Config.in
> > @@ -102,6 +102,16 @@ config 
> > BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
> > 
> >  endif
> > 
> > +config BR2_PACKAGE_LINUX_TOOLS_RTLA
> > +	bool "rtla"  
> 
> Since a version dependency exists, you might add:
> 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17

Good call !

> > +	select BR2_PACKAGE_LINUX_TOOLS
> > +	select BR2_PACKAGE_LIBTRACEFS
> > +	help
> > +	  Linux 5.17 and later has 2 new tracers, osnoise and
> > timerlat.
> > +	  There tracers allow performing latency analysis, for
> > which
> > +	  the rtla tool provides wrapper commands to visualize and
> > +	  extrace latency traces and reports.
> > +
> >  config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
> >  	bool"selftests"
> >  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> > diff --git a/package/linux-tools/linux-tool-rtla.mk.in 
> > b/package/linux-tools/linux-tool-rtla.mk.in
> > new file mode 100644
> > index 0000000000..a736e3b785
> > --- /dev/null
> > +++ b/package/linux-tools/linux-tool-rtla.mk.in
> > @@ -0,0 +1,32 @@
> > +################################################################################
> > +#
> > +# rtla
> > +#
> > +################################################################################
> > +
> > +LINUX_TOOLS += rtla
> > +
> > +RTLA_DEPENDENCIES = host-pkgconf libtracefs  
> 
> RTLA needs some kernel features; better to include them here, saves
> time experimenting:
> 
> # linux kernel needs FTRACE, TIMERLAT_TRACER, HIST_TRIGGERS for RTLA
> to work
> ifeq ($(BR2_PACKAGE_LINUX_TOOLS_RTLA),y)
> define RTLA_LINUX_CONFIG_FIXUPS
> 	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
> 	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERLAT_TRACER)
> 	$(call KCONFIG_ENABLE_OPT,CONFIG_HIST_TRIGGERS)
> endef
> endif

Oh I wasn't aware that we could enable kernel options that way. I'll
include them in the v2, along with CONFIG_OSNOISE_TRACER that is also
required.

> > +RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> > +	CC=$(TARGET_CC) \
> > +	LDFLAGS="$(TARGET_LDFLAGS)" \
> > +	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> > +  
> 
> The RTLA Makefile unconditionally compiles with stack smashing 
> protection; linking fails on builds configured without this feature:
> 
> # adapted from linux-tool-tmon.mk.in
> ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> define RTLA_DISABLE_STACK_PROTECTOR
> 	$(SED) 's/-fstack-protector.* //' 
> $(LINUX_DIR)/tools/tracing/rtla/Makefile
> endef
> endif

Good catch too, I didn't see that.

> > +define RTLA_BUILD_CMDS
> > +	$(Q)if ! grep install
> > $(LINUX_DIR)/tools/tracing/rtla/Makefile   
> > >/dev/null 2>&1 ; then \  
> > +		echo "Your kernel version is too old and does not
> > implement the rtla tool." ; \
> > +		echo "At least kernel 5.17 must be used." ; \
> > +		exit 1 ; \
> > +	fi
> > +  
> 
> 	$(RTLA_DISABLE_STACK_PROTECTOR)
> 
> > +	$(TARGET_MAKE_ENV) \
> > +	$(MAKE) $(RTLA_MAKE_OPTS) \
> > +	-C $(LINUX_DIR)/tools/tracing rtla
> > +endef
> > +
> > +define RTLA_INSTALL_TARGET_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/tracing \
> > +	$(RTLA_MAKE_OPTS) \
> > +	DESTDIR=$(TARGET_DIR) \
> > +	rtla_install
> > +endef  
> 
> rtla_install fails with:
> Makefile:34: *** NOTICE: rst2man required to generate man pages.
> Stop. because it tries to build and install man pages also. Better to
> use a custom install command:
> 
> # The rtla_install target tries to create and install manpages,
> # which terminates with an error and cannot be disabled
> define RTLA_INSTALL_TARGET_CMDS
> 	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla \
> 		$(TARGET_DIR)/usr/bin/rtla
> endef

Ok makes sense as well :)

Thanks a lot for the review, tests and fixes !

Maxime
 
> Kind regards,
> Andreas
> 
> > --
> > 2.39.1  

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
