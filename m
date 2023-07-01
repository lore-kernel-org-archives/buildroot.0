Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA243EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 13:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51E9581E2C;
	Sat,  1 Jul 2023 13:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E9581E2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oWccRBHAffp; Sat,  1 Jul 2023 13:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9048481DE6;
	Sat,  1 Jul 2023 13:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9048481DE6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA4441BF616
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 13:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3C7260D52
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 13:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3C7260D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9H8nKl0kkSpY for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 13:25:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C4160B89
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99C4160B89
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 13:25:28 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A740240008;
 Sat,  1 Jul 2023 13:24:21 +0000 (UTC)
Date: Sat, 1 Jul 2023 15:24:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701152421.79262a49@windsurf>
In-Reply-To: <20230628150309.544293-1-bernd@kuhls.net>
References: <20230628150309.544293-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688217923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdmkb4BN4xMropkPQzowE4fF0jMTtlj6FcJ2MKHwuLo=;
 b=M2APCsTbuGM3VQdNBCzFuXjWowddEgFkGYJWNMlGEHpEB+LMb1Cw8WGONLCygj+SkAL/hk
 62PMmPMFd9I6cQkBbyq2AuHQNHT9wrhpiL769Ga8t95scNR/M1Z5hEY1xK4qU0A2IXzU0z
 2nRgk0tI59b0ZE71tIClSwsF4O6fcS+FYtO46K8rEEtCLkbL2vQbBArgKzXiaMA+WO87E6
 VcgfwLcIjpINzQmVPM7xAmKgPY93hD5kV16CJVH42SEPPo5LS3Y6O6v6jlyz3fq/it1phV
 MEg1FbWugs7sfF47t+wu1G/j/6Ef8lVJ4nwhDsMv7SPkNqzYvNbAFFBZ24KpyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M2APCsTb
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh2: bump version to 1.11.0
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

On Wed, 28 Jun 2023 17:03:09 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog:
> https://www.libssh2.org/changes.html
> https://lists.haxx.se/pipermail/libssh2-devel/2023-May/000114.html
> 
> Removed patch which is included in current release:
> https://github.com/libssh2/libssh2/commit/b952674f120748174ed2c0fb93e7bd78cf355cac
> 
> Updated license hash due to copyright year bump:
> https://github.com/libssh2/libssh2/commit/1a186f1ead5ab0beca1fcc12aa693c166ef855b8
> 
> Switched tarball to .xz
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  .../0001-Opaque-structs-in-LibreSSL-3-5.patch | 27 -------------------
>  package/libssh2/libssh2.hash                  |  4 +--
>  package/libssh2/libssh2.mk                    |  3 ++-
>  4 files changed, 4 insertions(+), 31 deletions(-)
>  delete mode 100644 package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch

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
