Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC52C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9621184CC0;
	Thu, 13 Jan 2022 19:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wW7PCisPGRSq; Thu, 13 Jan 2022 19:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 051BB84CD8;
	Thu, 13 Jan 2022 19:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC151BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E12A4162F
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2xnTdnIBx0j for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:39:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DD7D40891
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:39:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 88B4E100004;
 Thu, 13 Jan 2022 19:39:00 +0000 (UTC)
Date: Thu, 13 Jan 2022 20:38:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220113203859.763aee2f@windsurf>
In-Reply-To: <20220112202640.7064-1-ju.o@free.fr>
References: <20220112202640.7064-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] board/spike/riscv64/start.sh: add
 buildroot host dir in PATH
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

On Wed, 12 Jan 2022 21:26:40 +0100
Julien Olivain <ju.o@free.fr> wrote:

> commit 0d0f84d2004b04bc93d5ceb58c86640f190e5d78
> added the missing host-dtc dependency to riscv-isa-sim.
> 
> The spike simulator calls the dtc binary at its startup. The host dtc
> command needs to be in the PATH at that time.
> 
> This commit add the buildroot host binary directory into the PATH of the
> start.sh helper script. It make sure spike will use the buildroot dtc
> version. This commit fixes this start.sh script on host not providing
> the dtc command. Since the "spike" binary is now in the PATH, the
> binary name is also simplified.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  board/spike/riscv64/start.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

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
