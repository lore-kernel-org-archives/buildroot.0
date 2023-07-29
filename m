Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40616C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDF3C82FD5;
	Sat, 29 Jul 2023 08:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDF3C82FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuEDMbiKhETj; Sat, 29 Jul 2023 08:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337F4832C9;
	Sat, 29 Jul 2023 08:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337F4832C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2101BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13F63832EA
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13F63832EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgdLI0fU36Ky for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:59:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18A1582F06
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A1582F06
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB817C0005;
 Sat, 29 Jul 2023 08:59:13 +0000 (UTC)
Date: Sat, 29 Jul 2023 10:59:12 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230729105912.590af104@windsurf>
In-Reply-To: <20230729035308.2475367-1-james.hilliard1@gmail.com>
References: <20230729035308.2475367-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0wJqSUgk2MTDK7VVgvQN4lM1JOslzx8RPdutj3jop8o=;
 b=pmQY21s1BDuBHoaVuABQZeZ8EziSRHgcffSBbtpUVE1kn4T33iTj1Q1WFA3xZZgAUxFawQ
 Yq/D8jut0/hjvubQBp8rE/ngjdr0rY3SJStbKTqSJtLSGwNALY8huMEYQ6dCrk+2g1g/UF
 DU95QagrYf/tMXAkLSzNSp5fGH8cXACPUNuIE6mGSPVFzxWQf2mpPs/TeOEoKOUrDpE82+
 VbH2mXNpZVuyfVd0hUhw4sDZmVpiw4ktRzG9ykf1hyHDG1SsrR/4x8WkgE0s6VIkpRophw
 s9G5H4M2AExJ1DK2IphpahZuHvpSkmOUinQ7tmOamDdhpPZ2VWQZmv9JUBF1sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pmQY21s1
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: bump to version 1.5.3
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

On Fri, 28 Jul 2023 21:53:08 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/linux-pam/linux-pam.hash | 4 ++--
>  package/linux-pam/linux-pam.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
