Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BF8EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA1A820FD;
	Mon, 10 Jul 2023 17:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA1A820FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gd9Ytc-2eYun; Mon, 10 Jul 2023 17:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A93D820EC;
	Mon, 10 Jul 2023 17:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A93D820EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 362BE1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FA2B82125
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FA2B82125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y32XOEBNMCjm for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:47:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED181820EC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED181820EC
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:47:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D49C20009;
 Mon, 10 Jul 2023 17:47:10 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:47:09 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230710194709.21b9b8b0@windsurf>
In-Reply-To: <20230611112247.717566-1-bernd.kuhls@t-online.de>
References: <20230611112247.717566-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689011230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j01SdMzh9XOvotDUpsivxGCXE87VMtOJRzY1r5JRKh8=;
 b=f5mfyPqpH+JJDjkP2XClpwWOwII7a+H47hOfRJPUmvisWDNC5b3gMSZODHSSfk5n8TASgd
 ZRDaQrkv4t2vTDZx9qdx55NryzC0Xx5HKaHXOMmfD24ynEqRCYRqr8oD91nuYRgO/jCQ46
 nnGv7iMGkt3suiWKKJ+H0GR34lEBOUl9ZXT7bbJkJrOCv/OVPQWRSwQF69HwlMed7CLI3x
 r/lWPCt2bUOhO0SmAQVhaxfR32ieL8skERXNHbAgQh6ROPFiUyzohdOHDrCpb0IC0DI3Gj
 iBG521bCeKJ/aP72PTF+V3m7AnfRKWW3xzfKcCUIp3VLkrig37RYohLDwTDOmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f5mfyPqp
Subject: Re: [Buildroot] [PATCH 1/2] DEVELOPERS: add Bernd Kuhls to various
 packages
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

On Sun, 11 Jun 2023 13:22:46 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  DEVELOPERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

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
