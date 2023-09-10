Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00750EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B021A60BF0;
	Sun, 10 Sep 2023 16:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B021A60BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1I33MEbElhOm; Sun, 10 Sep 2023 16:43:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1021A60E4A;
	Sun, 10 Sep 2023 16:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1021A60E4A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF8921BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97FF9401BF
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97FF9401BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXP0RV3xgb8Q for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:43:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 472E7400C4
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472E7400C4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 798DF1BF203;
 Sun, 10 Sep 2023 16:43:05 +0000 (UTC)
Date: Sun, 10 Sep 2023 18:43:04 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230910184304.6771b208@windsurf>
In-Reply-To: <20230904221549.42938-1-ju.o@free.fr>
References: <20230904221549.42938-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694364185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yaQCZ1GOezT977hlKBCXd6CSyuTXkDbOFziU1MnO644=;
 b=Vi+K/+rH1iLkm2XJ0gzCHGyeGRP61j3zQNLILZ5nt/PG5eVOkhWMb/vFlvf/3dxbwl6chR
 2793ZPVHtbLuZhtZau+p/0dzCH1FReRoEiGvO+GoOjsxHILNTRVf+76/6vn2w5r2UEq7g9
 P6IvxBvsO6PItfcdjgeywfIK3BSMVO4GUpY5oBNQdQYbjEmV4nfeMrO7+AcX2lhu3qaUME
 Xso6Pgk1HyQ7r1vb4RquVrjpxsYhruNGqd4B/wm3ZPPqbRJXnBG9Zd+Rsmbx1DQBwuei+h
 8lUvN/w7eumvbHuSVMb9LDiWjmluPZK8k/ffyQTpDp+gO/U9riysfPhNlfg4wA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vi+K/+rH
Subject: Re: [Buildroot] [PATCH next 1/1] package/openblas: bump to version
 v0.3.24
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

On Tue,  5 Sep 2023 00:15:49 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v0.3.23, see:
> https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.24
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit 3fa1ae0 with commands:

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
