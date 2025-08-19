Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66997CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 21:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1721C60C15;
	Tue, 19 Aug 2025 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWHwxJDPp9s2; Tue, 19 Aug 2025 21:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49CA160C17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49CA160C17;
	Tue, 19 Aug 2025 21:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F97DE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D26A4050C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wq10qggORZY0 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 21:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94A2D404D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A2D404D4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94A2D404D4
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:52:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B126F4E40C3D;
 Tue, 19 Aug 2025 21:52:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6C8B860697;
 Tue, 19 Aug 2025 21:52:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 093B41C228BA3; 
 Tue, 19 Aug 2025 23:52:41 +0200 (CEST)
Date: Tue, 19 Aug 2025 23:52:40 +0200
To: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>, buildroot@buildroot.org
Message-ID: <20250819235240.3642326c@windsurf>
In-Reply-To: <08a9d67a-1a2f-45f9-b494-2cde99cacd9b@arcturusnetworks.com>
References: <20250818203601.3220947-1-thomas.petazzoni@bootlin.com>
 <0a388727-f5e7-4fc4-8be9-85f72d98f1e7@ArcturusNetworks.com>
 <08a9d67a-1a2f-45f9-b494-2cde99cacd9b@arcturusnetworks.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755640362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MYOBuMf1dlP4bhiA17DJREomhnhZ2dQds1Vp77d3XWU=;
 b=gop3mJ2cO2iIR/Dbl3W/fwLcxwCrelUiquc+nL+H3oZT+WjmFw6mpxJeijvb5TYxGR388v
 Y2R543fXlUkVbAH5EOk0vUZd7I+Y81mUklFfG68DBIoGiRyjth07uRQWuGn+wo0yIZPVCa
 NhGLzu37l66laCKkywLJdoTqQG67k36A+XK+RTh7hPfy58yqkk2v840kvFrZqlD1wqMiTz
 SyrAjfBj92OKHqk/C8EDddSjX8EY7OC1TU5ZCD9FI8iAcOQOgz1JGK003BH4USffCtbdE1
 VvHW9MqktnqK1zSPckZOSDbMSWD6JZFMVRICCrHIjlP+iEk0EgWo143g7qjXLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gop3mJ2c
Subject: Re: [Buildroot] [PATCH] configs/arcturus_ucp1020: remove defconfig,
 broken
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

Hello Oleksandr, Michael,

On Tue, 19 Aug 2025 17:02:19 -0400
Oleksandr G Zhadan <oleks@arcturusnetworks.com> wrote:

> The changes affected only our p1020 kernel branch.
> 
> There were no changes in buildroot.
> 
> Now `make arcturus_ucp1020_defconfig; make` generates images as expected.

Thanks for the feedback, I'll mark my patch as Rejected.

However, the kernel you're using is based on Linux 4.4, which is no
longer maintained, which isn't great, and which sooner or later will
mean that it won't build with newer compilers as Linux 4.4 no longer
receives any fixes/updates. Perhaps you need to get the support for
your platform in the upstream Linux kernel?

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
