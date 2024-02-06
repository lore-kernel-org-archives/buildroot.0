Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF39AC4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8481941E73;
	Tue,  6 Feb 2024 10:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8481941E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Sudq-wfTiE6; Tue,  6 Feb 2024 10:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80B141E98;
	Tue,  6 Feb 2024 10:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80B141E98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5751BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 010CC610B8
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 010CC610B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOcRgCFbfNKu for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:27:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0500E60BC4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0500E60BC4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 640A5FF808;
 Tue,  6 Feb 2024 10:27:09 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:27:08 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206112708.0253821d@windsurf>
In-Reply-To: <20240109070135.4001715-1-james.hilliard1@gmail.com>
References: <20240109070135.4001715-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5gx8NpEs3MeX+MYjtkZMrSO+bFAcawL6Jh0BvzbHUo=;
 b=fa0ig9eBBiy959BXqU48roS3jw/BAuXkq5Gx519M7yYIkohF/lpkRntFeEbHo0xf9kpIgm
 +TLaJK7aJoNkIxxLTpYdFmKhjWyR0TItpvQXT9JHioT9aQU2xOpdV0wImzp0vRARINGhUl
 Xz0ZD07gHDFAwmhWeIv+U2ELPnvFDoPcmLp/SGPgw0Bq9jEGbYFl+BP/1TGsQ0ys/3In4o
 Z0rqYDuxyxn8/oU8wu8zxnCu42tCxFu6otazEyFl9TajPFhjmsd11gaDZX05YLQQD8gLUf
 GfOaWhBfpyYIGmxo5DYSXAkMvsoYtpj7ubWzP9oWYJwdDFaGwDgTTH/eceF0Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fa0ig9eB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-distro: bump to version
 1.9.0
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 00:01:35 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-distro/python-distro.hash | 8 ++++----
>  package/python-distro/python-distro.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
