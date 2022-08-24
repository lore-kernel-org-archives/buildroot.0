Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABB7C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 10:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6731B4093F;
	Wed, 24 Aug 2022 10:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6731B4093F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDCtC32XnoFH; Wed, 24 Aug 2022 10:14:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A3C404A3;
	Wed, 24 Aug 2022 10:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A3C404A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED58E1BF592
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2AB06074C
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2AB06074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuRbJ_SL22yC for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 10:14:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A12860601
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A12860601
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 10:14:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D44A240009;
 Wed, 24 Aug 2022 10:14:00 +0000 (UTC)
Date: Wed, 24 Aug 2022 12:13:58 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220824121358.4650be85@windsurf>
In-Reply-To: <20220809132730.232111-1-romain.naour@smile.fr>
References: <20220809132730.232111-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661336040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbUkdFoonmluHqwE7+yBf4NGYqPmiMeKAMxPnq4sDgE=;
 b=KGfRoV+xnXr3UcftVE3SBJVs3P5myp0MLohEBSGr0/ROiYSRGvv3qf4YiOkG6VPNh95bFw
 aLm2AgUd5PnOaVBMYM71YIIM7+sLkH8win1DpNOR0f7zTQdK/sf0vl3GMNqtV357igSBTi
 724fMOljNDJ1TcY9wwXClNTjOgR+P3AUuEY3voGi5tPiKoAEAIzkcn2N30voT951plwup3
 POQBUbmfTtSnMq01oQvIb1/lzjHfgdTl1Qk/TNUMjs3fWKnsP/wD7CNQjArFSj5+rBUJ0p
 LDHt800FSFKC4sDl5hQUAtMvrBkv9e4wVSzSK5C+/rRcPJzqFLt0Pbl0m1WGVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KGfRoV+x
Subject: Re: [Buildroot] [PATCH 1/2] package/phython-libevdev: new package
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

On Tue,  9 Aug 2022 15:27:29 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> python-libevdev is needed for libinput replay command:
> 
> $ libinput replay recording.yml
> Error: No module named 'libevdev'
> One or more python modules are missing. Please install those modules and re-run this tool.
> 
> Indeed only libinput-replay tool is a python script
> (like libinput-analyze-recording, libinput-measure-fuzz...)
> 
> phython-libevdev itself requires a kernel built with
> CONFIG_INPUT_UINPUT option enabled, enable this option
> if a kernel is built by Buildroot.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-libevdev/Config.in            |  7 +++++++
>  package/python-libevdev/python-libevdev.hash |  5 +++++
>  package/python-libevdev/python-libevdev.mk   | 20 ++++++++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/python-libevdev/Config.in
>  create mode 100644 package/python-libevdev/python-libevdev.hash
>  create mode 100644 package/python-libevdev/python-libevdev.mk

So, I have applied both patches, but I had to split things up:

 * From PATCH 2/2, I took the removal of the Python tools, made it
   unconditional, and applied that to master.

 * In next, I cherry-picked the patch from master that unconditionally
   removes Python tools of libinput, then applied the python-libevdev
   patch, then applied a patch that adds the libinput option for Python
   tools.

This way, we have the fix in master (removal of Python tools) and the
new feature in next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
