Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1234DC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0C7B60C13;
	Mon,  6 Feb 2023 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0C7B60C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xo13Y82aZTF; Mon,  6 Feb 2023 21:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0515C60C11;
	Mon,  6 Feb 2023 21:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0515C60C11
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CADEA1BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 592C960C11
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 592C960C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfgQfkZDnV5H for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:28:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8290E60C0E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8290E60C0E
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:28:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F0711C0009;
 Mon,  6 Feb 2023 21:28:02 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:28:02 +0100
To: buildroot@buildroot.org
Message-ID: <20230206222802.4e235104@windsurf>
In-Reply-To: <20220924205358.1489231-1-thomas.petazzoni@bootlin.com>
References: <20220924205358.1489231-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675718883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfE7OllY5zDdDAS36zlgtJB2g4CVVXAGaorcW3A5jVU=;
 b=pbjVMTC24qpSHlW8q4zD+6S+ntfm7XNxbHGCb5m94IMQKILdJwAgB3e5rnPRv5Y/pXUEbk
 B3dZ7BH+iyLvRZkAi96JKY5lxNsGwpRKkfn7bfYW3us7Cf25g++uV+S8j/oacP7l0KfP8b
 ga+S5ssNm0i4U7XgXYs3cesSr59Np+GM1aSowoFzddZQJIkwzgpQ6BjqAHWWuOXxzgMD/P
 x0B06VHgl9z18+Ywg8k4XYOCq6DX0qTfwy0xMH0W0SLah57rhN95eDRG1QWE7Y5LcFxW3W
 lsAfzfNuHdqKeepcMRffw1WuLmqDcAWW6WzzYcMGThTXuLzQJofCdjYpmdD61g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pbjVMTC2
Subject: Re: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-bootlin: update to 2022.08
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 24 Sep 2022 22:53:58 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit is the result of running
> support/scripts/gen-bootlin-toolchains now that 2022.08 toolchains
> have been made available.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../tests/toolchain/test_external_bootlin.py  |  163 +++
>  .../Config.in.options                         | 1098 +++++++++++------
>  .../toolchain-external-bootlin.hash           |  798 ++++++------
>  .../toolchain-external-bootlin.mk             |  454 ++++---
>  4 files changed, 1547 insertions(+), 966 deletions(-)

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
