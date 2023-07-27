Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE86C04A94
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA928407A;
	Thu, 27 Jul 2023 21:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA928407A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C86tUdXIQV7L; Thu, 27 Jul 2023 21:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5E884073;
	Thu, 27 Jul 2023 21:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5E884073
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDC931BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1BAE41FF3
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1BAE41FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HucoxmGmFVme for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:47:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28A4C41FE7
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A4C41FE7
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6BC4C0003;
 Thu, 27 Jul 2023 21:47:04 +0000 (UTC)
Date: Thu, 27 Jul 2023 23:47:03 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230727234703.7af923f3@windsurf>
In-Reply-To: <20230727164224.1945786-1-james.hilliard1@gmail.com>
References: <20230727164224.1945786-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690494430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P++dZF+45ZkVv7QPbQrn4jyNRL9L3KnQFszNVX/5Xuw=;
 b=ZpWgRQelysESZ4mjfAK5F9XHdZwRF/qkmS0LGdiN8z52WcZ6FXpZ8x13Qid8kXbhUu/PBs
 KJovRSoQxjEZQlfAl3ZZWMqVh6mggpECVDGAIJSc7Nywt0bNege2jp9u5Lx1PKkIjILHx3
 Mv9tZkCoPnUCp3tCvPRpdmFoqHLk3eGPLNdr9QOtzj118A6EHJLV75JOzt/hcupOkXRjd1
 t/LGtYtPI8EQ+kpggAVX2Tej/7uB61BBNlsNcjF8DGMipzvJMjBhRMmLb05GpAj2DHp5Dj
 uKRd+24rhKsMfFuZq5ZSdWkPcNPTHWpDDZipBkMX5zFKK2r/GUuc5d6TtKagcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZpWgRQel
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 10:42:24 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-rpds-py/Config.in           |  8 ++++++++
>  package/python-rpds-py/python-rpds-py.hash |  4 ++++
>  package/python-rpds-py/python-rpds-py.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/python-rpds-py/Config.in
>  create mode 100644 package/python-rpds-py/python-rpds-py.hash
>  create mode 100644 package/python-rpds-py/python-rpds-py.mk

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
