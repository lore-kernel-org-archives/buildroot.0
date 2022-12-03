Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F036C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17CE381846;
	Sat,  3 Dec 2022 14:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17CE381846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fH6LOV3NFMDW; Sat,  3 Dec 2022 14:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D74281521;
	Sat,  3 Dec 2022 14:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D74281521
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCF751BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A472E40334
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A472E40334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MdjjwytRx7p for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:43:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600B04029B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 600B04029B
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:43:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D027E0002;
 Sat,  3 Dec 2022 14:43:18 +0000 (UTC)
Date: Sat, 3 Dec 2022 15:43:15 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221203154315.0716a0a8@windsurf>
In-Reply-To: <20221203101803.23169-1-heiko.thiery@gmail.com>
References: <20221203101803.23169-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670078599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ez/RDPF8JVEwt8aYg6MVtm+4tbBhfkSxk1BuulnxRYw=;
 b=Pi40BB4VsjjIzrf4YVmfoI0OJUj66oPmmnXiCLmIgGRfWjujZ04Z7SiW/ahH0ubUYeVXwP
 e13aPPDIJXwXoBbZFSkHqbanowFs6mI8VlA2j1WBtnuDBr0uYNYO+klNbcJ6+pilxBKYr5
 dYGIWuJuSnhCKP7dmN6tQZDTulxnl4VGceIyMnqbnzXUVBsfmHwiTuDN+OJTjsw3Jk9Yjc
 sBmc0o/9VwQtAPT71RrJP+OrjMsP4nO89GveOYWXZjvX0Uu8U1TnUMSBKFUAMRjZ2Voh1J
 G7iIzo3obybA/T4PT+BlnpLj9v4tbMc6rMP3C/KdgSXM847fS302swMqc7uu2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pi40BB4V
Subject: Re: [Buildroot] [PATCH] linuxptp: add patch to fix build failures
 with make 4.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Petr Kulhavy <brain@jikos.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Dec 2022 11:18:04 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> When using make 4.4 the KBOUD_OUTPUT environment variable provided to
> the linuxptp makefile is not utilized. The added patch will fix that
> behavior.
> 
> Fixes: http://autobuild.buildroot.net/results/5294fac7ed04945d47ea4eb2d1448bcbea5352bb/
> 
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...itional-assignment-for-KBUILD_OUTPUT.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch

Applied to master, thanks (yes, after fixing the commit title).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
