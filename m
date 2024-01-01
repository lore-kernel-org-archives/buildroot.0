Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C392BC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B12640A77;
	Mon,  1 Jan 2024 21:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B12640A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3l2y4_tCZgV; Mon,  1 Jan 2024 21:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99A274357F;
	Mon,  1 Jan 2024 21:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99A274357F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0591BF3F9
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C95660F40
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C95660F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3iF5wB5XIL6 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:07:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CD4A60F2B
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD4A60F2B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94CF2240002;
 Mon,  1 Jan 2024 21:07:09 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:07:09 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101220709.7c7798fd@windsurf>
In-Reply-To: <20231230203328.1202724-1-fontaine.fabrice@gmail.com>
References: <20231230203328.1202724-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgrO8yEZQDWFw2sbRv5uC/eieMhJh3o5ROhVCsv2h2c=;
 b=ohXwCy5OhST3P21UGzITBQT4WP/0HoMXW7xtAMstNhPNBR8Q4J7AiX791zfVW3bVXg3HLj
 i1Bsg6+SMf96QU/JqXCuFflu94hwlBXPc6V89papHugyZpYQX7JGfkT/NYw77HbfU3f/0m
 jMmwL8bC3j7gF7z/w/5gYBPYuAHqaC1ypzF97QpqShFCdUQVtD7TTVA5/qUVk/HkF/I/45
 1Zm+C8U4N5JeedtatzoO7giJiPrFewmPnr4lBBqWTQopZsX+631k9CpnU1sItfvrdSArkY
 i+aye38VTT+4jqoq4PF8wz04EeA7OdID27HP4APP6cFC7oXsmYMl2lZsismFwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ohXwCy5O
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenh264: bump to version
 2.4.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 21:33:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/cisco/openh264/blob/v2.4.0/RELEASES
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libopenh264/libopenh264.hash | 2 +-
>  package/libopenh264/libopenh264.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
