Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495F2C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAEF143711;
	Wed, 20 Dec 2023 20:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAEF143711
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpOhL56oV-A4; Wed, 20 Dec 2023 20:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B72DA43700;
	Wed, 20 Dec 2023 20:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B72DA43700
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CFFD1BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4271F61540
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4271F61540
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6UqHg-Kn80n for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:32:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B9ED6153F
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B9ED6153F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93F38C0004;
 Wed, 20 Dec 2023 20:32:01 +0000 (UTC)
Date: Wed, 20 Dec 2023 21:32:00 +0100
To: <yann.morin@orange.com>
Message-ID: <20231220213200.074ff76e@windsurf>
In-Reply-To: <01cce88291ac132ca8c881eaaaf3b02a4efa68a9.1702887543.git.yann.morin@orange.com>
References: <01cce88291ac132ca8c881eaaaf3b02a4efa68a9.1702887543.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703104321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOvqV2VZVBfHZB1dawk7zaxSOY8R4OHISkMYUTOFdWA=;
 b=d32SDxpd818LOw1yS7rSnUkRs6YPXzm77waxIIx4dyFU/ZTOMaHWd2tj47Dp8yEXppIHR+
 x0Cr8eAqqSPMYdP+QvV+l0f0zf6KvHhmL/6SRe9EcH90SrwRdYJg7bMyubjO+87pP2jWFn
 rC6zSibrU9xRm1a7OsIG1WBJ1ev1Fe0cquQi92ixJT9HGFKKcKtWTTeYlvQlsJWRQeFii/
 mogOTqeDWgJ3VJ49mOOMli2G9fDvr15PFmEGgG9R13lLfcOWHMHU+hDJXj3cpVMIESLr/U
 m4UbQQ/5aJNiPAxitrmddm82odWcoVQi9FJfDlwu15ymDLWRSjUf1Ww4J4vefw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d32SDxpd
Subject: Re: [Buildroot] [PATCH] editorconfig: fix wildcard expansion
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

On Mon, 18 Dec 2023 09:19:03 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> It turns out that wildcard expansion, * and ?, is not performed in
> matching lists {...}, at least in the vim plugin. The spec is not clear
> about that, but refer to "pattern matching through Unix shell-style
> wildcards" [0].
> 
> So, let's consider that this is not supported. Expand the patterns into
> one section each, rather than use a list.
> 
> [0] https://spec.editorconfig.org/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  .editorconfig | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

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
