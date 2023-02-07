Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303B3C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 08:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DAC81C93;
	Tue,  7 Feb 2023 08:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7DAC81C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5Jltc01Q--F; Tue,  7 Feb 2023 08:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B421781D2D;
	Tue,  7 Feb 2023 08:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B421781D2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCEF91BF30B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA88441775
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA88441775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5doyo29K6tPF for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 08:24:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A08410C2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54A08410C2
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 08:24:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6259240014;
 Tue,  7 Feb 2023 08:24:48 +0000 (UTC)
Date: Tue, 7 Feb 2023 09:24:47 +0100
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230207092447.563f22a5@windsurf>
In-Reply-To: <20221127144819.2022348-1-ricardo.martincoski@gmail.com>
References: <20221127144819.2022348-1-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675758291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NNgpnrUdcpEMoN/V0oe7f7dUWdfkW61izFTi5CHkhE=;
 b=dmpl13hSiVBAw1WLCwZ3JwgUXZsTOJg6S9GzLBv/2Fo7ZhJmuYKBhCg+Hdfdv+8qDiDJ9X
 mJM3cVIYfmapORtMQTkdV95c4QH65BTnQ4b4KrqCYioRtJGZsyJVSfCDiJ8xerG9ZshOn+
 uoroIpMm0sPRqSZPj1o+uPpYh4cmzDYogBhnq3FYRzpVEVdkpi/FZZH20NCaORyMr9buHf
 OBcz3bG+ev6PxDSBbyfqvCK9nMKOnA6MX1wRL1nkMlg6JOpht9VBoRJZBy+GfRHGQCquNf
 wgSmvELU3e86OxajV8fqDfjuocdL0MI+dBwou6qy77E0KJLA1NxbLBD5i9xXvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dmpl13hS
Subject: Re: [Buildroot] [next,
 v2 1/2] utils/get-developers: bail out on parsing errors
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

On Sun, 27 Nov 2022 11:48:18 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Currently 4 types of parsing errors/warnings can be found:
> - entry for a file that is not in the tree anymore (warning)
> - developer entry with no file entry (error)
> - file entry with no developer (error)
> - entry that is not a developer, a file or a comment (hard error)
> 
> Currently only the last one ends the script with -v with error code.
> 
> Make all 3 error types into hard errors and bail out at the first error
> found, because the rest of the state machine is not designed to handle
> malformed input.
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - do not change warning to error, an entry for a file that is not in
>     the tree anymore is not a syntax error (Thomas)
>   - add the lineno on the warning messages in the next patch instead of
>     this patch

Both applied to master! Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
