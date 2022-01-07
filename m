Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D184C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0928281458;
	Fri,  7 Jan 2022 18:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbATBqXI6rn6; Fri,  7 Jan 2022 18:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5893981467;
	Fri,  7 Jan 2022 18:16:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 092911BF291
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBBC960ACC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCGprhslUQdG for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:16:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC8A360A98
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:16:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 92BB0200006;
 Fri,  7 Jan 2022 18:16:06 +0000 (UTC)
Date: Fri, 7 Jan 2022 19:16:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220107191605.78f71e6c@windsurf>
In-Reply-To: <20220102210408.221439-1-giulio.benetti@benettiengineering.com>
References: <20220102210408.221439-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/binutils: add patches to fix
 binutils bug 28735(or1k)
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  2 Jan 2022 22:04:07 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> After fixing binutils bug 21464, bug 28735 showed up. It got fixed very
> soon after my request:
> https://sourceware.org/pipermail/binutils/2022-January/119078.html
> 
> So let's add patch and backported patches to all binutils versions to make
> Buildroot free from bug 28735. Unfortunately Bootlin toolchains have just
> been rebuilt and will fail for this bug. This happened because libgeos
> has been bumped few time ago and was masked by bug 21464 dependency that
> prevented to build.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...K_GOT16-signed-overflow-by-using-spe.patch | 75 +++++++++++++++++++
>  ...K_GOT16-signed-overflow-by-using-spe.patch | 75 +++++++++++++++++++
>  ...K_GOT16-signed-overflow-by-using-spe.patch | 75 +++++++++++++++++++
>  ...K_GOT16-signed-overflow-by-using-spe.patch | 75 +++++++++++++++++++
>  4 files changed, 300 insertions(+)
>  create mode 100644 package/binutils/2.32/0016-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
>  create mode 100644 package/binutils/2.35.2/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
>  create mode 100644 package/binutils/2.36.1/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
>  create mode 100644 package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
