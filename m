Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9EDC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95DFD60671;
	Mon,  1 Jan 2024 20:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95DFD60671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qp40ee0ya07V; Mon,  1 Jan 2024 20:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C806B60E3F;
	Mon,  1 Jan 2024 20:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C806B60E3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8AA01BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 815608134B
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 815608134B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLZxFkmRHYQY for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:19:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4775D8134A
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4775D8134A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2645420002;
 Mon,  1 Jan 2024 20:19:41 +0000 (UTC)
Date: Mon, 1 Jan 2024 21:19:40 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101211940.6642c71d@windsurf>
In-Reply-To: <20231229214918.15851-1-fontaine.fabrice@gmail.com>
References: <20231229214918.15851-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704140381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKz8XLCoCw3drQqvr0KpExYo4XNT/6Q06Q6PCpqgGCg=;
 b=hvkMJ15k7cq+7drlZaSe0WY7tYHiOizq1JzBA8Thx6Th2djwxnYXSjV+jxoyZXwpXLOzO8
 QcPj0YjJ1Z/PM8iuG35gKJeSfmvpdIgVsZQ6MjaMkfuaFQZYCDRT+aDBYD/ijr78wDGW7m
 +QMQ9vaDIcc/Ld9S0RiffF8yBrHhw5/+nPBibbUJt1NoiEaTXcLwC+3lt7RLzuUVk4PanD
 6Mi/kABC+On9CMMiyiS/Ka/5lNdHxfiyzyEpj5znePe/aEW7HYKB4l1zOAqfeR3riAJJO2
 YOiie19Wi6owkjRdWWBAoZhWDJuQNwVY7r5PwPPIA61fUjBhGc0h52WduBq7rQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hvkMJ15k
Subject: Re: [Buildroot] [PATCH 1/1] package/gupnp-tools: bump to version
 0.12.1
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

On Fri, 29 Dec 2023 22:49:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - libsoup has been replaced by libsoup3
> - Add patches to fix build with libxml2 2.12
> 
> https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.12.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...mon-Drop-deprecated-xmlRecoverMemory.patch | 33 +++++++++++++++++++
>  ...-Fix-compatibility-with-libxml2-2-12.patch | 28 ++++++++++++++++
>  package/gupnp-tools/Config.in                 |  4 +--
>  package/gupnp-tools/gupnp-tools.hash          |  4 +--
>  package/gupnp-tools/gupnp-tools.mk            |  6 ++--
>  5 files changed, 68 insertions(+), 7 deletions(-)
>  create mode 100644 package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
>  create mode 100644 package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch

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
