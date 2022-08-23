Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF96C32774
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F4D060B35;
	Tue, 23 Aug 2022 19:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F4D060B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkD9h-65Ekf0; Tue, 23 Aug 2022 19:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8308F60B11;
	Tue, 23 Aug 2022 19:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8308F60B11
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 336651BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19204401F2
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19204401F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUyu8IcKxSqR for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:43:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C5CC40053
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C5CC40053
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:43:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D992240008;
 Tue, 23 Aug 2022 19:43:11 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:43:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220823214309.62ebbe77@windsurf>
In-Reply-To: <20220822090023.2086625-1-james.hilliard1@gmail.com>
References: <20220822090023.2086625-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661283791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DpnUb6lisLrOIdi9cvFIZXQvZEx3azg2zzjOQSSyAU=;
 b=f2VCCxjexsvB2KfJoI2nY/wHHdkuWAg3dEM8bFl63qLmLTjcZXs0b2Ej1fGL7eFtxg4vy9
 CqJm6pyMPAwNE+kYMkATi8dKiyyujXh5oAqwpRnkSRh4dR5UvDZe0Dc2vUeu2MjiGBrEA5
 gLtPLN2m4WFc59621IoyzHPrjIZVij/8hSMB2UNtK/Jz6PowMoZxa+dXx7fWL7PIgqplpU
 pNGMBCdiEJ6SlzIDu2d1awMUM3VELdRwjy5PIBI4/NakbXXBktez5gqiDm5WBptOpXCGTi
 3gTfh8I254ouqXGH9vP+ry0nN2F0B9GXjTtk91/tHaCDXvgD2cBo0h218QafMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f2VCCxje
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: bump to version 2.5.2
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

On Mon, 22 Aug 2022 03:00:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gensio/gensio.hash | 6 +++---
>  package/gensio/gensio.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
