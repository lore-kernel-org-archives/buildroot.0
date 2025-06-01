Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F26CC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 13:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A610060A4A;
	Sun,  1 Jun 2025 13:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiH-mVats9vX; Sun,  1 Jun 2025 13:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF6D8605A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF6D8605A6;
	Sun,  1 Jun 2025 13:23:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB30E127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D08CC60A67
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUUMBCOpEgMI for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 13:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.98;
 helo=smtp-outgoing-1603.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C02060A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C02060A4A
Received: from smtp-outgoing-1603.laposte.net (smtp-outgoing-1603.laposte.net
 [160.92.124.98])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C02060A4A
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:23:17 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b9Hj950hmz10MQQ","contextId":
 "5f14698c-01f1-45ad-bfad-278108e28edb"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4b9Hj950hmz10MQQ;
 Sun,  1 Jun 2025 15:23:09 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b9Hj945XXz10MQN","contextId":
 "9833fa63-a598-4d70-9028-4188211797b1"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4b9Hj945XXz10MQN;
 Sun,  1 Jun 2025 15:23:09 +0200 (CEST)
Received: by romuald.bergerie (Postfix, from userid 1000)
 id 3120B6752840; Sun, 01 Jun 2025 15:23:20 +0200 (CEST)
Date: Sun, 1 Jun 2025 15:23:20 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <aDxUSIZRn7zXRavd@romuald.bergerie>
Mail-Followup-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
 <20250530220409.5187b93a@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530220409.5187b93a@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748784195;
 bh=jCsi0rNN1rEyezojJ4UY1bbKigXu6qgv2rxRey6D/Yw=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
 b=QeJzmsjs+h4UzQ40mUzpWP13+i1EwDdsfhJzhWeXjn9kMJ6SMD/7d0TrjJKkfWN2JPlphxUA1geZG/RS6zLh198SHd8A4lBkC+74AIK4pdgiFYQUSQ91a2Xfn/FnhEBjGXzx1qA8AmYVMocELqYLJwf3m+3FtENYzshKezVPI9WcWvyV2GNAfJc9v8xVLW+zZmtgs4cGLFhzjmiKRvciFXlquvZJLM1hCGeR+tOWfuM14UgE0mlQZ6tDJalf56CS4eSwn/lA3uBDD6NtsbLOLjPyNVSor5L7pI5nzEbWS/QkvzHJ71ON6j0q6q2TuvpSwgcdVeiiUSDTLO4EF098pg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=QeJzmsjs
Subject: Re: [Buildroot] [PATCH 0/5] Add support for HPPA (PA-RISC)
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, May 30, 2025 at 10:04:09PM +0200, Thomas Petazzoni wrote:
> Hello Vincent,
(..)
> I have nothing against HPPA, but is this going to be used in practice?

Dear Thomas,

Thank you for having a look.
In all honesty, no, I do not think this will be used much in practice,
except by me (and maybe a few HPPA fans?).

> We already support quite a lot of "exotic" architectures in Buildroot,
> and they are a fairly heavy maintenance burden, due to:
> 
> - Architecture dependencies in several core packages. For example,
>   libffi, libcap, are used by zillions of packages and they have
>   architecture dependencies.
> 
> - GCC issues. Our autobuilders are flooded by GCC issues affecting
>   SuperH, Microblaze and other exotic architectures, and those issues
>   are never fixed because nobody cares.
> 
> So while I find it nice that we support so many architectures, I think
> we should all wonder whether it makes sense to support even more and
> for what use-case.

This is a completely fair concern and I do realize that Buildroot
maintainers are already fairly busy; I certainly did not want to cause
any hassle with this patch series.

I just realized that HPPA looked still well supported in the essential
components and that it was easy enough to support in Buildroot (and
indeed this is worth only ~100 lines in the end).
Therefore, rather than keeping the patches locally I supposed that HPPA
could find a place in Buildroot with other now-exotic architectures such
as m68k or or1k.

Personally, I love the idea of Buildroot supporting as much of those old
architectures as possible, just for fun.
If this bothers you or other Buildroot developers, and you fear this
would harm Buildroot in the long run by wasting developers' time, I can
also understand; in which case, please feel free to just drop this patch
series (and the future v2).

Best regards,
Vincent.

> 
> Thanks for your feedback!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
