Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650FBC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 204AA4013A;
	Mon,  6 Nov 2023 22:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 204AA4013A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5IVAoJGkqQH; Mon,  6 Nov 2023 22:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F38440317;
	Mon,  6 Nov 2023 22:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F38440317
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81B7D1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DB2F61286
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB2F61286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJxyeo9R0rF4 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 599F6612C6
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 599F6612C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAC2160003;
 Mon,  6 Nov 2023 22:26:06 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:45 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232345.29986ffd@windsurf>
In-Reply-To: <20231105071759.2875447-1-james.hilliard1@gmail.com>
References: <20231105071759.2875447-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yLEhCxaaqwa8gUogUTpKJW6re0UFaonS3yG4MY7WHog=;
 b=pFH9Fs9CxORg3yRmd3rn3m+hBS4OG3uXATxmFh81MG8eRzwOjTYpJJvqClKxClnIvsXe8P
 TgQtM7Qp5BzVUrSH5spMVCFXFGZdeoO06HtsRnV/dCxOqtzCQzZpDQGi5NlHhghiQcY+jk
 mLvMCt+svZm/neO98ytW8kTYjMm/ifjz7LaUGzfGk9hNsqLf03eeigyUfc+LmQCjn/Svvl
 erNA7U2HTTcocQLYeWGdWgAiiyMT196HJxOHEVraoM5WY/QZSaEy5rI2ZKghQ5om7UIfJ2
 3XFnydHdfR74m0laSOZ2eY5x+0OWyaYh9qRFz39Ta7hmdbbomESxfPAuLWjMvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pFH9Fs9C
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gpiozero: bump to
 version 2.0
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

On Sun,  5 Nov 2023 01:17:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is now upstream.
> 
> Migrate to pypi based sources.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../0001-Migrate-to-setup.cfg.patch           | 855 ------------------
>  package/python-gpiozero/python-gpiozero.hash  |   7 +-
>  package/python-gpiozero/python-gpiozero.mk    |   5 +-
>  3 files changed, 7 insertions(+), 860 deletions(-)
>  delete mode 100644 package/python-gpiozero/0001-Migrate-to-setup.cfg.patch

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
