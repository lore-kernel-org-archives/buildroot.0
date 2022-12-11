Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8A5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61BA840477;
	Sun, 11 Dec 2022 10:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61BA840477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O08HTjp59fyG; Sun, 11 Dec 2022 10:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96245403A7;
	Sun, 11 Dec 2022 10:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96245403A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2EE11BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F84A40245
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F84A40245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrV6DbT2HJnI for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:41:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C94B400B0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C94B400B0
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:41:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B0DC040004;
 Sun, 11 Dec 2022 10:41:27 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:41:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221211114127.327fd5b9@windsurf>
In-Reply-To: <20221209172712.3928585-1-james.hilliard1@gmail.com>
References: <20221209172712.3928585-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670755287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mm/ZfMbJ4ctaAc5nCV3o4DhEv0GxlkuxrGQD/niNdUc=;
 b=TIKwrFMsB/wu7zqBg5YJZdRJhunQ7Kd4h10ejmkyRqZFGhuHNdCfg1kyMYobAxFDnbFnU3
 QHkKmdW3tDXgQ6kTQ1lSnl8b0fZE802nr5xbC3EJljUygxSuXfXS4C27ze/nxWjwwTZrxH
 /fgZb/pBpbYdhyug/ZCljQeZxQTLVF5GLEFScFD6YX+eJP9MAz/dT4rLvRDYWS6vVll5jb
 f6Y8jN8dEW9iCo1vsTQ0U29tJtpQFdzUJUuetGeexWU5AvoZgBvelF8acCZujA75Ztxh9C
 BvIqzhRKy61KSQRkjC4JTWLcUOnc98B3A4kgSxx+CwpfKsNFAJOpO/Avnz4l/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TIKwrFMs
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.62
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

On Fri,  9 Dec 2022 10:27:12 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add support for new optional gsettings meson config option.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pipewire/pipewire.hash | 2 +-
>  package/pipewire/pipewire.mk   | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)

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
