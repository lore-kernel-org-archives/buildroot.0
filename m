Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DA8EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81826103C;
	Sun, 30 Jul 2023 21:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81826103C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UpdK8pur3R7; Sun, 30 Jul 2023 21:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E07C61065;
	Sun, 30 Jul 2023 21:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E07C61065
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 981FF1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3885C81D7D
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3885C81D7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34UGu14AhaLe for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:36:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF38181BF4
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF38181BF4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 849A61BF205;
 Sun, 30 Jul 2023 21:36:02 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:36:01 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230730233601.03783e9d@windsurf>
In-Reply-To: <20230612160204.1474380-1-bernd.kuhls@t-online.de>
References: <20230612160204.1474380-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690752962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtPH1qOW94LTX/DddfBsMAOtEGTOPAoh87FNU/m+NKU=;
 b=Pdt12WsJJRyraxEDBSo2GoVRhDp7FE1Qtt6utva5is3FExOK8d3rfMfAxJXIDNF7fmo5QW
 4OFWoJXu5d9THQdU4cCVfpZRRHLH8lb9EtZFaXXxIC95tyV8vCEY8PsGF3fIH5oqK7/xG0
 tDbWJVpZktULz/JQazMoxWES8zqw3fXjRTV0sKam66WUIJrngby1cffR/AGO49qkzOHv9c
 UW1QEsQoGDwBfkb3g5ObxMbk+8qdeG8WvRfRhZbDlz4ss1tkJKAvwVSNRHeuScdRP68oa+
 klehoWvSj8KxfzVc1ceRE1KI21vLvnOZM5A94AzfNvUPYmyK3iQK2AzlWcCiJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pdt12WsJ
Subject: Re: [Buildroot] [PATCH 1/1] package/speex: force arm mode instead
 of Thumb mode
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

On Mon, 12 Jun 2023 18:02:04 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fix the following build failure:
> 
> /tmp/cclxE0xY.s: Assembler messages:
> /tmp/cclxE0xY.s:118: Error: cannot honor width suffix -- `smlabb r2,r0,r4,r6'
> /tmp/cclxE0xY.s:134: Error: cannot honor width suffix -- `smlabb r9,r2,r2,r3'
> /tmp/cclxE0xY.s:812: Error: cannot honor width suffix -- `smlabb r1,r2,r2,r6'
> /tmp/cclxE0xY.s:1202: Error: cannot honor width suffix -- `smulbb r3,r0,r6'
> /tmp/cclxE0xY.s:2298: Error: cannot honor width suffix -- `smulbb r3,r0,r4'
> /tmp/cclxE0xY.s:3133: Error: cannot honor width suffix -- `smulbb r3,r2,r5'
> 
> Fixes:
> http://autobuild.buildroot.net/results/c55/c557ca72832c942f201b4a21f913f74534857cc6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/speex/speex.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
