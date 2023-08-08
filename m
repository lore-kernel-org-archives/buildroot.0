Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F12C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF1C5812FE;
	Tue,  8 Aug 2023 18:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1C5812FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRfesZGDxPyU; Tue,  8 Aug 2023 18:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49C24812D9;
	Tue,  8 Aug 2023 18:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C24812D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71B0C1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC5061192
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC5061192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npG-UyPj8ibz for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:08:49 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27D3861191
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27D3861191
Received: by mail.gandi.net (Postfix) with ESMTPSA id 216F160002;
 Tue,  8 Aug 2023 18:08:46 +0000 (UTC)
Date: Tue, 8 Aug 2023 20:08:44 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230808200844.6db0eb89@windsurf>
In-Reply-To: <20230808172625.20598-1-ps.report@gmx.net>
References: <20230808172625.20598-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691518126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vc6JAL5D4rnFF3W74sb02p14bz5v701/vZ3sVl/gr3I=;
 b=XqOO8CPe4bTm+lbDaSbw+rOhUQD4Rl+ht4CNRlzdVtH7IUGpEcYdbuPAy/yklazpvhwUnM
 rgI12KHKiTFdCzlLHv9YDwbc6ujkqipm2IZEZhCjOB30YWWCSqIHbQc6AD8SqyxwXVztTl
 PmSJHKqret+BWHkpvD5I+9s3Ne6AQSJK/BxYi92GjDCkEeF8euM+0BiSfPn+lZspccVEoC
 H6dgFVL2YnZxuRX5z36tINwFTJANDZ64WkGjgdq2U/aR54XzUHD9yhGUF193FgYy81msO2
 3KI8XxeGBFgJk9zDM3SEpWGHNlKoZgD8ojeycLA7e1mHFijGvBroYJmbcLzV9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XqOO8CPe
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.2a
 (fixes CVE-2023-4012)
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

Hello Peter,

On Tue,  8 Aug 2023 19:26:25 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes CVE-2023-4012 (see [1] for details).
> 
> [1] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_2a
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

For security bumps, we like the commit title to be:

	package/ntpsec: security bump to version 1.2.2a

and have the details of which CVE is addressed in the rest of the
commit message.

I fixed that up when applying to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
