Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CC0C0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E87A340128;
	Fri, 21 Jul 2023 20:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E87A340128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ty_tSDlC4_XF; Fri, 21 Jul 2023 20:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35A4E41863;
	Fri, 21 Jul 2023 20:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A4E41863
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD601BF20B
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 652C741FCF
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 652C741FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpCXyumZHPC7 for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 20:59:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 039D941FCD
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 039D941FCD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 223EC20003;
 Fri, 21 Jul 2023 20:59:30 +0000 (UTC)
Date: Fri, 21 Jul 2023 22:59:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721225929.4990609f@windsurf>
In-Reply-To: <20230721151657.3457086-1-bernd@kuhls.net>
References: <20230721151657.3457086-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689973171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QC8Z+MiykrMVts6F44m/C7hqW9MLoV+yGSJzEGkwP3E=;
 b=l8IWWWJrGzTOyFkuUNmN8wzE18O2oCPmTknvnQHLk/UuJolA81SCfgUn99BF9+hr61tZ5E
 eyOjp3EjDuyTzt6Vdr2mQXlI/oPaaRfk14D9frajqmpJ8mhiVkmONt6gzRjMgdlViHJo7P
 CE/nrWB97DienolGBCv2l0pcPhL9VhVGPTFelzD2fsHDUD/IyOHcrfh2lX+fxg7Pd7C7pl
 8dSsyWQuQym+d6IfBhNmNoSEFH4fh94Dh68hkNYs/depxWUeSmowDFBwZP8EVOKi96PhDa
 Q9CkURRXx2Ei2Cgkf9Bru3pot5UTpIhQM9oAvCzZHEdEoRvDYbzf4CTJp+la4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l8IWWWJr
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: add upstream patch
 to fix openssl3 build
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jul 2023 17:16:57 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed unneeded patches and replace them with an upstream commit.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Sorry, saw the upstream fix too late.

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
