Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CB8C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E22460E29;
	Tue,  1 Nov 2022 20:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E22460E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uSJI1P2nUwZ; Tue,  1 Nov 2022 20:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54CD60B1A;
	Tue,  1 Nov 2022 20:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B54CD60B1A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0E881BF307
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFB9C40462
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB9C40462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Lm0ioDCaZZ9 for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:19:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F77401C9
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98F77401C9
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:19:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 26B12C0007;
 Tue,  1 Nov 2022 20:19:15 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:19:14 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221101211914.65fe463c@windsurf>
In-Reply-To: <20221031231333.706055-1-fontaine.fabrice@gmail.com>
References: <20221031231333.706055-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667333955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybWus5oQQlm32JeYR9w6DqQZ8xSVLZsaoPyl6EKQ9MY=;
 b=CCj2i9O/M7NpD0l/bhkNH04b4c+vTxyxcnNEvE1Lozw+FfPJycDTboSjSSQ94j2MZNz6p2
 hbRnjRlGKSSTrCrHWgu27paMcEwIYQZ1FN964P0tu2HvFifDMo4XzZ4X6yI1yb8QBq3tH6
 Qs5y0SsqwMTGo5KFSVhiNRuR0p2kzeEO09k4BSL1LwrmjcXV2Csq7OBbzQttsXawWFBrhN
 +Lp5LgMsOijwLikdl1ChK3G1q1zIw3R0YuboDLr3ND7ZemiTiQIP1VFGrnVqFezlMl1kC8
 PBuqYybatGzu4d5BSNlGPk6iBQhuJ3RFgqi9nqvCUwMmk3LKAPuUkljvSyyU6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CCj2i9O/
Subject: Re: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: openssl
 is optional, not mandatory
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
Cc: Philipp Richter <richterphilipp.pops@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 00:13:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openssl is optional, not mandatory, since the addition of the package in
> commit 0393f5d34433e34e49ff7ce0fb998735453ed4fc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtorrent-rasterbar/Config.in               | 1 -
>  package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 9 ++++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

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
