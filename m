Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3FBC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DD4C4025D;
	Sat,  4 Nov 2023 18:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD4C4025D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZQn0aoQRRwg; Sat,  4 Nov 2023 18:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4866440223;
	Sat,  4 Nov 2023 18:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4866440223
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF641BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 439F4417CA
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 439F4417CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqzrBIfb6TbF for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:24:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A913418C1
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A913418C1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 546A11BF203;
 Sat,  4 Nov 2023 18:24:28 +0000 (UTC)
Date: Sat, 4 Nov 2023 19:24:27 +0100
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20231104192427.7ef3b9b3@windsurf>
In-Reply-To: <20231031225751.35130-1-brandon.maier@collins.com>
References: <20231031225751.35130-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699122268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACk075mG8xjLO5vekSK8yrlQrkpVoQWgVsTKTmlFRiY=;
 b=iOl5IEbT+o3BKLa7zj7CJ2Q/dHpXk7SiXCRlmztQXCg/6lN452cLoQ/zWIt51OOmU7QDLk
 +/oxPKe+vNVg75ndcMD8SP58TL3fd119WYfkgIt3MT9egpQMxRCp8kF+CAATGVIaQGPoig
 gqvDebOvQoFwQXB850TZxI5+qo+cFmV5HnUOWdLhCmHK27teUxtTvCtVx07gIfPMt7/ZQU
 aLWnFhJDkQ1NL620pX1yrRmbD1dUl6Vh+dnogj7RsorhYUFp/IkF32jW+LE7hJngeSLPJd
 omXyRbU85r5FX7vY5W8paSRU9raIeV5Mja++eW588X68XZGLj0MTGa0H2P5EZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iOl5IEbT
Subject: Re: [Buildroot] [PATCH 1/1] freeradius-server: enable default
 modules mschap and realm
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
Cc: Julien Olivain <ju.o@free.fr>, David GOUARIN <dgouarin@gmail.com>,
 Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 Oct 2023 22:57:51 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> From: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> 
> "mschap" and "realm" are already part of default required
> raddb modules(DEFAULT_MODULES in raddb/all.mk).
> 
> so removed them from disabled module list so that
> radiusd.service can start without following errors:
> 
> - /etc/raddb/mods-enabled/mschap[11]: Failed to link to module 'rlm_mschap': /usr/lib/rlm_mschap.so
> - /etc/raddb/mods-enabled/realm[21]: Failed to link to module 'rlm_realm': /usr/lib/rlm_realm.so
> 
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  package/freeradius-server/freeradius-server.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks. It would be good to have a test case in
support/testing/ for freeradius, to make sure it starts up correctly at
boot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
