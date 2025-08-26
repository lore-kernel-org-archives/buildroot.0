Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3B9CA0FE9
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 07:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84A0242CF6;
	Tue, 26 Aug 2025 07:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fo9L3LnXw8f; Tue, 26 Aug 2025 07:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42DD42CF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42DD42CF4;
	Tue, 26 Aug 2025 07:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A25FB0B
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 202B642CEF
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-PWSGYG29xs for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 07:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58F6842CE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F6842CE8
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58F6842CE8
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:52:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3E68C1A0DD0
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:52:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16F81606A7
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12A0A1C22D342
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 09:52:46 +0200 (CEST)
Date: Tue, 26 Aug 2025 09:52:42 +0200
To: <buildroot@buildroot.org>
Message-ID: <20250826095242.2d739898@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756194767; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=ToZf5e39edKg/pC4VVsMpxR238ue6kMTNfxbxD/yx1Q=;
 b=UHPtH+YDourL7JDlkPthgmPZpj+OprXJjR0DVUXPNSizKRTMcQej1LskLLtDEeB0huu4TN
 Y6rAt18biWFwWY2J8xyl5WL8XiQd6/aG0Ww9e4zkfOqn7F0i4tNFLGMT9XBuabdB4apaly
 xWPWrEEIfpBagg//f7YhIkh5fiHt6FfwXs0YuKxKCf1Oh5eZoZPleMgIc4aPcH6mwxTDOp
 /E7ZOQ8P4loR6l0c/AFJ3h39y5Rm0ffW1r1cj3GmKH3VAxJ72ySsGcPKbM+ntjIQ/DzoQE
 au0HkEGbrC9r1KCKFexFTNXpSZfGtUMAvyXc8/hAOk09fWlSiQ9ZxWSUdneasQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UHPtH+YD
Subject: [Buildroot] Buildroot Developers Day: joining virtually
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

Hello all,

On Thursday and Friday this week, we're having a Buildroot Developer
Days in Amsterdam, right after the Open Source Summit Europe. See
details at:

  https://elinux.org/Buildroot:DeveloperDaysELCE2025

If some people from the Buildroot community want to join virtually, you
can:

 (1) Join the #buildroot IRC channel on the OFTC network

 (2) Join the live Google meet at meet.google.com/ikm-vxvp-uyb

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
