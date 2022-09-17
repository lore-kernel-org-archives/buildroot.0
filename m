Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26523ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A0661121;
	Sat, 17 Sep 2022 12:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A0661121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOxxniXutwvG; Sat, 17 Sep 2022 12:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927226111F;
	Sat, 17 Sep 2022 12:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927226111F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1F371BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D8A8842F8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D8A8842F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofmB-hbyAeMe for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B1F842F2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10B1F842F2
 for <buildroot@busybox.net>; Sat, 17 Sep 2022 12:23:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BDD6B1BF205;
 Sat, 17 Sep 2022 12:22:59 +0000 (UTC)
Date: Sat, 17 Sep 2022 14:22:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220917142257.041479a5@windsurf>
In-Reply-To: <20220916183231.2710697-1-francois.perrad@gadz.org>
References: <20220916183231.2710697-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663417380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1oTCQ+v3rppuI2mai9PwyrY6jyPdmt1LEqbIvDj91F8=;
 b=ekfbS+e/x16fe2BdSQZZ1yVCqgC7pWgKGkDiSOXB2KVaGXASo3kLREc6kveXpmY+a90iCL
 8G9W+Pa/osLwpeXrl7iADLb62kqkFUqJ8i1YSw3z91ROIxJug6CY3Qqgz2keRJ7dTcE2an
 HtKrL/feemGGQtKqDZ+3D5m/JB7C7iE09d93iFKkEcjfuPqGDn9N8ZNuJfHhqjjTUswTOi
 cJ7Fp3USSXPwmtvBX12YwKIlAOjIqXpE72DqQ+7+JhYF3UjwmwOskt6g2vmglIeN6Ukyeo
 Gba0y+XAuPKYl0GUkLUKph3R9rJti1PCQdYT9pWemOxlNdmurI/QnF9kwRyHrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ekfbS+e/
Subject: Re: [Buildroot] [PATCH] ls1028ardb_defconfig: configure eno0 with
 DHCP
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Sep 2022 20:32:31 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> eno0 is the main ethernet interface
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/ls1028ardb_defconfig | 1 +
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
