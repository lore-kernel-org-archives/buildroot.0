Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0865EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7EF0408B3;
	Sun,  5 Jun 2022 20:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3OSM27ll-Mp; Sun,  5 Jun 2022 20:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91646408A9;
	Sun,  5 Jun 2022 20:21:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BA911BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49EB460AE6
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjTHPyOzzgxC for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:21:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C546460B8B
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:21:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B525F40002;
 Sun,  5 Jun 2022 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654460499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lo5o672kIDc6SXujtt2AKa4/b0exuUwItbY7iNTPLtQ=;
 b=lORQkFUCTA5m3VCdUnN+HzXz2oXpwNZxstEVARuxbnaoaPdrr+lAgE2y13YjBD9bBtDFmr
 hAPM4wpDEihqysBuqX0JGJV8cZkKGogDTIzGQKE1sY9RXhjKqc4ehQ5hDHBic+2yQraTrr
 6vjXfMwT3kSRikOujjWAK88sSSvyGyiozNA0t5FNwl6rLLqT2KBEyt1Js+INAszC9WSA95
 fFIHpfHewS3Od35+OmFRfdd+gmHuBk7h1F7Hup2b7uLJuDDAc6vMU015lLEMR4lepW5FrK
 TwwuMEet6/M8m8WQpZXSVVDzLKNJmlyGkE4Sz+K6SlZlUblKQvs50z03i2Ch3A==
Date: Sun, 5 Jun 2022 22:21:37 +0200
To: Koen Martens <gmc@sonologic.nl>
Message-ID: <20220605222133.4e8364c7@windsurf>
In-Reply-To: <20220605160902.GA1283120@coltrane>
References: <20220605160902.GA1283120@coltrane>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/linuxconsoletools: bump version
 to 1.8.1
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

On Sun, 5 Jun 2022 18:09:02 +0200
Koen Martens <gmc@sonologic.nl> wrote:

> Upstream has released a new version. In this version, they
> have chosen to copy the conditional compilation of tools,
> however they have chosen to use DISABLE_* flags instead
> of ENABLE_* flags. Therefore, the logic in our .mk file
> has been reversed: when an option is *NOT* selected, we
> set the corresponding DISABLE_* flag.
> 
> As a corollary, the patch to add conditional compilation
> in the upstream Makefile is no longer needed and is
> removed in this commit.
> 
> Tested compilation by running `./utils/test-pkg -a` with
> a configuration that enables all options tools.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
> Tested-by: Koen Martens <gmc@sonologic.nl>
> ---
>  .../0001-conditional-build.patch              | 58 -------------------
>  .../linuxconsoletools/linuxconsoletools.hash  |  2 +-
>  .../linuxconsoletools/linuxconsoletools.mk    | 18 +++---
>  3 files changed, 10 insertions(+), 68 deletions(-)
>  delete mode 100644 package/linuxconsoletools/0001-conditional-build.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
