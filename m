Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50EBC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E8760B8A;
	Sat,  4 Nov 2023 20:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58E8760B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XD8dUA27xsZO; Sat,  4 Nov 2023 20:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9127607E3;
	Sat,  4 Nov 2023 20:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9127607E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE4D71BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87039607E3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87039607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WrkyTz7jP3R for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:45:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83A07607E1
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83A07607E1
Received: by mail.gandi.net (Postfix) with ESMTPSA id C479E240005;
 Sat,  4 Nov 2023 20:44:59 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:44:58 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20231104214458.127aa6b4@windsurf>
In-Reply-To: <6e269338d657663f4008a5acb9da58ba26f59898.1696424479.git.stefan@agner.ch>
References: <6e269338d657663f4008a5acb9da58ba26f59898.1696424479.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699130700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPxeAhIijcvUUW/z0bQKSDTum1XIImjuzaCcMawnhtw=;
 b=evTtj43trFclTGyPXYusZpIzwTAU0IOrbPL7IJMcGT+iWjvClG64xlBimWSFx285ndgFge
 AFcVd9qS65z0ugzKJvcICK0AlSEVDQZP/ijrtQTaRyJy0w2hBe6IjvrIPJD721B9Ktyz04
 h8Ji3YOuoLJXfhozN3ywn8jlsJBCAgItxnImt1KaJYi8x7UjOPBhg1e3G7dfoO2pD8aET9
 J0NGjOUsix32gvF/AfbxI+ybeoDFX13LBhqNRwODk/d2VLatlUCgB+b+4PjwCCZ/qmp/B/
 gUiHTHDaC7azqrVD8z7MCv3R9Oen9Wlxv8M11asxme27XjV3AMz1rp2azCOOIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=evTtj43t
Subject: Re: [Buildroot] [PATCH] package/docker-engine: Drop experimental
 build flag
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
Cc: christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Oct 2023 15:01:34 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Since Docker v1.13.0 experimental only exists as a runtime flag. Drop
> the config from buildroot as well.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/docker-engine/Config.in        | 3 ---
>  package/docker-engine/docker-engine.mk | 3 ---
>  2 files changed, 6 deletions(-)

Applied to master, thanks. We normally add a Config.in.legacy entry
when removing options, but in this case, I'm not sure it's really
useful, so I didn't do it. Let's see if other maintainers complain :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
