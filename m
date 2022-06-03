Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57230C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 14:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D723284091;
	Fri,  3 Jun 2022 14:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyMv1Z3lTgAp; Fri,  3 Jun 2022 14:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 053EB84042;
	Fri,  3 Jun 2022 14:43:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEBE21BF2F3
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D606041797
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcgCPzpkxryy for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 14:43:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 222A941A2C
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 14:43:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 421D940010;
 Fri,  3 Jun 2022 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654267400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPTKlIWKAAHz3ZA11zEvXDY3ed6rQpgK66fPyzDE1zM=;
 b=YePkqN54TjuSLCasjU/ruMsOjpb1nNqHlEpnY7XLNZV+UGgW33qaKOXqaUrcODsW1DP+3Y
 xX2KGBVbDTOyybYpnWoROAVvTBrRteLMd+/hv7Tnhs33TTNLd1HC9vWQndZd22qo68uinF
 ikDLW/WgG9kGIJ+6KbI7rcBsNXoZypYPDneKpdPCNX4aeeuN8XCQmONsIt3E0OnUXvQpJZ
 eegE/7wyIT9TvziwvaeffJTrGfJzSC8GCyiiUg3+8p8rQugBJsDlU+izv0SOSGKhnOgWvi
 md3dtLH2Khw0gDG75HjAI+Gw4Tp4aR9TFSfIabWFK+YHYbeLK10T47HTrf30og==
Date: Fri, 3 Jun 2022 16:43:19 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220603164319.26afc2a6@windsurf>
In-Reply-To: <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
References: <e123582d-c613-f81a-ac0d-b23bc4d3e74a@cartal.fr>
 <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Make 4.3 and printvars
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
Cc: Jean-Pierre Cartal <jean-pierre@cartal.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 3 Jun 2022 16:05:18 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   I tested it myself and indeed, it works!
> 
>   It would be great if someone could hack this into the Makefile itself (so that 
> it recurses if ulimit -s is not high enough) and revert 25cec5ea733251.

FYI, the make 4.3 bug is resolved upstream:

  https://git.savannah.gnu.org/cgit/make.git/commit/?id=e49e11e069fe7f214263be1782242b9b50f71eaa

I have asked upstream to issue a new release:

  https://savannah.gnu.org/bugs/?59093

but not feedback so far.

So this workaround of "ulimit -s <highvalue>" should only be needed for
make 4.3. Later versions are supposed to be fixed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
