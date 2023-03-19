Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307BEC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 17:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6752460A47;
	Sun, 19 Mar 2023 17:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6752460A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fntd-vOtPc0n; Sun, 19 Mar 2023 17:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83BE660F96;
	Sun, 19 Mar 2023 17:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83BE660F96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA191BF401
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 17:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72E0540385
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 17:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72E0540385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYJbKYSaNgEy for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 17:49:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 166B74025D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 166B74025D
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 17:49:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4E94E0005;
 Sun, 19 Mar 2023 17:49:09 +0000 (UTC)
Date: Sun, 19 Mar 2023 18:49:08 +0100
To: Steve Hay via buildroot <buildroot@buildroot.org>
Message-ID: <20230319184908.611f579a@windsurf>
In-Reply-To: <20230319142213.3045818-1-me@stevenhay.com>
References: <20230319142213.3045818-1-me@stevenhay.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679248150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MadR6rHQ20DOI4CI/TMySZap3UdGzhyZf178/qA5Nq8=;
 b=Sz57SZp1nkFTcYrCipPKNFrHgsJecYULcbMoy9Ujo5RisB0Sy5ch1fyCfpJu0LmhyakAiV
 ifjqXXtHMAZpjbV39bCSwxxkLTc/q4YzA9qh8i44vNGPjzK6i0kiCcHzRHtDIEFAyr90Ko
 WD9ILa+Q17O7MS1HaQtJ96fsk4TiokHz3N7Zkd5x98C0WZcF69uBS9GfIw6cQhpJ4fk10m
 wkEMD+QB21bXuujlOZf6qrAHZoWr3yTD5XfSF7HINMkxCqBHadcy3lrVxPiNwjWF4Ar/Yq
 YLv4j03qcRhSm2eu2ZcVWzqcGD8GuCYsYFXKW4Kyo4IWjKnYOt1376BNw93lpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sz57SZp1
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
Cc: Martin Bark <martin@barkynet.com>, Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Mar 2023 15:22:12 +0100
Steve Hay via buildroot <buildroot@buildroot.org> wrote:

> The impetus for this change was that wget fails to load pages signed by
> Let's Encrypt due to missing root certs. This version has the updated and
> correct certs.
> 
> 0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
> 
> Patch dropped because the fix is incorporated upstream.
> 
> Signed-off-by: Steve Hay <me@stevenhay.com>
> 
> ---
> Changes v1 -> v2
>     - Removed the extraneous comment in the make file.
>     - Fixed patch header.
>     - Added note to the log as to why the patch was dropped.

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
