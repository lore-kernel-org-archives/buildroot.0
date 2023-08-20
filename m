Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342FAEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A2B60BF1;
	Sun, 20 Aug 2023 21:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A2B60BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMcBH9hQGi2H; Sun, 20 Aug 2023 21:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0816060BE8;
	Sun, 20 Aug 2023 21:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0816060BE8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 123E11BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC7DF81AC1
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC7DF81AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hsgl86nX8seD for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:15:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03A3681A92
 for <buildroot@busybox.net>; Sun, 20 Aug 2023 21:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A3681A92
Received: by mail.gandi.net (Postfix) with ESMTPSA id D398020005;
 Sun, 20 Aug 2023 21:15:07 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:15:06 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230820231506.19db2724@windsurf>
In-Reply-To: <20230818182915.489874-1-francois.perrad@gadz.org>
References: <20230818182915.489874-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692566108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zxw5efTEAPoFCxRaI0fUtzP+j7odyDL67xK2vy2eZl8=;
 b=oWJf4ANd/428o88gj8EbFsoMNanv/emnzTkHxCXKKmGtyt4VnDAxc5+eXeXpmtPbG3neSM
 g9JgC1w0P2arqAwh3G/3ok1e2u9tWhQHfKmkRlXbg1WIZP2xLH4WBOcN9sjNN/N0NuNPI6
 GJKdwKVIFGdTeyo1yHmzqT6+o7V0ZXSrJqWCczQlmj2HtQzp0vyeK/8CL5/I//F5vgG89d
 Ywi9xSz6fWZFIqxEUoi02Vg2XHepPzh2oXASsW0kk/EwuQVqYNdfF2HWu3VQWONk+paADZ
 AjY3i0oz4gisNJIzy8NxoUcfy0ai2r3JOqmo1T2Gd8l2t+iVlSLtVIRHmiy2vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oWJf4ANd
Subject: Re: [Buildroot] [PATCH] package/lua-rotas: bump to version 0.3.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 18 Aug 2023 20:29:15 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-rotas/lua-rotas.hash | 4 ++--
>  package/lua-rotas/lua-rotas.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
