Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B60C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5EDD41055;
	Tue, 26 Jul 2022 08:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5EDD41055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPPiF6-Unert; Tue, 26 Jul 2022 08:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D151940519;
	Tue, 26 Jul 2022 08:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D151940519
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 385C51BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1295083FC5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1295083FC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kSaGfJ3U59P for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:57:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B34F83FC4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B34F83FC4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:57:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1BAA51C0011;
 Tue, 26 Jul 2022 08:57:52 +0000 (UTC)
Date: Tue, 26 Jul 2022 10:57:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220726105752.2bd8e399@windsurf>
In-Reply-To: <20220726065959.1185364-1-fontaine.fabrice@gmail.com>
References: <20220726065959.1185364-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658825873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4a95D382Melh50UmecxufOE+Yo9TNdTLeyvNiGGYqk=;
 b=mtDcedbMCp02aaoI4TBv7lgcoYtAjMLAzWsnrZXPP5iuEo7a1ziNjvZY22VjPld9A4ebBa
 kSB3Za0MEus/HbYiQuF363c9GYs7+lil/dssrV+Fhy+XwdrRN332avIIPnJOKpPx6mmk5e
 qaEWr+smiohEGYFnGpqnul+rM13rL8p49uQmimxEBCC78aqYiqmimfxb9cFYTOTiEKzyai
 6IJYIcmJaot+zEl3HqEMAsVp3Lgn2SuByZOhBLAfC09YpTDSKMN1Rty8umMSZxEQ8VOt6V
 0kmTDRs04n/GTrfYEhSP5g3Eh96JPDxfNCQqyqIfzT2l/rCO1O9TCHyrI7+L4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mtDcedbM
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: fix build without
 C++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 08:59:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without C++ raised since bump to version
> 16.1 in commit 6f3131296484767f037d3535ab69f328e94351db:
> 
> ../output-1/build/pulseaudio-16.1/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++']]
> The following exception(s) were encountered:
> Running "/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++'"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6526a21bd4da3b8458188f27c1ec04c381e4b673
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0004-meson.build-fix-build-without-C.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/pulseaudio/0004-meson.build-fix-build-without-C.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
