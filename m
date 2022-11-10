Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3F5C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 07:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25AC5401C2;
	Thu, 10 Nov 2022 07:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25AC5401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fR2_f2UigDF; Thu, 10 Nov 2022 07:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61BF640156;
	Thu, 10 Nov 2022 07:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61BF640156
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6FDC1BF5A3
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 07:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8544F60C13
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 07:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8544F60C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gsttEN1Tei2 for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 07:58:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D4E76066D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D4E76066D
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 07:58:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B3A1C1C0004;
 Thu, 10 Nov 2022 07:58:14 +0000 (UTC)
Date: Thu, 10 Nov 2022 08:58:13 +0100
To: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <20221110085813.14133f2a@windsurf>
In-Reply-To: <651aba63-797e-a11c-8380-a331361a5678@grandegger.com>
References: <651aba63-797e-a11c-8380-a331361a5678@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668067095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjPGkwj932YuANSuOHAkaboYqF9CKVd7w3qOs1l6T9U=;
 b=XQtNH74EinJZdl7HCeODiU0Rl9hkuCYvNdXForG7WyMvF5rTxLBurDudTn3i4rmawvnflQ
 WAWrojIyDHNFQyLhm0FEipkco5oI4WGdUS6bvg9ceXl0Wi2k2bADNVG3vrPx3CJcbGrMJk
 Zsdewc7imUABUlCzyqOuEO421JKSd+il42OM3uBmP8sudJTV+sQGKrrXzq+4WkBh/dptfG
 D/FfEozPPLMgd679+XAsuSXcluOL2y9R1yEjDB203/hGd6fzq4rY7Tf+b47WA7+zIInxjC
 cbCcM62Sye8jb8Ndch268hhjBA/WCcSjnyrb8jlPUDIlDzY/+bZqArlVYm+gjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XQtNH74E
Subject: Re: [Buildroot] [PATCH v2] package/udisks: add config option to
 support mounting in, /media
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Nov 2022 08:49:58 +0100
Wolfgang Grandegger <wg@grandegger.com> wrote:

> Support mounting in /media instead of /run/media for compatibility
> with the Filesystem Hierarchy Standard (FHS). This is also required
> for backward compatibility with udisks1.

Thanks, looks good, but it's still missing your Signed-off-by line
here! :-)

Could you send a v3 with this added?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
