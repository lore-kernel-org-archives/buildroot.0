Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B343EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31B5F40533;
	Sun, 11 Dec 2022 13:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B5F40533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ap9kC4mxghW7; Sun, 11 Dec 2022 13:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 261DA4053C;
	Sun, 11 Dec 2022 13:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 261DA4053C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE6471BF3AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B45A4091D
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B45A4091D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrGReWEOHlWF for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:33:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41DF040308
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41DF040308
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:33:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A0DDC0004;
 Sun, 11 Dec 2022 13:33:57 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:33:56 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211143356.686efe06@windsurf>
In-Reply-To: <20221208210342.23228-1-fontaine.fabrice@gmail.com>
References: <20221208210342.23228-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670765637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpYt0ZFQuWEq+MQgeOwQqaQ/s1+r6IffJWRa1OWRGsI=;
 b=jhDm8G2g1r5tvlO0DlylYtMJ48fPAJXVY4YMjwlJv7+dfYkdytd7ECtGiFKiZU1Dq/e1Jh
 PT713S+N1dHPBBmYUOd/3wfGKSqH60jcWklPZ6FSht+cuSwRxebumcB54Kd42oAEDqKBum
 3sr9tzJsnvuLv/diKqswv0/MYczal/dtb1z0b6mYsPHh1VIEDNK6PaxBQmUBj4xwJrvsmX
 JJhKEh70gMoga5vzvzs8nIW9JgvjFYogwSc0mK655skipS6UHo2YCK9v8yjc1ZIHlmfe81
 6u6NOfSlDdJwsJvh0Bh8q5QtRI2hxPYAD+4Bl8GnqSFpyhI6HvdEGqOV/4Ea7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jhDm8G2g
Subject: Re: [Buildroot] [PATCH 1/1] package/hans: bump to version 1.1
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

On Thu,  8 Dec 2022 22:03:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/friedrich/hans/blob/v1.1/CHANGES
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hans/hans.hash | 6 +++---
>  package/hans/hans.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
