Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CDAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 748F9832D9;
	Wed,  1 Jun 2022 21:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vdhkz9WYPdrr; Wed,  1 Jun 2022 21:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F1C483148;
	Wed,  1 Jun 2022 21:48:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 258171BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13A82409DE
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XikXAZJVtxaF for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:48:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED36C400E7
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:48:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E2BC0C0005;
 Wed,  1 Jun 2022 21:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654120093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=haIpl717CBUyFUJ2g6QiHLz0cqyYrVkbTCGBbom6Nwg=;
 b=GQQfeyoeeZ+5Qb15o9ZgZI6yuRUDuj2t64YIf3HrAG2pEvK2kXqR88ug6lQCs5pIG2wsq+
 ToLsLhG+pSlzVyteqXO0BFuQ5WBzMEbcIwJRUTjjTVNAcjn54zD4EF+9oRDfiKpdDsCz53
 iF4GZ0vvX2V6hNbCC1AIryu1eCD8GJk3et3AhiS/pR+3JW+BLZvaojJLhnBPocE6qZhNEp
 dXr43cogszUJ7EPtcIVvjj0WL+iuNPACf4d0xPPuPt321SrZaaEbqG0UrHXT8AlMVGsJVD
 TyajeBHqx8shzIVkmEk77YuFmQGcHHllrRmzDz5+aN7uS/dUMU77MSR8JGiZXQ==
Date: Wed, 1 Jun 2022 23:48:11 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220601234811.55ecbd5a@windsurf>
In-Reply-To: <Yoe28imNyGUIMxBi@waldemar-brodkorb.de>
References: <Yoe28imNyGUIMxBi@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.41
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

On Fri, 20 May 2022 17:42:42 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes CVE-2022-30295.
> 
> See here:
> https://www.nozominetworks.com/blog/nozomi-networks-discovers-unpatched-dns-bug-in-popular-c-standard-library-putting-iot-at-risk/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/uclibc.hash | 4 ++--
>  package/uclibc/uclibc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks. I've changed the commit title to "security
bump to 1.0.41". For future security related version bumps, please make
sure that the commit title includes "security" so that it gets handled
in priority.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
