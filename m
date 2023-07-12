Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7434EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E321416CF;
	Wed, 12 Jul 2023 21:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E321416CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hjNm9a7fjCc; Wed, 12 Jul 2023 21:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAD2F416D7;
	Wed, 12 Jul 2023 21:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAD2F416D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC121BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 558C1416D7
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 558C1416D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rF-ByqpPQ2uY for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:34:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14BD7401E1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14BD7401E1
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:34:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E87C40003;
 Wed, 12 Jul 2023 21:34:21 +0000 (UTC)
Date: Wed, 12 Jul 2023 23:34:20 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230712233420.2f6a5381@windsurf>
In-Reply-To: <20230523161522.1275284-1-bernd.kuhls@t-online.de>
References: <20230523161522.1275284-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689197673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hF8DsBxibWviIsk2z1k1jQwhSQIS9XqgSTHgYKTGlU=;
 b=lMC1PpP/9MHdi24n5sf3aYBamU6qd3KQReKXFzcmSjtAfj5h+lz6wI4+aspDyuBYOFqz+t
 oaLwL/Djh8Qivqxj7GnVaYMvH26X/UoeKIJ+OUSlgPjwfuGuTw5ddMQN8fPZ27FkFpcdt+
 1w5Vl0aHVvIwEaWNb68C/v1XAntPbbIchXw8E419m4AOHWd/yJCcU7WaN2SsMejDxvzSKK
 3mWZx30vgkHTRZFi+DKy8bZJ98opEpmDHNpjZScEetr8fc4debXc8/8eMSbybfpk5tx7g6
 qm5rBsyOYVM8VPRE6lAX09EOjzPrQ2NLtJNQO38stQn6dgOAcbmA9r52g80e1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lMC1PpP/
Subject: Re: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-waipu: bump
 version to 20.9.0-Nexus
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

On Tue, 23 May 2023 18:15:22 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
>  package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
