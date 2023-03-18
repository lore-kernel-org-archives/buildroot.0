Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713A7C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 22:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C3281FE4;
	Sat, 18 Mar 2023 22:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C3281FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQGvsihkqwSp; Sat, 18 Mar 2023 22:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6522D81FFF;
	Sat, 18 Mar 2023 22:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6522D81FFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC291BF2FF
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1103860E19
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1103860E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjAsha0hMw5D for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 22:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C765760BEA
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C765760BEA
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 22:05:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 631A2240002;
 Sat, 18 Mar 2023 22:05:20 +0000 (UTC)
Date: Sat, 18 Mar 2023 23:05:19 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230318230519.4ba6d422@windsurf>
In-Reply-To: <20230317202724.79207-2-ju.o@free.fr>
References: <20230317202724.79207-1-ju.o@free.fr>
 <20230317202724.79207-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679177121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGseepax7VlNFGcR/VU5rEO5M6fPk0dnGvXnKkGN86U=;
 b=DcMPC8nBxSCmsTdQtPr4uxSdd21++V/scTUwXLT/+U05wRwG1hNusQs04aYHqmATI7XXer
 ZQ8EXlQ58P5Dg8/RXKElaixOMUbfEtjE7hZYO7v8IBd8eyz/JfVYAteSR15diYp8v++azH
 nMn1m3cLGaci8JsFj4gi+5HSFgrOh2DsWe5Z+SyK5tA4AU+a3Y2TYo5mLyEz1HPavIk1gW
 lW6YlQRlopuTeFgBqN6rKgQLx9c2+r1RtLVoOAyKklrl6IODKnMS/jSNvJlqGd8Dk19aww
 ebbAmNOz8gsoy2hBU/Xg3XP5C+c9BkCZEyYgv5eXxCKLmr5pYELpgM/OTSCLzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DcMPC8nB
Subject: Re: [Buildroot] [PATCH 2/3] package/linux-tools/S10hyperv: fix
 shellcheck warnings
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 17 Mar 2023 21:27:23 +0100
Julien Olivain <ju.o@free.fr> wrote:

> When running "make check-package" on a system with shellcheck 0.9.0,
> the command fails with output:
> 
>     make check-package
>     package/linux-tools/S10hyperv:0: run 'shellcheck' and fix the warnings
>     ...
>     2 warnings generated
> 
> This commit fixes the warnings reported by the command:
> 
>     shellcheck package/linux-tools/S10hyperv
> 
> This commit also fixes the four-space indent by a single tab on the
> changed lines. Since this fixes the indentation warnings of
> check-package, the Indent exclusion in .checkpackageignore is also
> removed.
> 
> Fixes:
> 
>     In package/linux-tools/S10hyperv line 27:
>         return $ret
>                ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.
> 
>     In package/linux-tools/S10hyperv line 48:
>         return $ret
>                ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore           | 2 +-
>  package/linux-tools/S10hyperv | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
