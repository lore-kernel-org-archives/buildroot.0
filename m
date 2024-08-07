Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB47C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D02ED406AA;
	Wed,  7 Aug 2024 22:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XgeqRD6T_mi; Wed,  7 Aug 2024 22:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08D940722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08D940722;
	Wed,  7 Aug 2024 22:15:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 707931BF321
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 741AE400D1
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tziLOTr9Yy8 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3879D4025D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3879D4025D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3879D4025D
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:15:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70C80240002;
 Wed,  7 Aug 2024 22:14:59 +0000 (UTC)
Date: Thu, 8 Aug 2024 00:14:58 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240808001458.020ce0a3@windsurf>
In-Reply-To: <20240807-tfa-src-update-v2-3-f2cd6166db5f@ti.com>
References: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
 <20240807-tfa-src-update-v2-3-f2cd6166db5f@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723068900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAQ5c+WtNJ04oUke0zTLm4n6y5mHPfsWperK11Ku/d8=;
 b=n+s061mq0sKNlnMtSnKeYGvSzGcAaaSXK089EUmRJTq619zbyrbDx2rF2HCNBBU5Aw2LmQ
 fLXzvN0H6csWkrRwL0GGPUIEFa9YJ20GHED4TcVNhRToB5uMNZQIsc2MgKz7EWtXvVAEAr
 o5i2Zg34KmiwwGJV8ZPYBkZjUglmOxCCOui+XYfA/SpylWNJBJICgEwPGDizGIKF1qHVUD
 iExebjsChwrYAtD3dlaM2DTQI1msomk9FaK5btmhRmI3ptJePJsxr8r886cZPo9NkX834/
 F7b4pm8oTzjPpHo6wquPpcc4BWKKNdiGvRecoCUTjZX/tVGzijyp+rRizTailA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n+s061mq
Subject: Re: [Buildroot] [PATCH v2 3/4] boot/arm-trusted-firmware: bump
 lts-v2.8 to v22.8.20
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
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>, Bryan Brattlof <bb@ti.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryan,

On Wed, 7 Aug 2024 12:48:21 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> bump the lts-v2.8.x branch to v2.8.20
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Typo in the commit title, which I fixed. Also we had a patch in
boot/arm-trusted-firmware/lts-v2.8.13/, so this patch needed to be
checked: either it's upstream and it should be dropped, or it's still
relevant, and it should be moved to
boot/arm-trusted-firmware/lts-v2.8.20/. The latter was the right
choice, so I fixed that as well.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
