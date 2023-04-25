Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDF5C77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 11:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C01BA4092D;
	Tue, 25 Apr 2023 11:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C01BA4092D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rD2mSgAxuqTN; Tue, 25 Apr 2023 11:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBBA4408F5;
	Tue, 25 Apr 2023 11:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBBA4408F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E52A31BF2CE
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 11:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A74CC60761
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 11:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A74CC60761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_T2CB1G79Wo for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 11:09:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A85860742
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A85860742
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 11:09:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F82D20004;
 Tue, 25 Apr 2023 11:08:56 +0000 (UTC)
Date: Tue, 25 Apr 2023 13:08:55 +0200
To: <Jamie.Gibbons@microchip.com>
Message-ID: <20230425130855.0874ad36@windsurf>
In-Reply-To: <01db737b09ac273925c623c44b44a48a366871e0.camel@microchip.com>
References: <20230425081444.1441521-1-jamie.gibbons@microchip.com>
 <20230425081444.1441521-2-jamie.gibbons@microchip.com>
 <20230425114431.5461f144@windsurf>
 <01db737b09ac273925c623c44b44a48a366871e0.camel@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1682420938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BG8o9YzhrG+Rpd+1j3Wuez6fRrnJUCXKZc0xy+jdH9w=;
 b=E63nss5Auv5Ym5+gejExLLIN1NS63/arOFHf5iOV9Fj/538U+MSRyEraOowGXzCmrwDWbT
 SvcrA4IhbR0FyRCiXRyzeAXD2gMXLpNoacEMzIMHvB29wOW+gt0RcjaWkrweW7dLto8jOh
 HvSLFHCcjH1wDAvCZi1ffp5AeeQ0ZTd6rOGrudZrVnBYJb7nzc1tGYetPAiSUADmWQaQlo
 jBngHU4wU1EHU3P0aQbJfbPGulkzi+vXj86LO6e6uSLneQhulk+pAJa9CafP2Yy/ul8y8/
 20b9p7cpQKgN/8iTf+PKlMb18Z+fnmAj7ihnHayaREIWIl+qhhWLBpiU9uuWaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E63nss5A
Subject: Re: [Buildroot] [PATCH 1/2]
 package/microchip-hss-payload-generator: add host package
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
Cc: Valentina.FernandezAlanis@microchip.com, Conor.Dooley@microchip.com,
 Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

On Tue, 25 Apr 2023 10:18:41 +0000
<Jamie.Gibbons@microchip.com> wrote:

> Thanks a million for your feedback. I have tidied up and made the
> changes you suggested below. I will update all in a v2.

Please wait a little bit before v2 if possible. I also had a few
comments on PATCH 2/2. I hope I'll be able to review it today, if not
tomorrow.

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
