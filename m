Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD85CDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A5FB60640;
	Tue, 22 Oct 2024 20:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-YqXp-CgE-D; Tue, 22 Oct 2024 20:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 321E660664
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 321E660664;
	Tue, 22 Oct 2024 20:55:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46CCD2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27B4760664
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCF6RzLRvyDs for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26CF560640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26CF560640
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26CF560640
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:55:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31A47E0004;
 Tue, 22 Oct 2024 20:55:33 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:55:31 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Anand
 Gadiyar <gadiyar@ti.com>
Message-ID: <20241022225531.2af440a8@windsurf>
In-Reply-To: <20241010-uboot-bump-v1-3-287ffa07e49e@ti.com>
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
 <20241010-uboot-bump-v1-3-287ffa07e49e@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729630533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmyxvnQ65Qft1DdAuuQlMGhg3cw14daUFyhSaoizgAk=;
 b=ZcMHio7b5WNNarWm5q6xornPyz9LI2b4AxVwb7fzBRzjrYpLVhwJCyUPzNvgDOr5ltN0Ad
 JeLWQSciGB5e68MManak/eKve1KRwdGINHtCAKl1q5Chac6c9Lk330AXlDTUGyqWwM/hnm
 J4+LjFkAC7+d98Sj2NiFW9+lzzuMlF+jbhHpnB0Bzx/0oHZMLmjBog19mRhNx6QNzaiVFk
 bncK0e0mTpvZRJUo69AOFDcHF9tOOdS6f2lMkS6ky/0e35Aa61MWQ291nnvJuUYtSAcJVY
 loMWagRaRiXty74SwQeJco3Vty+omaqZJFh4rgQ059/K2oqFTtu5vz+j+0ei4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZcMHio7b
Subject: Re: [Buildroot] [PATCH 3/3] boot/ti-k3-r5-loader: bump to v2024.10
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

On Thu, 10 Oct 2024 18:39:24 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> A new version of U-Boot has been released. Update to this latest version
> to pull in the latest features and bug fixes
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  boot/ti-k3-r5-loader/Config.in            | 4 ++--
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
