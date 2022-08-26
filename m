Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD4AECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 08:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BCC0404B0;
	Fri, 26 Aug 2022 08:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BCC0404B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdtxKqAfq1nO; Fri, 26 Aug 2022 08:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3491040474;
	Fri, 26 Aug 2022 08:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3491040474
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FD141BF86D
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 08:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B05F40474
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 08:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B05F40474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dx6VkjrBNo8U for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 08:06:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E10400F1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8E10400F1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 08:06:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D9A711BF206;
 Fri, 26 Aug 2022 08:06:45 +0000 (UTC)
Date: Fri, 26 Aug 2022 10:06:44 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220826100644.75da7ed9@windsurf>
In-Reply-To: <20220826064758.3968647-2-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
 <20220826064758.3968647-2-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661501206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvn8w2vzZG0BnPrH61U1ZsrOhYDNaDKDh4aP5zOaXrc=;
 b=cgq2v1mQpjcNIvqcMlkebI2tu12Kj3d/Tw7rNsB5IBdp8wZYl60ppz935/eEuWQR2bMk0q
 Vl7KFHLZGnzXY7dF7S1oG6z+ZOtjPt/PyHdVF9pA/Tb6RDb5Ato41MRWnyFK1isqFG1lot
 PvMceAAwRFsaOko8eGg1BfiE7X/1Ev/emM91iPDjIvdDj2gCPrLeyct7dP50HFDp2ut7ev
 hl8O92Htnn7pEDgB1q+zlbbNlpY13p3/DDdw/LmXR4iRcJR15CRwrgzvUwweKbhsBNVtoO
 vS7dUiWRCm1tTNpVY8RjuMEsTm+pMUoO6hpwrxTmgqWdGG2fs8m9dRHOmqs3nQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cgq2v1mQ
Subject: Re: [Buildroot] [PATCH v2 01/29] package/qt6/qt6base: Add qt6base
 hash file
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
Cc: "Yann E . Morin" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Aug 2022 08:47:30 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Hash file with only the qt6base tarball hash

We need your Signed-off-by line in all patches. Look at other patches
submitted on the list for examples. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
