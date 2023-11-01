Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E2C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7934C83F09;
	Wed,  1 Nov 2023 11:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7934C83F09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SiGj3gQ9dL9o; Wed,  1 Nov 2023 11:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F15EB84863;
	Wed,  1 Nov 2023 11:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F15EB84863
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 839071BF2F4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39CA17037E
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39CA17037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TylUl5j88lcE for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:03:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E282970379
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E282970379
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0322DC0002;
 Wed,  1 Nov 2023 11:03:25 +0000 (UTC)
Date: Wed, 1 Nov 2023 12:03:24 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20231101120324.23133401@windsurf>
In-Reply-To: <20231030101115.2214402-2-aperez@igalia.com>
References: <20231030101115.2214402-1-aperez@igalia.com>
 <20231030101115.2214402-2-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698836606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRVTKfabrtZ3TRkusYobDKIMG7iCVFs6C+QkMXbZ3wM=;
 b=lXYA5VKrcVP9H2s6Pmz7o9LtJq4BYa8SQhNWonVTi4kbYJIiY1cwB/4jS9ThXjIEojEu85
 VzBKZ16+KNS+SgfXafHAgie4di36E5y7lgfKv2dE3+3BkMWSFePbnDU6fc84nQVgTGYztg
 bNVQbv6xN/Vk7BjifMPLzAf64N5pPduGvp9cJY/qwJ+8RgmiccmerIixgIK7U2db8KVf76
 gNEB9dY4FZtGLCw/Az01jFkyEVNlFioPKayxDgjSrf84U2s7U5CzFBllgVRNvItPcC3/+0
 u5gSj4Mcsq3vhRBg0RHysGoYQSp9EWYgYpm93eK5c8lGTf6qWxbBJ0Oiy9PZSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lXYA5VKr
Subject: Re: [Buildroot] [PATCH 1/3] package/wlroots: bump to version 0.16.2
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Waldemar as there is a uClibc-specific issue below. Also adding Paul
Cercueil who originally wrote the patch.

On Mon, 30 Oct 2023 12:11:05 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Update to version 0.16.2, which brings in support for a few new Wayland
> protocols, and improved input device and scene graph APIs. Applications
> which use wlroots might need to be adapted, and at least rebuilt. The
> only packages in Buildroot which use wlroots at the moment are the Cage
> and Sway compositors, to be updated in follow-up patches.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wlroots/wlroots.hash | 4 ++--
>  package/wlroots/wlroots.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I have applied to master. However, the patch
package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch is a bit
annoying because it has been rejected upstream.

The patch currently points to
https://github.com/swaywm/wlroots/pull/2493 which in fact has been
migrated to
https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/2493.
And this concludes with "Closing because we don't want these
workarounds upstream.".

So I think we should either find a better solution to this issue, or
drop the patch and make wlroots unavailable with uClibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
