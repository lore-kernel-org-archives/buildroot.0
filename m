Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96F6C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65FE94063E;
	Mon,  7 Nov 2022 22:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FE94063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NeFVZSncVKSC; Mon,  7 Nov 2022 22:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A67F740329;
	Mon,  7 Nov 2022 22:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A67F740329
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1C811BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC4FA410C5
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC4FA410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqqd5jHez9kT for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:10:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80FBD410BE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80FBD410BE
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:10:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BCCB91BF205;
 Mon,  7 Nov 2022 22:10:55 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:10:55 +0100
To: Gleb Mazovetskiy <glex.spb@gmail.com>
Message-ID: <20221107231055.0dfc3241@windsurf>
In-Reply-To: <20221106142634.875639-1-glex.spb@gmail.com>
References: <20221106142634.875639-1-glex.spb@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdhIt00VHAJQW0lqY9LhU0/cxGwa4CrZK18QWIPUS0o=;
 b=VxOhvPZjrl0wINoIr7WE0MsHooRMXeLHSvCMVrjw801RsTB65cVzT1FIhq0gyR14pqMaj/
 BrMYMzj2XJ9FPI8SulQbJB88E0kJKTWz2wrMZbfIBccYYnfzvg1XTQ8OxqkCZelLL7Y5QG
 wi/R3/8lX7ureoTxNIJdJV4uq0SelzKKF8be/ftaS7lEHmY4EA3aisl/YEP0RkZvb2B02V
 5wnG2jiRkCXQa1knph2u7Nei63keR811YC2MzbCa8QZSgsqk8rJtbAZK2Qr+JYnAE4vrPM
 NDkAT77n2Ax8tfRap21fxfPBZMjBKseaA/aH9sKES44xlncJsIQPndsu6tkl1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VxOhvPZj
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: unexport PERL_MM_OPT
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

On Sun,  6 Nov 2022 14:26:34 +0000
Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> Compilation of Perl-related packages fails if `PERL_MM_OPT` is defined.
> 
> We previously issued an error in this case.
> Instead, simply `unexport` the variable.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  Makefile                             | 3 +++
>  support/dependencies/dependencies.sh | 9 ---------
>  2 files changed, 3 insertions(+), 9 deletions(-)

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
