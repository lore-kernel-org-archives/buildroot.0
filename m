Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546AEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:30:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C778E60F70
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C778E60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F0F607E2;
	Sun, 31 Oct 2021 17:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8vLYhsBN1iz; Sun, 31 Oct 2021 17:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4488607B1;
	Sun, 31 Oct 2021 17:30:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2961F1BF39F
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1949E607B1
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z_jUWtO4oHFi for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:30:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F2C66067D
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:30:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4400020000A;
 Sun, 31 Oct 2021 17:30:35 +0000 (UTC)
Date: Sun, 31 Oct 2021 18:29:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211031182959.7bacc08e@windsurf>
In-Reply-To: <20211030214931.20139-1-peter@korsgaard.com>
References: <20211030214931.20139-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/openblocks_a6_defconfig: bump
 linux kernel to 4.14.253
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

On Sat, 30 Oct 2021 23:49:29 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=88f7a6aa7fb9aa5076b65489146045dac865f1d3
> 
> To correct a build breakage after the move to a gcc 10.x based host
> compiler, as the updated kernel contains a fix for:
> 
> HOSTLD  scripts/dtc/dtc
> /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=88f7a6aa7fb9aa5076b65489146045dac865f1d3
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/openblocks_a6_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
