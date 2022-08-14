Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AF7C25B0D
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC66840383;
	Sun, 14 Aug 2022 10:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC66840383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWGhC3zEON3Z; Sun, 14 Aug 2022 10:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B9704024B;
	Sun, 14 Aug 2022 10:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B9704024B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD3F1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D97BF60A8A
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D97BF60A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VmBo6NxAdgu for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:27:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3204E608B7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3204E608B7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:27:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C8801BF203;
 Sun, 14 Aug 2022 10:27:31 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:27:30 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814122730.46636be6@windsurf>
In-Reply-To: <20220812132144.104301-1-fontaine.fabrice@gmail.com>
References: <20220812132144.104301-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660472851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvtlU0x3BGkcWJIwbiU6FIPXWznjn/34s3wE7nQdaG4=;
 b=hSKkn8Ys8twRgMn0aaf/bPyPhh0BF0Xduc7VP9QXIGxiPZIOQWDsiKlA4Lptj6/aDkEOVW
 XGGsggIU9PbLOGjUJ+/piMxLaZ9oATlR2tWC2R3op3FKt5qWOFmpYHept1w2/rAowPiXBr
 j44yx1IbiZAC6kQjS1B+egF1imYtj1bZYTqfFTp0KXnM8dElCdCzeYUqiWgNlqkLSL4wZv
 e3+GCZ/bKPgHzUIUjemRCdW1aTLKdI8Ksd+zrDzK5yHQSaUlEGodb2VuZ0fE3VVcl8Du6g
 miAfqpXP9eRTbtLm7Q0jlq5kHg/jlOhEKwXrGkFs3I+zbU4hD4yfks6qJJ1cmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hSKkn8Ys
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: needs dynamic
 library
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

Hello Fabrice,

On Fri, 12 Aug 2022 15:21:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> alsa-utils needs dynamic library since bump to version 1.2.7 in commit
> 4dc8563363d639255217ffc59482eaccf93a1b51 and
> https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:
> 
> pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
>    28 | #include <dlfcn.h>
>       |          ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I think alsa-utils could potentially be useful even in small systems
that require static linking, so it's perhaps worth implementing a
slightly better solution.

<dlfcn.h> is only used in topology/, i.e. when configure.ac detects
that topology.h is installed by alsa-lib. What about adding an
AC_CHECK_HEADERS([dlfcn.h]) ?

Something like this:

diff --git a/configure.ac b/configure.ac
index 20cbb68..c1592b6 100644
--- a/configure.ac
+++ b/configure.ac
@@ -27,6 +27,8 @@ AC_CHECK_FUNC([snd_ctl_elem_add_enumerated],
              , [AC_ERROR([No user enum control support in alsa-lib])])
 fi
 
+AC_CHECK_HEADERS([dlfcn.h])
+
 dnl Check components
 AC_CHECK_HEADERS([alsa/pcm.h], [have_pcm="yes"], [have_pcm="no"],
   [#include <alsa/asoundlib.h>])
@@ -74,7 +76,7 @@ AM_CONDITIONAL(HAVE_MIXER, test "$have_mixer" = "yes")
 AM_CONDITIONAL(HAVE_RAWMIDI, test "$have_rawmidi" = "yes")
 AM_CONDITIONAL(HAVE_SEQ, test "$have_seq" = "yes")
 AM_CONDITIONAL(HAVE_UCM, test "$have_ucm" = "yes")
-AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes")
+AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes" -a "$ac_cv_header_dlfcn_h" = "yes")
 AM_CONDITIONAL(HAVE_SAMPLERATE, test "$have_samplerate" = "yes")
 AM_CONDITIONAL(HAVE_FFADO, test "$have_ffado" = "yes")
 

Of course, we would need BR2_PACKAGE_ALSA_UTILS_ALSATPLG to have a
dependency on !BR2_STATIC_LIBS.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
