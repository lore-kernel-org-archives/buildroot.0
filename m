Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741F8C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E981641B7F;
	Tue, 26 Jul 2022 15:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E981641B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKHpb2R0MemZ; Tue, 26 Jul 2022 15:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75D36419D9;
	Tue, 26 Jul 2022 15:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D36419D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 918461BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AC4E8420B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC4E8420B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTrtUKqgalig for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:12:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD1328474E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD1328474E
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:12:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8FBCA1BF207;
 Tue, 26 Jul 2022 15:12:08 +0000 (UTC)
Date: Tue, 26 Jul 2022 17:12:07 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220726171207.67d3cee5@windsurf>
In-Reply-To: <20220726144737.694203-1-romain.naour@smile.fr>
References: <20220726144737.694203-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658848328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czh4aYoDTe680ZnSlU35M8tbKSg7pwEcSwvfhe23ZJ8=;
 b=dmCJVzhpU5ET8TJv8edrhQM+FZGs5nZUqbDNOvWi8HqPZyodWmI2Dz9XWlHiIWXf64j/6P
 kvShzg0f276Bl29sPWyhd/9S094W+sUDYmfV+/GhHXZ6FvtW/Y5TCN9zAZsvMt9bR8V6My
 yPtOkLYtwxKMiMnCXK0Igwre0x1R2Nf0CxyV773T/5cV5j0RdOoujqYvPooEGwSRHSnkQW
 vpMF0gdMlAg1S4RE38ieSq1laPXFseKpetfQWkueU9XUaAKjTRgih/dKK0Rf/73nlAbO0J
 akFHZQ4d3awRqqb5uC6ZnD1o/DaqybrrekGXBfoOvklwAIBbWWXZRwft2wTAVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dmCJVzhp
Subject: Re: [Buildroot] [PATCH] arch/Config.in: BR2_BINFMT_FLAT remove
 architecture dependencies
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

On Tue, 26 Jul 2022 16:47:37 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> The commit [1] removed the Config.in.host file and moved
> the arm, sh, sparc, xtensa and riscv-64 architectures dependencies.
> But this list doesn't contains all elf2flt supported architecture
> and break the host-gcc-initial build for m68k.
> 
> Since BR2_BINFMT_FLAT is only available on no MMU case, we can
> rely on BR2_USE_MMU option and remove the architecture list.
> 
> Note: SH without MMU support has been removed by [2], sparc requires
> an MMU since at least [3].
> 
> [1] 9db5eb258cf492567bac33a33cb606f14045639d
> [2] 04ea3d38dd76f4e96f4961143d674aff59b13d3f
> [3] 29563047e074a7c0b73c9e6b629d08bac1e07cb5
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  arch/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master after adding a reference to the autobuilder failure
that is fixed by this commit. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
