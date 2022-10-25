Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1D8C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3FE80B55;
	Tue, 25 Oct 2022 20:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C3FE80B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNcE1OLY3JRc; Tue, 25 Oct 2022 20:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E5280B35;
	Tue, 25 Oct 2022 20:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88E5280B35
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94CA11BF33A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 633E360ACD
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 633E360ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcRNYZB7tjU4 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:58:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 336236059C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 336236059C
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:58:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A870B1C0003;
 Tue, 25 Oct 2022 20:58:40 +0000 (UTC)
Date: Tue, 25 Oct 2022 22:58:39 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20221025225839.713862d5@windsurf>
In-Reply-To: <20221025182419.250668-1-buildroot@heine.tech>
References: <20221025182419.250668-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666731521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYlQnCdCnSvJQylGETfsxKYWupD8J4owMPdBLyD8HGg=;
 b=Nw+bfV/Pti0A6dcYMBqPMGMJZSTpyTcVxKisG3Pjq8edTpaBCnoi0Ulb4VERpSIBKc34zH
 7hlMshCJuxHi3sWgwAEVlT+3SayQq614ht2hALO4HLuNpG787R6ItlzRhJ6fM6r8C7z3i9
 /AWFfvOx6xFwvtWdbopoQg1wrLkTWi5slaPh5XladW7B+iBOtQIYnqxew6Vfwyd67a5Esy
 A0QjZUJkGo140czt3oXE8YPFObaV96dOhARec6mE5t+6/HOYEXkW+6jGlf0Uxtn5bNdJym
 MmW7XYI+DY1w/znwjr8zeN/fq2jddTnZjPqvjC/F9ZjCqUu2aS4U49nXyMWVKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nw+bfV/P
Subject: Re: [Buildroot] [PATCH] package/grpc: bump to version 1.50.0
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Oct 2022 20:24:11 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> drop cross-compile patch which is now upstream (again).
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  ...conditionally-downloading-api-repos.patch} |  0
>  .../0004-fix-grpc-plugin-cross-compile.patch  | 43 -------------------
>  package/grpc/grpc.hash                        |  2 +-
>  package/grpc/grpc.mk                          |  2 +-
>  4 files changed, 2 insertions(+), 45 deletions(-)
>  rename package/grpc/{0005-disable-unconditionally-downloading-api-repos.patch => 0004-disable-unconditionally-downloading-api-repos.patch} (100%)
>  delete mode 100644 package/grpc/0004-fix-grpc-plugin-cross-compile.patch

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
