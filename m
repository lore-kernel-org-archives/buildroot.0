Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83116C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F4C60C14;
	Sun,  6 Feb 2022 10:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4DB1iKNOl-R; Sun,  6 Feb 2022 10:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE4460B6A;
	Sun,  6 Feb 2022 10:54:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4681BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8827E401ED
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DujfCItCnIDu for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:54:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50A5F400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:54:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 282EF1BF203;
 Sun,  6 Feb 2022 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644144850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMn3LbGl426E40cUDK6ANFeYTFXE4j6kKL0nf/1dzw0=;
 b=kIVBNcBfyMgMO6Eq+1L6TuBgXklw5JuTKeUoWB0eL2ir5peBw8+BG3INWzKyWE6AVGLUDh
 7jL1H7AI3BxFTVfRNVpbvWTz5qU7dV0NxJNjb6D6a5hJcmeU3Yu8l7drESNppKR7O5pgGR
 pr4PAA5Nz0Hf0xTFqMryyA8JAxxiAO39jTiXa9s1E6BYhT5k5XwabPgvXHiR+qNBIDsnn/
 xGhn1fCoZPatkXqF6AXy9jvD+x7b27iu/o0m/vVgvbm1sxHHqUuE7utFO5B/eUfq68qQaL
 EsZ2FF18alpgMaQ6n5ty8TF6ragzBA/3itAlfALq9evresi1dSfmkSQ0dmNFwA==
Date: Sun, 6 Feb 2022 11:54:09 +0100
To: Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <20220206115409.1f1174ee@windsurf>
In-Reply-To: <20220206092048.1901703-1-paguilar@paguilar.org>
References: <20220206092048.1901703-1-paguilar@paguilar.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] DEVELOPERS: Add packages guile and bdwgc
 to Pedro Aguilar
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

On Sun,  6 Feb 2022 10:20:48 +0100
Pedro Aguilar <paguilar@paguilar.org> wrote:

> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master after fixing the patch to sort package entries
alphabetically. Thanks a lot for volunteering to look after those
packages!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
