Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7A8CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 21:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA8C60E0D;
	Fri, 22 Aug 2025 21:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhDgiof8yZ2a; Fri, 22 Aug 2025 21:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96ECC60DA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96ECC60DA6;
	Fri, 22 Aug 2025 21:09:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84BB6D8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7649D40BE4
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fM8H-YtTK6Ye for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 21:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDB8340BE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB8340BE3
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDB8340BE3
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:09:39 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 739FCE0023B; Fri, 22 Aug 2025 23:09:36 +0200 (CEST)
Date: Fri, 22 Aug 2025 23:09:36 +0200
From: Florian Larysch <fl@n621.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250822210936.p4n5nqtkjvnd65gj@n621.de>
References: <20250819213303.31241-1-fl@n621.de>
 <20250822224137.06fce9ec@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250822224137.06fce9ec@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755896976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3V2Mmu9QHX7Vun1TquwYXLXDRHelB3aU1ADVvabbsaE=;
 b=q1c0q9ak0EaFEdxR9A4CrrY6weM3FaU6v47U1y/GKOymEnPiaNfKFVMXeDjhmUKmexfqNR
 w2bElNADmIV/V4iqL/EtLWW0WF2dhDcZifnIeevL3xSdZpgrsCy0s6gz3+4qFDqIFxIY64
 XmTshK5v2cQFtwEzu7dgz1gjoR5lhyA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=q1c0q9ak
Subject: Re: [Buildroot] [PATCH 1/1] package/tinycbor: bump to version 0.6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Aug 22, 2025 at 10:41:37PM +0200, Thomas Petazzoni via buildroot wrote:
> Thanks for this patch. Even though it's a bug fix only release, it
> seems to introduce some potential breakage, and we haven't had any
> failures of tinycbor in our autobuilders for the past 3 years, so I
> applied to next.

Makes sense, I've also been a bit apprehensive about this.

> Just a minor nit: you hard forgotten to update our
> .checkpackageignore file which was ignoring an issue with patch 0001
> that you're deleting.

Oh, I wasn't even aware this existed. Thanks for pointing it out!

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
