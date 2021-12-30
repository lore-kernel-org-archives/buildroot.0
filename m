Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E52C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 022F760C26;
	Thu, 30 Dec 2021 22:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LI06Mv7l0d-L; Thu, 30 Dec 2021 22:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E2A60C24;
	Thu, 30 Dec 2021 22:39:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 368FB1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25E7E60C24
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbsujUUxG9pq for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:39:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F1F860C1C
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:39:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DE5B01BF203;
 Thu, 30 Dec 2021 22:39:18 +0000 (UTC)
Date: Thu, 30 Dec 2021 23:39:17 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211230233917.0d4e7fd6@windsurf>
In-Reply-To: <20211230221904.3064022-1-fontaine.fabrice@gmail.com>
References: <20211230221904.3064022-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/efl: handle input option
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 23:19:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 2d7a3e48c574c05346b66f79cdb75ecdfa7f074e forgot to manage input
> option on target which was added (and enabled by default) by
> https://git.enlightenment.org/core/efl.git/commit/?id=0c2cf7e1bf7ca547655d25aaea30d081101b42be
> resulting in the following build failure when eeze is disabled:
> 
> ../output-1/build/efl-1.26.0/src/lib/elput/meson.build:1:0: ERROR: Unknown variable "eeze".
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4a840c54bad9748b5748738378a0352d02de1f7e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/efl/Config.in | 13 +++++++++++++
>  package/efl/efl.mk    |  7 +++++++
>  2 files changed, 20 insertions(+)

This looks good to me, I'll wait for a Review/Ack from Romain to be sure.

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
