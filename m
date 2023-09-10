Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9434FEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 19:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45C9D60BDD;
	Sun, 10 Sep 2023 19:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C9D60BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vp55Y4XZbv6i; Sun, 10 Sep 2023 19:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92CEA60BD7;
	Sun, 10 Sep 2023 19:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92CEA60BD7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3360C1BF350
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09A8840955
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A8840955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2f95mOL0ww01 for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 19:07:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA89B40951
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 19:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA89B40951
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9069FF802;
 Sun, 10 Sep 2023 19:07:30 +0000 (UTC)
Date: Sun, 10 Sep 2023 21:07:29 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230910210729.5b2189f9@windsurf>
In-Reply-To: <20230903122831.7800-2-ju.o@free.fr>
References: <20230903122831.7800-1-ju.o@free.fr>
 <20230903122831.7800-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694372851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eo8nA4ud4xLDsuSg26e+SE4kpqaMRBfTC5ali0GW2ZQ=;
 b=KmoWTc9Gk9NovIJoRAlIAMaUiGIUu9aHLJpQbc60nhD6Bf30BlL/CkMMlK4p+bK2ZU1mo6
 BYkPdyXUx5OEgFPfACWRgV7yjR3nfz5Sje4yaIBIs/fKsS3KDLBTePavBvKcgXoAt6ny/X
 Llz616mjy5GIVkjVdF1xxwM+W/bj82yGIpZq9udRSx6cfGNMM4YX0WrEHSioWXxPC4a9ps
 DZ6S7LbHyGx5bKjg84UTJHi43S22ZmfhN0Uh6haTRJB2WI8PcEzTna3iuDGZaKgNnY9+9k
 xeEvvjrCZtN0CcQbUV5ixA7Qxjk07NVusmr44doMrgw54hlWk1JLLrSedpcuuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KmoWTc9G
Subject: Re: [Buildroot] [PATCH next 2/2] package/libgpgme: bump to version
 1.22.0
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

On Sun,  3 Sep 2023 14:28:31 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see [1] and [2].
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=log;h=gpgme-1.22.0
> [2] https://dev.gnupg.org/T6668
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Series tested on branch next at commit 3fa1ae0 with commands,
> in Docker image:

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
