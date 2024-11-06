Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983F9D59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E5EB408CE;
	Wed,  6 Nov 2024 21:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAh_RvuHgKq8; Wed,  6 Nov 2024 21:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FDB2409BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FDB2409BA;
	Wed,  6 Nov 2024 21:21:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A0803B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6796F40BEA
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8z4V7BxSzWe for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AF0940281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AF0940281
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AF0940281
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 857B5C0002;
 Wed,  6 Nov 2024 21:21:52 +0000 (UTC)
Date: Wed, 6 Nov 2024 22:21:51 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Woodrow Douglass
 <wdouglass@carnegierobotics.com>, Julien Olivain <ju.o@free.fr>, Asaf
 Kahlon <asafka7@gmail.com>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241106222151.2ecd0926@windsurf>
In-Reply-To: <20241030190020.1444105-3-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
 <20241030190020.1444105-3-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730928113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoo3oYGbbYnoWGikXVinHipf0O91NG5CHG4SBUsxxKw=;
 b=R9uoKG4ALuXcTHMXxNuzpx31aTRh+eldXca6X5BUAhDNFMIoM28lYPuCbIwlyND83NoHNu
 XALsvVrGVLMBd0awfIjlX59pSeVrL4/EFq8TQVFJz7jtEQTqha/wSwpHyfGUCF0CsHdQ9C
 r40torz/ycuYJNFQZ+iwbnFiOML7ssOGrizvMu1Sazmf1Vvl75NYle2hVZFwisjpKIZIIH
 CccQXVWZlXmhcZYY7SCOKAomTy9ZiFNAT6ecEmTa0avssTTvRW4PJRLZSZ95QGBZmMpxOS
 yydzHgZZwT7SemMdBUknInC34UyI1NxCMyKAJ4FVpdoa0dH43LZOZDKJJZC27A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R9uoKG4A
Subject: Re: [Buildroot] [PATCH v4 3/6] package/pkgconf: bump to version
 2.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Oct 2024 13:00:17 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Rebase only prefix subset of variables patch.
> 
> Drop revert main assume modversion patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...th-the-sysroot-a-subset-of-variables.patch | 78 ++++++++++---------
>  ...me-modversion-insted-of-version-if-o.patch | 45 -----------
>  package/pkgconf/pkgconf.hash                  |  2 +-
>  package/pkgconf/pkgconf.mk                    |  2 +-
>  5 files changed, 42 insertions(+), 86 deletions(-)
>  delete mode 100644 package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch

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
