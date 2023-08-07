Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45919C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 22:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D3841522;
	Mon,  7 Aug 2023 22:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D3841522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PT9TguiMaBcb; Mon,  7 Aug 2023 22:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED19940F4E;
	Mon,  7 Aug 2023 22:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED19940F4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13F2C1BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA6CD81414
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA6CD81414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7sTYEsrBgsA for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 22:04:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E436A813AC
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 22:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E436A813AC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02D60FF809;
 Mon,  7 Aug 2023 22:04:02 +0000 (UTC)
Date: Tue, 8 Aug 2023 00:04:02 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230808000402.3f9596bf@windsurf>
In-Reply-To: <20230807070332.2387171-1-neal.frager@amd.com>
References: <20230807070332.2387171-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691445843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+HQRI2X9UuAqn26BmX7u17OJIto/UZCv/E+bplV7k0=;
 b=CvpIiZttZGfa/AHcP5g/dQIfuCi5tOtHFIsLVLsRa4CbxrRpX39/X96eDoS/UYIPPCikuQ
 B7N0QNfCgosDevxPjhko6qdOCaSOp3ndoYUR62qY0LuvQf9Bd+fYOoTFBMRD+ct1F6P/PU
 aOBnHytl0ymM3wxdcIbPX6r7msXiBb7D5mqtFU1mXv6hNd5lSuJBgyIIeIUkQ3IRnvJQkQ
 ra5cuniG0i3ZobxIK+1P9o/vCT1qJmZWLcJKtvFXP3e1tGLJgLpTUmmYmRTwXtod6vOHVm
 /snR4P31DB8YlkAFZ/F11mFl58Dj4Hdhf9ZuJiQoWqccMrtC3bxAHRdJA89+kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CvpIiZtt
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynq/post-image.sh: correct
 comment text
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 7 Aug 2023 08:03:32 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynq/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
