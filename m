Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FF3C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A661540165;
	Tue, 25 Oct 2022 21:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A661540165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHh2VFEytjQE; Tue, 25 Oct 2022 21:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0C6040102;
	Tue, 25 Oct 2022 21:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C6040102
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 042551BF3AE
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43FF60B01
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D43FF60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iy93ks5dASYY for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 21:06:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 911EE60AEB
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 911EE60AEB
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 21:06:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 79CC4240008
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 21:06:39 +0000 (UTC)
Date: Tue, 25 Oct 2022 23:06:38 +0200
To: buildroot@buildroot.org
Message-ID: <20221025230638.715c53e5@windsurf>
In-Reply-To: <20220920212921.732287-1-thomas.petazzoni@bootlin.com>
References: <20220920212921.732287-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666731999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2tjRRVlWckUq4DXfJwSUJ+T2Ti15tx3ub+4eFj+MEc=;
 b=pwQsNX2pXuk6MVr1BlFw5bJhDg2OswqtbKPD8FPm7/Uc67dXz8zyscyywqXblpMm8tSwd+
 2NBKUoyg8SBejCOiDhRSHYD1kgynJz1pse8vady/WprNXuQwJNDV1e7wJbdWYufSIdAJLI
 WZpYnC+FI7arIdENmtMmaAJ4TudWoQbbp2UgNmXKOtbx5euRb0wzxuSDDSNFwjH01eMz9C
 1eCn44GOhu0SLBLkU92cpgXKPRVJy52HCbAGnNt8c8M6XkkdcbaXOyDVS3EgJQoEPu4Amt
 CXyvasI59wbBmsilRgPzw3SBQVkH4W/I3HlX3LflqTmr6xmrgHv7q4wxgOM3vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pwQsNX2p
Subject: Re: [Buildroot] [PATCH 1/2] boot/grub2: add patch to fix
 CVE-2021-3981
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 23:29:19 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit backports an upstream commit that fixes CVE-2021-3981.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...onfig-Restore-umask-for-the-grub.cfg.patch | 43 +++++++++++++++++++
>  boot/grub2/grub2.mk                           |  2 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
