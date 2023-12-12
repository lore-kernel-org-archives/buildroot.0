Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F28C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D2B41926;
	Tue, 12 Dec 2023 21:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D2B41926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C51p76NiQl9U; Tue, 12 Dec 2023 21:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95CA341B19;
	Tue, 12 Dec 2023 21:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CA341B19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7D01BF2FD
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 21:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E924C60BB0
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 21:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E924C60BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XA4Po9u67SDz for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 21:56:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A263F60B0E
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 21:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A263F60B0E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74B3240006;
 Tue, 12 Dec 2023 21:56:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rDAk3-009hVc-2O;
 Tue, 12 Dec 2023 22:56:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231211164530.1914335-1-peter@korsgaard.com>
Date: Tue, 12 Dec 2023 22:56:39 +0100
In-Reply-To: <20231211164530.1914335-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 11 Dec 2023 17:45:29 +0100")
Message-ID: <87tton3x0o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/xwayland: libdrm is required,
 not optional
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/476/47665d417dbae76bf27e805a5bcb1d8d6ab1f445/

 > xwayland unconditionally includes xf86drm.h, so libdrm is required and not
 > optional:

 > grep -rs xf86drm.h
 > glamor/glamor_egl.c:#include <xf86drm.h>
 > hw/xwayland/xwayland-glamor.h:#include <xf86drm.h>
 > hw/xwayland/xwayland-glamor-eglstream.c:#include <xf86drm.h>
 > hw/xwayland/xwayland-window.h:#include <xf86drm.h>
 > hw/xwayland/xwayland-drm-lease.c:#include <xf86drm.h>
 > hw/xwayland/xwayland-glamor-gbm.c:#include <xf86drm.h>

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
