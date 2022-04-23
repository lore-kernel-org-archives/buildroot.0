Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4FDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 14:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC90960F75;
	Sat, 23 Apr 2022 14:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZlIV-uTBvrV; Sat, 23 Apr 2022 14:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A87C160E43;
	Sat, 23 Apr 2022 14:02:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A16F61BF307
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B03841A55
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVjEYRxZ2tnU for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 14:02:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 095D441A47
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 14:02:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 604A1240004;
 Sat, 23 Apr 2022 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650722564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqVGkv/YmFqBlc//rbQM7fSnudtCmNSGX2PfrOXty2k=;
 b=YgEiNnQOoNdQ33mglhk7/AbPDwIAxvB+5a9XUAF4Jm9An0LRckHcgdanH5qMHSZ5+2aa3m
 x5MuiY1QE3lrzlhx+InvWjhj0If4TAbOROLcXWMuH3EReq3lRnXemA1+t26n/ezXOVUeZ6
 2zNrpH0NIS6+zCQhC/0/t6vA9UNET22Kp7dc3x73qnK9H2sUeEYrLdnSbZZdMToT6Box8n
 ViTHAd9gZOgt2jasLtqgiaIg9UymN8UbekBZ+76osRFhjgBCuy7Q9LB/ZlH9IEy8ta6nOD
 A3GnehVnFCvg/X1zPYfKWHWz9+UZTt9HPqhTa5nbXIPBIiQ0PCjcn9QovraFMQ==
Date: Sat, 23 Apr 2022 16:02:41 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220423160241.3246f49b@windsurf>
In-Reply-To: <20220422215813.2528195-1-fontaine.fabrice@gmail.com>
References: <20220422215813.2528195-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: lsfd needs headers
 >= 3.19
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

On Fri, 22 Apr 2022 23:58:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> lsfd depends on kcmp.h which is only exported since kernel 3.19 and
> https://github.com/torvalds/linux/commit/3f4994cfc15f38a3159c6e3a4b3ab2e1481a6b02
> resulting in the following build failure since bump to version 2.38 in
> commit ee978e853a6a4c9bb5ed661c1ae704e79f155a35:
> 
> configure: error: lsfd selected, but required linux/kcmp.h header file not available
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/555c272fe0f966f7f46d493236cb6dabeca24d9b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/util-linux/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

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
