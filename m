Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A08EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB607813A9;
	Thu,  3 Nov 2022 21:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB607813A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Om0xZm5LM0M; Thu,  3 Nov 2022 21:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F9B8135F;
	Thu,  3 Nov 2022 21:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F9B8135F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A26421BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E41661082
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E41661082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VpMB79pT2FBH for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:10:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B6CC6104B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B6CC6104B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:10:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 290AB60002;
 Thu,  3 Nov 2022 21:10:51 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:10:50 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103221050.3a3cf4f8@windsurf>
In-Reply-To: <20221103210719.3477688-3-james.hilliard1@gmail.com>
References: <20221103210719.3477688-1-james.hilliard1@gmail.com>
 <20221103210719.3477688-3-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tspjGS+OG6aencoVIyK0QZanD8yJizgWtSIWbyYr3k=;
 b=Ir3xUGNHIuy1x80Wk6g9Ftb9se/5T/+IQ8e5iotQglFhjS8AFKiJSvhXyP8JUw8R5k6Tal
 hidbAeFwMB4Gt8C+78Rt4lLbZCSSvDzsHB0QU+9Vxdqd1cEtYafWj3ShCa4ed9t5oRxamn
 yiM+0hwKqgg1cg6uMPdJVBbOVUT2kUbzS65+E4EAxNjsoPl4NQsDDL0knsvx9WVNF8vlqv
 z9Fy25lAi1KPKQcmgLxPCkV7CnkZkEY63Rm5k2hG2MHvxzxmp25glfC+L/YQAw4iufy+7c
 Jew9ZuQXCUpV49J7hF1+YrI5o1IMj1xb2JHF6xP6aDH83l2ZClZhvaCyytsdKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ir3xUGNH
Subject: Re: [Buildroot] [PATCH 3/3] package/python-wtforms: bump to version
 3.0.1
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
Cc: Lionel Flandrin <lionel@svkt.org>, Grzegorz Blach <grzegorz@blach.pl>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 15:07:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new host-python-babel build dependency.

Is this a legitimate build dependency on the host, or a bug where it
confuses it being needed on the host at build time vs. being needed on
the target at runtime?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
