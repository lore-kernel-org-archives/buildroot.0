Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BB2EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 13:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F3CA81F44;
	Sat,  1 Jul 2023 13:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F3CA81F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XzzDIsiIsNM; Sat,  1 Jul 2023 13:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B98181F27;
	Sat,  1 Jul 2023 13:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B98181F27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F135F1BF616
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 13:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C212260D67
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 13:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C212260D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VVAyHX4_vyC9 for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 13:22:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9799C60D52
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9799C60D52
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 13:22:24 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42B4EFF805;
 Sat,  1 Jul 2023 13:22:21 +0000 (UTC)
Date: Sat, 1 Jul 2023 15:22:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701152220.32eb47d1@windsurf>
In-Reply-To: <20230628144923.536511-1-bernd@kuhls.net>
References: <20230628144923.536511-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688217741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+Ul0C5e+6vxv4PKd3jWLsBrq3O6KXV2MJITZu5Q7DY=;
 b=X/bC3x+Pu9fnQ4CI9jc879JLJ56PJKMxxnZXuUvYKgYfO6DCerUTzQlQHgwKLc+efYMIhs
 rdZQ4JbChhKl1Q9moBaqVu+gXpZeykoE2MHVU0qAiTYpKiK/3Onyge6oGdFxpXwp3AoYZ5
 j9E/KRoJTHYb16Xv/M8hUPDvhA8Bx+TM5SZu2dnrr5+bT6/fFPgfTSbxKQEOzQWps7HCEx
 B3FZQouepSHUXcxbqHBgJzeacc3+h/h3gCghW0t4d6z7yvBjOpCa34yOeYH+f4YVSeCSRI
 B/gwEPkU+fuYbIPcNKhngGIvGgM5rJXP5NR6HrR1oweArFrqekkEOc/RuJ2mbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X/bC3x+P
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.16.42
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

Hello Bernd,

On Wed, 28 Jun 2023 16:49:23 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://ftp.isc.org/isc/bind9/9.16.42/CHANGES
> 
> Fixes CVE-2023-2911
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks. First patch I'm applying since March 29.. I
hope I still know how to do it properly!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
