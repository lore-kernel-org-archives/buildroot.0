Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5178AC43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF1A841549;
	Mon, 18 Jul 2022 10:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1A841549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqNlwKf8owxj; Mon, 18 Jul 2022 10:12:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85DA841526;
	Mon, 18 Jul 2022 10:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85DA841526
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 910B81BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA05404F3
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA05404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sy7pXBjrJ0v2 for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:11:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 238BB40222
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 238BB40222
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:11:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D917EC0011;
 Mon, 18 Jul 2022 10:11:30 +0000 (UTC)
Date: Mon, 18 Jul 2022 12:11:30 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220718121130.48c4e898@windsurf>
In-Reply-To: <20220718063545.3481147-1-james.hilliard1@gmail.com>
References: <20220718063545.3481147-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658139091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ak+jfeLejCE5NQYUlJxanMZpxuO54NjiHBBb0EnVr7o=;
 b=fcLTiJiFqPC/lq0ND0HJAt/1RzHN0bLx3fiKqzPboiu6l/2nWZFB6mg3uWzRi6WbM4dCKp
 iDrmweHYpbJgQIYYjH2fjLQulfIx2kUXG5Sr1KzD/yPcT6xOT4Jbza3PZY5+8R9r6lgEAQ
 sqCHXfsTFLoSfF2W/J1AdJVDOwbYoAZI0rwNppnQ0LorqMDeR920ZBg2rr2ZBoVJWkusxF
 UZLYa/OCiv8XBSbqlG2g1wFYAmVhH9keuRYRkD7OCMA8+mQZtpi2XVZbBvXlU9P6j6B6DJ
 KRoWRja9IjvYhVezGeTJcdIfVSQ/1KR4ByEs0/gVJzte9epMYKNqNuG+8FAuOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fcLTiJiF
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator:
 fix/update version to v11.0.0-269
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

On Mon, 18 Jul 2022 00:35:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> It appears that we were using a release branch instead of a stable
> tag, since spirv-llvm-translator doesn't provide normal release
> tags for clang v11.1.0 lets use a commit-ish based on the closest
> tag.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/157/157e85ab3445b0852d999b747765a0a020e90c06
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
>  package/spirv-llvm-translator/spirv-llvm-translator.mk   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

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
