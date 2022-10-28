Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DB4ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37E0A81767;
	Fri, 28 Oct 2022 06:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37E0A81767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id loICkdJB6P4s; Fri, 28 Oct 2022 06:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A4E8175C;
	Fri, 28 Oct 2022 06:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A4E8175C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F07C41BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C899E40133
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C899E40133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Un_ToR8lXnZW for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:46:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8F3E400D0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8F3E400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:46:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5309FF805;
 Fri, 28 Oct 2022 06:45:57 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:45:56 +0200
To: David Johnson via buildroot <buildroot@buildroot.org>
Message-ID: <20221028084556.2118f0d8@windsurf>
In-Reply-To: <20221027203039.1004439-1-dave-git@centerclick.org>
References: <20221027203039.1004439-1-dave-git@centerclick.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666939558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBwYNNZr9moqK4QdE+TyID2CsUBwkk0ezKZLbM4+fz0=;
 b=j4r4DVBj3voxIMSSkYG+4ihRpLk6Srye1CBC2O0ekeLBNzO+Ws5hRNvYWysEtsu4BDxBOw
 aoI+/M/wCE07z/v56tQ7E/UtBAQNSQ+OdUTPp1BQpfDJ9VKZLaMiqTpHYksbzfmu2THgI6
 MI73sMxZY/A3s00k182EpNqMsHd3vuwWmdUpL+0cWxeNTWvonhocJJ9rxc7eAShvWXAgls
 5X80REOuYcwltgtBpde28WT5LwaRnqj99QkOkb7OMl8pgdPZG2kqRKk6mVrfzZ92NqxfUh
 uZSYmcGUjc93KIq6ov6d60XPJmkX/t+QL6n7bMFLRxg60RNKqRMWk1kUXB6ewQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j4r4DVBj
Subject: Re: [Buildroot] [PATCH 1/1] package/tzdata: install
 leap-seconds.list into results
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
Cc: David Johnson <dave-git@centerclick.org>, Martin Bark <martin@barkynet.com>,
 Richard Braun <rbraun@sceen.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Oct 2022 16:30:39 -0400
David Johnson via buildroot <buildroot@buildroot.org> wrote:

> add leap-seconds.list to installed files so it can be used by other packages
> 
> specifically, ntpd's ntp.conf can now include:
> leapfile /usr/share/zoneinfo/leap-seconds.list
> 
> Signed-off-by: David Johnson <dave-git@centerclick.org>
> ---
>  package/tzdata/tzdata.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
