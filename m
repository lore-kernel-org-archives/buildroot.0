Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D849C678DB
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 13:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1620B40B79;
	Fri, 17 Feb 2023 13:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1620B40B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUJuD8l8nAbW; Fri, 17 Feb 2023 13:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB7B405D4;
	Fri, 17 Feb 2023 13:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AB7B405D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 029FC1BF34D
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 13:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC46A60737
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 13:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC46A60737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5xyXvo7j2a9 for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 13:48:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E996061B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5E996061B
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 13:48:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3288620005;
 Fri, 17 Feb 2023 13:48:15 +0000 (UTC)
Date: Fri, 17 Feb 2023 14:48:14 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230217144814.5f8689bb@windsurf>
In-Reply-To: <20230106210827.30007-3-ps.report@gmx.net>
References: <20230106210827.30007-1-ps.report@gmx.net>
 <20230106210827.30007-3-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676641696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bqEzDW+Ytp8NZDETkEzpBoDKkzs9LTkGM80biQUj5s=;
 b=jly78Wp0Gaaz6Zsrw7WWTIqlA2pUu/TzkP9tb1OzT0dWrz4JMgNCQxcumwYvEvM+n7AinP
 g9NefzVaZOy2bPa8bPn0p3pASxPx5HhL0lALYHawrOkcz27t0e0Vfj/GtlMmkCTUAaG8HL
 NezpP5FeZhEgSxvXecUtOWdpaA8qlafFeuS7nuk2QmbM6MEbtVlum/pyZGHeIBKmCavlkA
 DVqtcjGQ/+cjG9Sl7QzqfBamqkbCUyglaZfCkzI+UNHUb/9BVS+P1SpoZzHEGMnZSJkj3Q
 YVnOTYFa4kIa9TCiSkG6mvEHP3C+aeCboiel7HCA3AcnvWXkp3yiW5T1Xkylkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jly78Wp0
Subject: Re: [Buildroot] [PATCH v1] package/qt5speech: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  6 Jan 2023 22:08:27 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/Config.in                |  1 +
>  package/qt5/qt5speech/Config.in      | 12 ++++++++++++
>  package/qt5/qt5speech/qt5speech.hash |  7 +++++++
>  package/qt5/qt5speech/qt5speech.mk   | 23 +++++++++++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/qt5/qt5speech/Config.in
>  create mode 100644 package/qt5/qt5speech/qt5speech.hash
>  create mode 100644 package/qt5/qt5speech/qt5speech.mk

Applied to master after adding an entry to the DEVELOPERS file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
