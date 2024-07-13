Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D361C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F77A400BA;
	Sat, 13 Jul 2024 19:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiFyT6Je5u0m; Sat, 13 Jul 2024 19:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D74BE40148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D74BE40148;
	Sat, 13 Jul 2024 19:53:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4CF91BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B085E40720
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYjANDsP1pmV for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 427A040634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 427A040634
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 427A040634
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:53:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 471E0FF804;
 Sat, 13 Jul 2024 19:53:16 +0000 (UTC)
Date: Sat, 13 Jul 2024 21:53:15 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240713215315.77f42335@windsurf>
In-Reply-To: <CADvTj4rnf4WUO0+7n9M3WdSvV-QBpca=ivOugcr7tLL4iPvZtw@mail.gmail.com>
References: <20240712201943.457747-1-james.hilliard1@gmail.com>
 <20240713141529.66e77cea@windsurf>
 <CADvTj4rnf4WUO0+7n9M3WdSvV-QBpca=ivOugcr7tLL4iPvZtw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720900396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxXqws1U4q4XuhoKZl0Wm+vFhCkzvoyflZYSqCT4TfU=;
 b=RDr62Pf3nh7SoBEl3ClJI/0axBD1pnvZxC+Q31rha3bVA4EedwxDJQ4iMp//ucbVMkMmvc
 fWv+LIXHtDb0q0JLGOQpkJ8g+lRirMRbVQ4eZFTKxSXYYpqlENXCJ+w0sHUZn7y4h5owNS
 2OcVR7Xbt+tKdYVfOLOdtHXH6554cNf2MHBSqPamNbE0rbMKRjREBQ+Z/0JNRbwMIm0CWk
 5hDzO3OFEsjy/G0BH9qVjcwHkEaQXLUqrTd/JVIwPOC0zVT2a1HsMs6JmIxPLUknU+GMsc
 RYv2ae0/2VEB59pml3H3VJ7DL6WRmKp7eilyEf69gr9dkgDR67oS3D3DM2PBXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RDr62Pf3
Subject: Re: [Buildroot] [PATCH 1/1] package/prelink-cross: bump to version
 ff2561c02ade96c5d4d56ddd4e27ff064840a176
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

On Sat, 13 Jul 2024 11:47:57 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Peter: it means this version bump is actually fixing an issue that
> > occurs on 2024.02, so this version bump should be backported to our LTS
> > branch.
> >
> > James: this is why we ask for more explanations, so that we can figure
> > out whether a certain commit is relevant or not for our LTS branch.  
> 
> Do we backport build host major compiler version update fixes to LTS
> branches?

No, but when a fix is made by a bump, we need to know it to then decide
whether (or not) it should be backported to LTS branches.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
