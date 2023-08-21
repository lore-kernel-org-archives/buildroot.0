Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C309EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F7DC40B5B;
	Mon, 21 Aug 2023 22:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F7DC40B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItNiL-iizRrc; Mon, 21 Aug 2023 22:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7414F40B53;
	Mon, 21 Aug 2023 22:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7414F40B53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BC221BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9D568149B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9D568149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smRIkBSrpr_r for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:13:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2D9681496
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2D9681496
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7925E0005;
 Mon, 21 Aug 2023 22:13:42 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:13:41 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230822001341.7256e67d@windsurf>
In-Reply-To: <20230821175828.42827-1-ckhardin@gmail.com>
References: <20230821175828.42827-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692656023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnISChi1GfHoT7NhymgTOW8WSQOFJyS3pp05GiJ7J7g=;
 b=CSca0NGVI77cici5LVzkGe8vQeICb6RDD4w90TehGRcJyBPLeSZTLfjN8ULXjRrqhY0g1J
 BRRofQ/3fnY1IUwrPSfprZa4VBuT5j+30RV74wx75Ol2LQntMgrZ+zdNUT4sVaWTG4i6Z+
 hmtmbF3SUrhKHeRhY1cyMAhUooip0zitWI/34SVHso16NWdYDlgjAecXgu3CWk1YR0raKH
 bZX0D843YRRF7fMn7SFSrorEcMCzIk2Unn/5xcl8fqT+fHDCWWnMhikTeBjUmZUq87B8mb
 QpJC1JrHc2R7E1rrqabdVo2sFWowUH+pXL1fa7ArcaCIArnxVFgbCQO+WqcI/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CSca0NGV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pykwalify: add required
 package for zephyr cmake
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charles,

On Mon, 21 Aug 2023 10:58:28 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> When building zephyr based firmware, the cmake integrates with
> python scripts that can be run using the buildroot host-python
> dependencies. This is useful for the sdk setups and associated
> build steps for the firmware. In this use-case, a buildroot
> external project can be setup with recipes to build firmware
> images using eabi toolchains and the linux controller software
> to talk to those firmware images using one SDK. This might not
> be overtly obvious from the patches.

Could you clarify a bit what you call "zephyr cmake" and the use case
for this?

> Add the required host packages and additional pykwalify

This needs to be split into multiple patches, one per package affected.
But I think we also need to understand the bigger picture of what this
is useful for.

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
