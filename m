Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D14C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98C414027A;
	Thu, 13 Jan 2022 19:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84Tjufwq5iJG; Thu, 13 Jan 2022 19:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D466141690;
	Thu, 13 Jan 2022 19:38:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB431BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9916B4027A
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIL_bd_O-0pY for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:37:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D40340202
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:37:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 94014100004;
 Thu, 13 Jan 2022 19:37:48 +0000 (UTC)
Date: Thu, 13 Jan 2022 20:37:47 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220113203747.0f423736@windsurf>
In-Reply-To: <20220113180940.232530-1-fontaine.fabrice@gmail.com>
References: <20220113180940.232530-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyalsa: fix musl build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Jan 2022 19:09:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure on musl raised since bump to version
> 2.0.0 in commit 3b9c8f8cb53e449e39899a40712703c272c5eeff:
> 
> In file included from ../src/pcm_hw.c:42:
> /home/peko/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sound/asound.h:444:18: error: field 'trigger_tstamp' has incomplete type
>   444 |  struct timespec trigger_tstamp; /* time when stream was started/stopped/paused */
>       |                  ^~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a75e23dc585bd071f4d65face5489ed6ac22edbe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-include-time.h-before-asound.h.patch | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 package/tinyalsa/0001-include-time.h-before-asound.h.patch

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
