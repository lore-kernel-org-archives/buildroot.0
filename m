Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F402C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 07:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12B98817BA;
	Mon,  6 Feb 2023 07:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12B98817BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-J6UQSdhXRj; Mon,  6 Feb 2023 07:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F88F8141E;
	Mon,  6 Feb 2023 07:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F88F8141E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 201681BF573
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 07:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C04274029F
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 07:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C04274029F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGxIp-j0vn8I for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 07:34:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 297714023F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 297714023F
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 07:34:49 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B72E740009;
 Mon,  6 Feb 2023 07:34:46 +0000 (UTC)
Date: Mon, 6 Feb 2023 08:34:45 +0100
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20230206083445.4ad1e510@pc-7.home>
In-Reply-To: <bd47b6d90e460842dbe8252016f2b077@umbiko.net>
References: <mailman.18015.1675100677.179342.buildroot@buildroot.org>
 <bd47b6d90e460842dbe8252016f2b077@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675668887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmqupFmvBu6HrwsV+INFyNIw4VpjNmGrpmmSCwT5jKI=;
 b=UGvIfZ+3jfunAICjkosoM3nE7SXy/rF+Efdqk6LZtoB8E35dcXzPmAv71onSZbYHUW8KLE
 2/uL/+pk0KWA/5kUMcC1Yx/ubaxlWL0DJTpOZvB6POWcrhYZ8CfYK77oYHwc73k2MPkGRU
 miBCvuUyFV3mbBN/RyIFcy0ta5UCZeFO4iSksKwh/HHyAw+KyplzEtvZDU2c+pDRQn6F2Q
 LMKf1bqjKwOlsSRKXZoisaYk27YFbJ9ci2fz66Ksrt4lxQ+mAVS2ygN/co+K3LcvkcLYNb
 pm9JfJnguCqn9SO0OY6rhkuAPTzzTgoF5VAnJjZCbDmfwZHDMLCzbf8D2SfOHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UGvIfZ+3
Subject: Re: [Buildroot] [PATCH 1/4] package/libtraceevent: new package
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

On Sun, 05 Feb 2023 09:20:15 +0100
Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Maxime,
> 
> libtraceevent and libtracefs are libraries, thus should be positioned 
> under "Target packages" -> "Libraries".

Oops my bad, I should have put them there indeed.
 
> Introducing a "Debugging, profiling and benchmark" category here
> would probably be appropriate.

Good idea !

> Tested successfully on x86_64 hardware.

Thanks a lot ! I'll respin with the proposed changes then.

Best regards,

Maxime

> Kind regards,
> Andreas
> 
> On 2023-01-30 18:44, Maxime Chevallier wrote:
> > 
> > Introduce the libtraceevent library, that used to be bundled with
> > the trace-cmd tool. This library is now used by several tools and
> > libraries such as trace-cmd, libtracefs and rtla.
> > 
> > This package tries to install libraries in /usr/local/lib by
> > default, hence the redefinition of the "prefix" variable, so that
> > the library gets installed in "/usr/lib" instead.
> > 
> > The same applies to the pkgconfig handling of the proved Makefile, 
> > which
> > installs the .pc files in the /usr/local area by default, hence the
> > redefinition of the pkgconfig_dir to either the correct directory 
> > within the
> > staging area, or to empty value for the target to avoid installing
> > the .pc
> > in that case.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  DEVELOPERS                             |  3 +++
> >  package/Config.in                      |  1 +
> >  package/libtraceevent/Config.in        |  9 +++++++
> >  package/libtraceevent/libtraceevent.mk | 33
> > ++++++++++++++++++++++++++ 4 files changed, 46 insertions(+)
> >  create mode 100644 package/libtraceevent/Config.in
> >  create mode 100644 package/libtraceevent/libtraceevent.mk
> > 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 706ee80ece..fcf05e0aa0 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2106,6 +2106,9 @@ F:	package/postgresql/
> >  F:	package/protozero/
> >  F:	package/timescaledb/
> > 
> > +N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
> > +F:	package/libtraceevent/
> > +
> >  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
> >  F:	board/arcturus/
> >  F:	configs/arcturus_ucp1020_defconfig
> > diff --git a/package/Config.in b/package/Config.in
> > index 83fddf316f..2f0e6dcb18 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -117,6 +117,7 @@ menu "Debugging, profiling and benchmark"
> >  	source "package/kyua/Config.in"
> >  	source "package/latencytop/Config.in"
> >  	source "package/libbpf/Config.in"
> > +	source "package/libtraceevent/Config.in"
> >  	source "package/lmbench/Config.in"
> >  	source "package/lsof/Config.in"
> >  	source "package/ltp-testsuite/Config.in"
> > diff --git a/package/libtraceevent/Config.in 
> > b/package/libtraceevent/Config.in
> > new file mode 100644
> > index 0000000000..d351e3b4de
> > --- /dev/null
> > +++ b/package/libtraceevent/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_LIBTRACEEVENT
> > +	bool "libtraceevent"
> > +	help
> > +	  libtraceevent is a library that interfaces with the
> > ftrace
> > +	  subsystem in the linux kernel.
> > +	  It used to be bundled directly in the trace-cmd
> > +	  tool, but it was eventually extracted so that it can be
> > used
> > +	  by multiple other tools and libraries, such as
> > libtracefs and
> > +	  rtla.  

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
