Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5308EC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2695422EF;
	Tue, 26 Jul 2022 16:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2695422EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hAviHhsT6Jf8; Tue, 26 Jul 2022 16:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 989D8422C0;
	Tue, 26 Jul 2022 16:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 989D8422C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C43C1BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBEF34014B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBEF34014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_ofIuX41vDa for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:46:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCE8B40148
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCE8B40148
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:46:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F7441BF208;
 Tue, 26 Jul 2022 16:46:28 +0000 (UTC)
Date: Tue, 26 Jul 2022 18:46:27 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220726184627.064046c2@windsurf>
In-Reply-To: <20220725125147.19057-1-romain.naour@smile.fr>
References: <20220725125147.19057-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658853988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POxxOQ5oyAL8YJTom6Qvypgsyc7/4CErYclI6WDnsIo=;
 b=esVohwN+8UlJK0A9igkrquB0UMtinGZ6QEw2blDAEdnhThR4JmQW6ONoydtXVksbc6iRmz
 ukzYuw7iod5tezb8HojKqO7WfUs7zFCllJxNSCneUwlNirI7kJ7j+qIvZe9leBmLgV0Vix
 uEc/IWpI8Vzn8lzCxmpXvhAd2+9G71j9zEwNsYdiEbsiNQ/269lXUPP2OJnQcDc+/b7+pB
 eipmTMpoZULkMEAsI42xht4UvAKAEQEiiZwxNCXTKOQeQSnxgByKvk5MpZyAZAKLlTdfM6
 +0ufDEGAcCFLbhuZ4JKg4aYCb/Q7Yl3j/4/DNX2xSBe+mGsb8JIRzTuXQKSDXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=esVohwN+
Subject: Re: [Buildroot] [PATCH] package/gcc: disable split-stack for
 non-thread builds for gcc powerpc spe
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

On Mon, 25 Jul 2022 14:51:47 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> The toolchain for powerpc spe can use uClibc-ng without thread support.
> So we need the same fix as commit [1].
> 
> [1] fff68f75b3519cadb2639fde2296b26db919d79d
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch

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
