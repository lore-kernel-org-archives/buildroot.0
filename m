Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5E4C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 10:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A861484AD4;
	Wed,  1 Nov 2023 10:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A861484AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Veua2tvAI09w; Wed,  1 Nov 2023 10:37:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8EEF84AD6;
	Wed,  1 Nov 2023 10:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8EEF84AD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 634E41BF296
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 415F54308B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 415F54308B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp0pAmhQdU80 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 10:36:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D1B9416E7
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 10:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D1B9416E7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F4B31C0007;
 Wed,  1 Nov 2023 10:36:21 +0000 (UTC)
Date: Wed, 1 Nov 2023 11:36:21 +0100
To: Etienne Carriere <etienne.carriere@foss.st.com>
Message-ID: <20231101113621.4e3fe7b5@windsurf>
In-Reply-To: <20231030093002.1047149-1-etienne.carriere@foss.st.com>
References: <20231030093002.1047149-1-etienne.carriere@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698834982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5h9nrBoLtgUQtHaP8RVn/9FP6THuLKuthO28utsDK1k=;
 b=LdyzIfP3OITeOiqcAK58QRW/PUQdzLROA+P691Rl5ewIpqtYKY+GOpZmm5XnHjZ/TL/PV+
 xV6EAMYKeeyBAOp5jg8ixdmiOus6QQHn5BNVPNT96XpUH1Utzkci0BG1sVrR6Tz6vJxHBq
 OPZVyWL/qbfRb8mWVz0vWCJnXe0u9A9pCyq6UH94bOjlbmQ2z2gxTX0zyA5po+7F//pAjn
 eDgdpcOTsaQQ5KHXhiOfR5JorgHW+94Vpz/bavStpiY817x58ZJUzZpZMD8KWsat9nAgt/
 Xas89QJvMTw6Cg6cv0Y4FkyPv/ZRr5IWaShOkOmchM2+H1dy5TLoBleF7Dw1Kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LdyzIfP3
Subject: Re: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 4.0.0
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Oct 2023 10:29:58 +0100
Etienne Carriere <etienne.carriere@foss.st.com> wrote:

> Bumps OP-TEE OS package version to OP-TEE release 4.0.0.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> ---
>  boot/optee-os/Config.in     | 4 ++--
>  boot/optee-os/optee-os.hash | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Thanks Etienne, entire series applied to master!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
