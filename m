Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC28EC02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 12:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69CB8211A;
	Sun, 19 Jan 2025 12:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2NvoYGMwhEv; Sun, 19 Jan 2025 12:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCCA882C84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCCA882C84;
	Sun, 19 Jan 2025 12:36:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF48B69
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9400A404B6
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0B7EwVo8w5l for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 12:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5779C4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5779C4012F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5779C4012F
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:36:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B9F6E0002;
 Sun, 19 Jan 2025 12:36:46 +0000 (UTC)
Date: Sun, 19 Jan 2025 13:36:45 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250119133645.5b481c1c@windsurf>
In-Reply-To: <8cb7eeb2adac1069fd2d6fcb8565df66@free.fr>
References: <20250119084511.2816892-1-thomas.petazzoni@bootlin.com>
 <20250119084511.2816892-5-thomas.petazzoni@bootlin.com>
 <8cb7eeb2adac1069fd2d6fcb8565df66@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737290206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpDshtKdsivNYZCfkGtiYMJyyi4HCyOpbpoOP3s/AyQ=;
 b=QuHEuEUc93M82F5gIURDJ/kBLn9H9S/C2f3sPLdIbesNWI7vqPkO9uj/KnjCm0oJSDLLRE
 Bm97cGrQhLIORYSqXnkJMo1StL889isobrdxnXtfQJSCoUkgrQrFhw8zP81CIpPPPxuJUG
 Q2NassvFK8sOTo1gOsgO1MqQ918x9fxE/uB3IBDV+nW/renh+GjI/EYYN1D0VlrJiorYip
 HrKMNcwsvNtq6HvLwPSthh3eC6SivycruWn8kVD3NNg5GT0sAf5DDpk4uhL0YyuEPwJ9cd
 mN60Aci7hqTF2nM4aA9eKDpbsA6QgbzKm622J2/6bIxVAI0ad+yITGBdt3tuRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QuHEuEUc
Subject: Re: [Buildroot] [PATCH 4/4] package/gnu-efi: change upstream,
 bump to 4.0.0
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

Hello Julien,

On Sun, 19 Jan 2025 13:32:02 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Thanks for the patches! I applied patches 1 to 3 of this series.

Thanks!

> For this patch, "make gnu-efi-legal-info" is failing. See below.

[...]

> Can you send a v2 with those license info updated, please?

Dammit, I had forgotten about the basics. Thanks for spotting this, I
will review the legal-info details, and send a v2.

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
