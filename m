Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E72C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D844941048;
	Wed, 20 Jul 2022 21:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D844941048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XORrSONwJKPc; Wed, 20 Jul 2022 21:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC4C94103F;
	Wed, 20 Jul 2022 21:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC4C94103F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E420A1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF4FE60A8C
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4FE60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAtIMMj_OfDT for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:23:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78383612E0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78383612E0
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:23:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ADAA5240005;
 Wed, 20 Jul 2022 21:23:39 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:23:38 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220720232338.1eb2de3c@windsurf>
In-Reply-To: <20220627073306.2673751-1-james.hilliard1@gmail.com>
References: <20220627073306.2673751-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658352220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajjdMawMMfKSHBts5ivRJ0KD1a9i0m1aW1eIJ7lqaFk=;
 b=OMD5UTKlWkk8PBMDgsEyHjWIQpM6rNl3QRrQVXdzROVz789dIF5kdncx+lan43Hv7urKoU
 Ea3XjvZ9gA5ztqQB27fcROoV4BpROplYIjhhjd72h0GPCuK5YXfFfGmcMKUashf1L7Be9v
 K4aUKi4yN9OtXpq3SgSTc4NLQgqA/1z1Fym8rwTHWd1BEubO8YwfJjIkIGBELajJIjGHSs
 SD70zwUb0Zz4A0C1qfpMQcMCahwkqDkwUtIgdxF2hisQWyPyQa1Q/kvaepxtJLFVTg0/Ia
 JFNxn9UdQY+qrSbp33Dj8FXcbx0tQqqp1P0A13F+XWqbAwYU2+NzQpI/cyaVqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OMD5UTKl
Subject: Re: [Buildroot] [PATCH 1/1] package/{webkitgtk,
 wpewebkit}: select subenc for multimedia
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 27 Jun 2022 01:33:06 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> When using webkit with multimedia support the subenc element may
> be needed, as such we should select the subenc plugin.
> 
> Fixes runtime warning:
> isGStreamerPluginAvailable: Plugin subenc not found. Please check your GStreamer installation
> WebKit wasn't able to find a WebVTT encoder. Subtitles handling will be degraded unless gst-plugins-bad is installed.
> 
> See:
> https://github.com/WebKit/WebKit/blob/72b59ad50e079037073722bbdf469c0952e399fa/Source/WebCore/platform/graphics/gstreamer/TextCombinerGStreamer.cpp#L221
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/webkitgtk/Config.in | 1 +
>  package/wpewebkit/Config.in | 1 +
>  2 files changed, 2 insertions(+)

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
