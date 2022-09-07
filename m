Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FB7C54EE9
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 20:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9BBA83E6E;
	Wed,  7 Sep 2022 20:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9BBA83E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSPLAXO0L4_a; Wed,  7 Sep 2022 20:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D38D83E64;
	Wed,  7 Sep 2022 20:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D38D83E64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3E0F1BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E9260FA1
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 20:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E9260FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFb-lKxJUCyf for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 20:30:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0E9160F6C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0E9160F6C
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 20:30:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8198D240006;
 Wed,  7 Sep 2022 20:30:26 +0000 (UTC)
Date: Wed, 7 Sep 2022 22:30:25 +0200
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20220907223025.35c93769@windsurf>
In-Reply-To: <CADYjeSu2TUq3Wkk-AFK8TM=xazH66jKPD8Vg6HA9W3WnX2xymg@mail.gmail.com>
References: <CADYjeSu2TUq3Wkk-AFK8TM=xazH66jKPD8Vg6HA9W3WnX2xymg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662582626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arrmT+Wyf0TgygmEG+728RhViiqATUJ5vqLlF3KnnX4=;
 b=VYe5ctvmCGRWgKohA2xuBjvEsGIPGVEJke1airnN9VKTdlJtmHIPJijX3Kau6tLPhuVRji
 FLxXxH1CXJ2WsJh980yIxXkNxZS6UlJORWATEUZkTyMW63XY0klhqn+aeoFXa78QSG+Gax
 Jcy7ngVGQNOX/uqY5NJAFOAZaXHzt7pjBIrWiMgkpb2x8KzKqZyZqeicfB+JVbcb/DcgZo
 2BfE0pX934X5l3s+r+py2rkSiHnDKiC7DXkf9KDh9PkXBfh/n97YPavJYSXMWr8SoyQagd
 34NjryzmbsX1wg+ugHOXI7KhqI74I+HoGi4SRPDcuwRTZP+BbkV9KiPIzFiLgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VYe5ctvm
Subject: Re: [Buildroot] How to include prebuilt binary using buildroot?
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

On Wed, 7 Sep 2022 16:40:24 +0200
Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> An application package is not part of buildroot But I am looking for
> possibilities to include it in my image. But there are prebuilt binary
> available for the application in github. Now I am thinking to include them
> by downloading and extracting the downloaded package (.tar.gz). I believe
> this is something possible using Yocto using SRC_URI. But is this feasible
> with buildroot also, may be with BR2_ROOTFS_POST_IMAGE_SCRIPT?
> 
> *Or*, using rootfs overlay the only solution?
> 
> Can someone please let me know what is the best approach?

Just do a package that is responsible for downloading the package. Its
CONFIGURE_CMDS and BUILD_CMDS will be left empty, and its
INSTALL_TARGET_CMDS will simply install the precompiled binary to
$(TARGET_DIR).

See the Buildroot manual for more details on how to create new packages.

Hope this helps!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
