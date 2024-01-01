Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D883C47074
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 536D760DCA;
	Mon,  1 Jan 2024 20:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 536D760DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jL68QAqgwneL; Mon,  1 Jan 2024 20:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83F1C60BD2;
	Mon,  1 Jan 2024 20:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F1C60BD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA8C1BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0492B81329
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0492B81329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id buHKgiXTjlh7 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:18:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2254581307
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2254581307
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AC6360002;
 Mon,  1 Jan 2024 20:18:01 +0000 (UTC)
Date: Mon, 1 Jan 2024 21:18:00 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101211800.358198b0@windsurf>
In-Reply-To: <20231229214717.11148-1-fontaine.fabrice@gmail.com>
References: <20231229214717.11148-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704140281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhbZBSHx/EU80BdERcOZ5AC3M67eSzlq+TVr0G8EmyE=;
 b=FslWGbdBBJ9Z5/1e25tN0hE9pB+/LkfQ7IjGjlKsfHVIRJRZoVs7JS+EO1lOKrncq+x2dK
 VKI4Mncc2I3HUl04UU22F88/XXH4GVYL9bvi7ARIHzuhN3rZLyx4SA1Ivl0KiQgte6LWYM
 2xW1w9UBFK6u6WiS2D1RdyBw/LjPh+miJMs4gwnXRLXHG9No1/+LK2L7SA/wSH2dkVEAEU
 ZKPUO+t7l43c3eFuSRs21fSa89bx5D78SP23zwlcnNh42SK2V4IecYnefWupzcZK17bYHB
 54w4u9FZpw8bP0MHwazlj8+8zIIp0vzWrsa9JtjtRBSqMkWK84aUZamLdsSpcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FslWGbdB
Subject: Re: [Buildroot] [PATCH 1/1] package/gupnp-av: bump to version 0.14.1
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Dec 2023 22:47:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add patch to fix build with libxml2 2.12
> 
> https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ix-compatibility-with-libxml2-2-12-x.patch | 26 +++++++++++++++++++
>  package/gupnp-av/gupnp-av.hash                |  4 +--
>  package/gupnp-av/gupnp-av.mk                  |  2 +-
>  3 files changed, 29 insertions(+), 3 deletions(-)
>  create mode 100644 package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch

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
