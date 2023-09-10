Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410E4C71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 19:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E909960D7B;
	Sun, 10 Sep 2023 19:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E909960D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvTJ2FRcOvUZ; Sun, 10 Sep 2023 19:07:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3442860BD7;
	Sun, 10 Sep 2023 19:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3442860BD7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06B321BF350
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDA9660BA9
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA9660BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leKKxmUuoUSi for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 19:07:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3822160BD7
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 19:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3822160BD7
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2762C0003;
 Sun, 10 Sep 2023 19:07:27 +0000 (UTC)
Date: Sun, 10 Sep 2023 21:07:27 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230910210727.1bbe5aac@windsurf>
In-Reply-To: <20230903122831.7800-1-ju.o@free.fr>
References: <20230903122831.7800-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694372848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bqmCoX/kNBu+weUoMayRfCTO+Bb0gap4EIB4cQPWexg=;
 b=fro0xgOXi0dsF8ubDIYdqTv8s4ZLo4G2fLKfjaHjQNIR6BS+jKz0FmKFCwDiqJ9ZOiFBpP
 THKDZuuRXO03tpGokCSTIAmDsbUyTsT431umeOdfMZmwr8x3lewhPxdB550MjelsgsBvBO
 XK+EkDWwatNDuZ2XywG8RFB04/YpsTvtZZPueslvIGGELSuzcN/0eqSxM1aoF/r/vQenz4
 dyLzTwNTXP6hSL1X61MrSkJQqa0fjTUxdl7YYctjbTF94uhox4EdRzqHGapcFyHSKr3ay3
 4tmJdAUJ6JZRfDiCVBps0nbFC5hibKQJZvwKmAYuOkEvcVicRVX8KJ9Rc27vjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fro0xgOX
Subject: Re: [Buildroot] [PATCH next 1/2] package/libgpgme: bump to version
 1.21.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  3 Sep 2023 14:28:30 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see [1] and [2].
> 
> This commit also drops the package patch, as an alternate upstream
> commit is included in release. See [3]. The option "--disable-cpp-test"
> is removed from _CONF_OPTS since it no longer needed.
> 
> The file .checkpackageignore is also updated to reflect the patch
> removal.
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=log;h=gpgme-1.21.0
> [2] https://dev.gnupg.org/T6585
> [3] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=e2103be390764f62b21a4e5d4fa90a7b78326787
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                           |  1 -
>  .../0001-Fix-build-without-threads.patch      | 59 -------------------
>  package/libgpgme/libgpgme.hash                |  4 +-
>  package/libgpgme/libgpgme.mk                  |  3 +-
>  4 files changed, 3 insertions(+), 64 deletions(-)
>  delete mode 100644 package/libgpgme/0001-Fix-build-without-threads.patch

You forgot to drop AUTORECONF = YES as part of this, as we're no longer
patching configure.ac. I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
