Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C4EC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B6DF40BE2;
	Wed,  8 Feb 2023 14:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B6DF40BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1Tz-F1jTw86; Wed,  8 Feb 2023 14:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47DE2405F4;
	Wed,  8 Feb 2023 14:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47DE2405F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83EF51BF395
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5560160E14
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5560160E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKfM7JOollBz for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2872960C06
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2872960C06
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:23:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E9E640008;
 Wed,  8 Feb 2023 14:23:44 +0000 (UTC)
Date: Wed, 8 Feb 2023 15:23:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230208152343.20d46c7d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675866224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m5rqulqGsA+gWXJe30cO6fxbkk70SYOcLN85vsUIk24=;
 b=P1WA5g5x6LiR6FjAjr2lIrtcTWD4j+O5P33iwoO+YvutERxII5n7QtDBsjVYOeNpomJ0Ms
 ryr6PisEBbr1lTtKJmHPqSuDgOcN0Md9ol9eAmo3dkZCc71WcGrx4s7K2b6oqENnHBGW6f
 aidE6XRb8izw25ylemZnLbJeqmbH9elfxhFGD8G57TT6hnaCS7mI/qDiSGGuMB2YW9Pn4e
 M3RXRaiYuSTQh30gdMApVb7RRSLlXpPV3BZsi9Znvj0oEsXJxxNJa5WVz3LVhIi3pvaWU3
 ZTIaxJtsdF2Aeebe185t1x3ROYCl584BbC5wnGevrLolAuEOxx3ytFuFQWAyAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P1WA5g5x
Subject: [Buildroot] Remove cairo dependency from gobject-introspection
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

Here at the Buildroot Developers Meeting, we ended up looking at where
util-linux-libs gets used, and we found out it's used in fontconfig.
Since util-linux-libs was originally introduced to break a circular
dependency involving systemd and util-linux, we found it strange that
fontconfig was involved in that.

Turns out that there is a possible circular dependency like this:

 util-linux -> udev -> systemd -> polkit -> gobject-introspection -> cairo -> fontconfig -> util-linux

What is obviously strange in there is the dependency of
gobject-introspection on cairo, which comes from:

ifeq ($(BR2_PACKAGE_CAIRO),y)
GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=enabled
else
GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=disabled
endif

However, according to gobject-introspection's meson_options.txt:

option('cairo', type: 'feature', value : 'auto',
  description: 'Use cairo for tests'
)

it seems like cairo is only used for tests, which we really don't care
about.

If that's indeed true, do you think you could drop that optional
dependency in gobject-instrospection, pass -Dcairo=disabled
unconditionally, and cleanup fontconfig to not need util-linux-libs
(see commit eb058222596d83bbdc96c80c5d0cdecb572a4ac3) ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
