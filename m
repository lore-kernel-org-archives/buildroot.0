Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DA6C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 12:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D06F4051D;
	Sun, 12 Mar 2023 12:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D06F4051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiQ1rqaeH2nT; Sun, 12 Mar 2023 12:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 778C640484;
	Sun, 12 Mar 2023 12:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 778C640484
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1D541BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB58A8142F
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB58A8142F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMndGX0QT0gq for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 12:32:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508CE813E6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 508CE813E6
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 12:32:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C7CE7240004;
 Sun, 12 Mar 2023 12:32:25 +0000 (UTC)
Date: Sun, 12 Mar 2023 13:32:24 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312133224.0598454f@windsurf>
In-Reply-To: <20230312092215.11954-1-ju.o@free.fr>
References: <20230312092215.11954-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678624346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6Kgs/HKys8FKpoGMbyaOt6KHLmoIlzKa1RQdYE06Xc=;
 b=Z/fx2ial/iXXzUdSPoMsZj4gYxUcvEJ2NaOFu4MQcZSPm+Pb/QgRYPQgsB+hgJ+L/P/Unc
 63JMicE86GQ05sewSDxO0/G2bwEeSszjZQF8epZ0ViZZbq5VFiwEmXwmVxG1/we/PeOFz7
 U+cINHiGwC69DcS+yAF6HiDF82TXXb6xQAPQ0uKBGyz6klU1dvin1lpv+syUlTYQ7ys8Gs
 iStHltJqHODitPQcIL6zpuEkG5txc/b0r3x/TkCjTf0OZlxepGqIJvZhE6I+ELHkubj+mX
 h3y7AsX9moK/nJF19tzcwWrfaA+S26X/nT7yfuKDdV5QCdlioiWHYCwJ53UBzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z/fx2ial
Subject: Re: [Buildroot] [PATCH next 1/1] package/pcre2: update _SITE url
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

On Sun, 12 Mar 2023 10:22:15 +0100
Julien Olivain <ju.o@free.fr> wrote:

> The pcre2 url [1] is now redirecting to [2]. This change was
> announced in upstream commit [3] which was already included in
> pcre2 10.41.
> 
> This commit updates the PCRE2_SITE url accordingly. The package
> version remains unchanged.
> 
> [1] https://github.com/PhilipHazel/pcre2
> [2] https://github.com/PCRE2Project/pcre2
> [3] https://github.com/PCRE2Project/pcre2/commit/66b3cb34dfe5411cb2bb939a8f4981081815d496
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/pcre2/pcre2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
