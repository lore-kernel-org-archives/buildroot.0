Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81589CA0EED
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 08:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F9E5406AA;
	Tue, 19 Aug 2025 08:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iXUXQeINaBA; Tue, 19 Aug 2025 08:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A48E40337
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A48E40337;
	Tue, 19 Aug 2025 08:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91081E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E99C806C2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOhVAPKzOtTG for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 08:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A29B58111C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A29B58111C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A29B58111C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:29:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F3A2FC6B390;
 Tue, 19 Aug 2025 08:29:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7D92B60697;
 Tue, 19 Aug 2025 08:29:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 73A971C22D7AF; 
 Tue, 19 Aug 2025 10:29:16 +0200 (CEST)
Date: Tue, 19 Aug 2025 10:29:15 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
Message-ID: <20250819102915.7cc03d65@windsurf>
In-Reply-To: <CA+TH9VkUgn3y2VthqiKfejas0Fx47yqvVGbgjch3MPyHS4u_2A@mail.gmail.com>
References: <20250818140518.964728-1-angelo.compagnucci@gmail.com>
 <20250818183349.6373d330@windsurf>
 <CA+TH9VkUgn3y2VthqiKfejas0Fx47yqvVGbgjch3MPyHS4u_2A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755592157; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wAquMgibC91XzZdDxZo8YfOYiwo+qx8LpboDv2eFZFE=;
 b=x1x+dUhtLkP2peAicHD4JN9RtjPJd8XS69yDx9de3ZKwplBfXFlCS/oEZkguUoWPVLXw3p
 4kGYmJMQ45iuU1np1X5ZYxzz1ikHCgOo3Lnv4G4laQinHukcVb041Aohz5muGb2/7NSZZs
 TjsVSqhv93atuf/VUZBttvpGU187vwvIzpH72ErMGOk9jyICBRQDmVkOVFirnv5PfAUiTw
 +yQbDCodemFkcqm6mSGBCZ3u9u6q/oZzof0fZYGleFayjOrRVpOOQbYXy1fEMa4Jx6AnSr
 lx+t2jlgU5nmfq9UcxpNnBIZER7GqRXL8gcoRB49YIOxffpeN+Ra//FMPb+YIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=x1x+dUht
Subject: Re: [Buildroot] [PATCH] package/mono: remove mono and related
 packages
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

Hello Angelo,

On Tue, 19 Aug 2025 08:12:55 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> > Thanks for this patch. But do we have the Buildroot packages for .NET,
> > which would replace these Mono packages?
> >
> > Or should I read your patch as "This mono stuff is no longer
> > maintained, and if anyone wants to use .NET with Buildroot, they should
> > package .NET instead of using this unmaintained mono stuff" ?
> >  
> 
> I added the note about the .NET Giulio's patch exactly for that reason.

Sorry but I don't understand your answer. You don't really answer my
questions, and I don't understand which "note about the .NET Giulio's
patch" you're referring to.

Could you clarify?

> Technically speaking, while having an infra in builroot to build .NET
> packages, it's not strictly required: mono can cross compile and produce a
> self contained executable to deploy on the target without any third party
> tool.

Perhaps, but it would still make sense to have the necessary tools
packaged so that the entire build process can be integrated in
Buildroot, and be reproducible, as opposed to have to separately and
manually download the .NET "stuff", build your application, copy it to
the rootfs, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
