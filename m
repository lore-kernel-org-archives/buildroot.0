Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A73EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE00060DF9;
	Tue, 18 Jul 2023 20:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE00060DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAYLhAmR7EJ3; Tue, 18 Jul 2023 20:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C1461034;
	Tue, 18 Jul 2023 20:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C1461034
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3DE21BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D8DE81307
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D8DE81307
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8UNG7KN-gWd for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:39:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C6FB812FD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C6FB812FD
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:39:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E322DC0002;
 Tue, 18 Jul 2023 20:39:26 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:39:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230718223925.61ae5088@windsurf>
In-Reply-To: <20230716083900.745225-1-james.hilliard1@gmail.com>
References: <20230716083900.745225-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689712767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGWS5L8W8RAjlUCFzc8vHBcEYIriRh/Ve8GhuKbWvOQ=;
 b=mTY+ujeSshTb+AbTjkvYRN16H3iU2CHrpDXVW24zIN8GzIxDyn15cPRMe9pCvVLUEkXFNP
 g8W5Bay78BuFezO6fRIwnwvO9QBYr9+OZAFtvytMk+WnNfhqLdpSmCgiL9b+7dgwKDqS2P
 3tzHxfhMclbY+P5T63cmo5js69XtyYg/Z3wEBikcn+PaQYekywu9o/nIUIDuqrIERQMYuj
 0MqsbMPRNxsQo0E/MYRVGy7GolvpumC63d8iLk12FVjOo2me1YCuXr1nkoQbK25r2fbq6o
 QKBZXuuTyoJ9LmFl5JQ4SZ7Q3nVAx+TAG8LRbDdEMJx9ezM1vg+E/DYDuGXWnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mTY+ujeS
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: set DTC path when
 BR2_TARGET_UBOOT_NEEDS_DTC
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

On Sun, 16 Jul 2023 02:39:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> In order for host-dtc to get picked up properly we need to set
> the DTC path passed to the build explicitly.
> 
> See:
> https://github.com/u-boot/u-boot/blob/v2023.07.02/Makefile#L420
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  boot/uboot/uboot.mk | 1 +
>  1 file changed, 1 insertion(+)

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
