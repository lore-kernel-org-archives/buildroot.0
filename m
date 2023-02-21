Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC052C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BEF581B14;
	Tue, 21 Feb 2023 21:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BEF581B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1-j0-eDLebX; Tue, 21 Feb 2023 21:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A477B812B7;
	Tue, 21 Feb 2023 21:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A477B812B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5FF1BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8EFD60DA0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8EFD60DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3herUB4nM224 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:54:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED2860B3C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ED2860B3C
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:54:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3C552C0003;
 Tue, 21 Feb 2023 21:54:07 +0000 (UTC)
Date: Tue, 21 Feb 2023 22:54:06 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230221225406.1bb8d63b@windsurf>
In-Reply-To: <PH1P110MB1603A4AA1638838DA56BAA069FDA9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20230119183026.3428277-1-casey@xogium.me>
 <20230119185041.3430421-1-casey@xogium.me>
 <PH1P110MB1603A4AA1638838DA56BAA069FDA9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677016447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOMydoUOxNNIzk202fKB8Ds81oJVn+uYuXeZohMX8mQ=;
 b=bBvnJTa4JbRpI+/5pK8EwEI35tRmOR6vO3WD3pH9inomS2INcDakl/+82ZAiNvikXxTcxs
 2IdYT9rHj33ZtQ8lDj/6ngGmONCWekWweQZPoRO/+eKQEw41X0td6dwL7UiaqGtntYpj3F
 qh1PeiGUOgffJh07fTKv3QExN4ZgXWGJ4/M8TGzUV2KmuCyrt5qOc7mmIwznvzhoA/sb4x
 6jqWNzN6hYrF+eVSFrNhguViy9UiJDPuWnwM00ZlK0maP2dXFt8CTn34R2SUtMPIXs4yvQ
 ts2OQfphPr3o4kv99Mb3mGuyfKmBte1w0Ypl/RPP5wSFFJ/+LNmE5ccY6KQJWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bBvnJTa4
Subject: Re: [Buildroot] [External] - [PATCH v2] boot/arm-trusted-firmware:
 Barebox available as BL33
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

On Mon, 6 Feb 2023 13:36:09 +0000
Vincent Fazio <vfazio@xes-inc.com> wrote:

> Does TFA allow multiple BL33 images to be defined? I don't see a guard if some other package such as U-Boot or EDK2 has been enabled as well. 
> If only one image is supported but multiple images are supplied via BL33 on the make command line, is it last declared wins?

This is absolutely true, so I have submitted
https://patchwork.ozlabs.org/project/buildroot/patch/20230221214904.454053-1-thomas.petazzoni@bootlin.com/
to move to a choice..endchoice in Config.in to select the BL33. Thanks
for reporting this!

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
