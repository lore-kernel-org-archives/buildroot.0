Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4894FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E6483365;
	Wed,  1 Jun 2022 21:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mIHGzMCHYIi; Wed,  1 Jun 2022 21:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0932983300;
	Wed,  1 Jun 2022 21:43:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1F41BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AF7683300
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlsF9fJTj6VH for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:43:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86896832C9
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:43:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7309A20003;
 Wed,  1 Jun 2022 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654119791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lanlkYy/2n3+DSzOw7DQGr7GXWiRZS1SxvJY7vKt5xo=;
 b=ZbYI/aTmUh85v99oJkNujbf0Pq2UOBEuYLV0tqMi97l+jrGqjGM2Vh72XqpzgVNs2JlZty
 S+1KreqK2LQJ4xOVe3ZFeQY0zaeJ8HR6v4Qy686/BM1cQrp96eqlVKqkPwoqP1SIx7D3aS
 yCgRasbQJccKwBvIFqA/tn2cjmv+l1KwJ1hNwfkUYilbclbCMdZbVvhmtqfvx3TENM1w9C
 6/YVK1R36Zwg2UZH1H9Mec9qCPpxChldYXaEwSH9cjTNJxm8MZlFY5t5QrYPOF83sNyuwy
 xPTQHB4RzuS5S4WqqAc2VZd7michO1eoYw1CkrmpS6Uep8chb2+2ywoHXne0wg==
Date: Wed, 1 Jun 2022 23:43:10 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220601234310.2a956189@windsurf>
In-Reply-To: <20220531105902.204022-5-heiko.thiery@gmail.com>
References: <20220531105902.204022-1-heiko.thiery@gmail.com>
 <20220531105902.204022-5-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 4/4] boot/uboot: bump to 2022.04
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Tue, 31 May 2022 12:59:05 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Since U-Boot 2022.04 a host dependency to gnutls is required if the
> U-Boot board configuration has CONFIG_TOOLS_MKEFICAPSULE enabled. So
> introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_GNUTLS to
> solve this problem.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I've split this into two patches, one doing the bump, one adding the
new option.

Regarding the bump, you had forgotten the update of uboot.hash with the
hash of the 2022.04 U-Boot tarball.

Also, there was a minor check-package warning related to the formatting
of the help text in the Config.in file.

So, overall, applied to next, with the above issues fixed. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
