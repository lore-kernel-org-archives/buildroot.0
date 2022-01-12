Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AE5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 08:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83FC940959;
	Wed, 12 Jan 2022 08:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWM1o2rYENS0; Wed, 12 Jan 2022 08:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6637F40969;
	Wed, 12 Jan 2022 08:11:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 190631BF2C7
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 08:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00EC36FB76
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 08:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNCNBBaZ87t4 for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 08:11:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4A826FB73
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 08:11:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CAF1D20003;
 Wed, 12 Jan 2022 08:10:59 +0000 (UTC)
Date: Wed, 12 Jan 2022 09:10:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220112091058.76318df8@windsurf>
In-Reply-To: <20220110211323.1828141-1-james.hilliard1@gmail.com>
References: <20220110211323.1828141-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 10 Jan 2022 14:13:23 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I am wondering if this update hasn't broken some meson packages:

 * polkit
   http://autobuild.buildroot.net/results/b2d/b2d2b27844b32b3609e11005966d85dc0dfb7a9f/build-end.log

   ../output-1/build/polkit-0.120/actions/meson.build:3:5: ERROR: Function does not take positional arguments.

 * host-gobject-introspection
   http://autobuild.buildroot.net/results/95e/95e4a23c16f6bd96566dc497663f38a0858c5a6e/build-end.log

   ../output-1/build/host-gobject-introspection-1.68.0/giscanner/meson.build:51:0: ERROR: File doctemplates does not exist.

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
