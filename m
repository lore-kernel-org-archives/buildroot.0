Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCCEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00CF8408F1;
	Sun, 30 Jan 2022 14:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzUIjRHaYUSE; Sun, 30 Jan 2022 14:56:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A79402B2;
	Sun, 30 Jan 2022 14:56:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95DAF1BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FD1D40332
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8u-NcgW1MqO for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:56:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7048B4053C
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:56:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 81448240005;
 Sun, 30 Jan 2022 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643554607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pT+KjxWvZdpT+xzNkQzTWaBpEsv+wucNI/55mZseViw=;
 b=MoKZaKPyONN0MuLu2Lpc0xMRoLN0abcr0bOAYxB5IaOJB8X4GSQ6EHXSUtz2k7wZ/8KM9I
 U2miPUMXpsfzyobPeVtes4XySLAySv7mHu9l9l4x2BKUtDITIAAh8Ndh4YNnu0sBZBS0qV
 Y5cC3BPreh/lfaCSgzgJhROVLyQf8TBViP4+7kBlJtnZadukmL+AWjQ9n757EqtsIP71cX
 RV/pzOn10By5CoqaNo+xNKVlSbqMZ4MoSbHOg3uYdO1rm8MhmlwOlxCkEloSRzd+geMlJt
 ehFZDDWd5l1dJjoq/FAwL6Em7RpqWxhUsAJNqpmRvmvFBHjLdQyulDaVO1tRFA==
Date: Sun, 30 Jan 2022 15:56:46 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220130155646.24ea8390@windsurf>
In-Reply-To: <20220128215013.2997212-1-fontaine.fabrice@gmail.com>
References: <20220128215013.2997212-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/pkcs11-helper: drop autoreconf
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

On Fri, 28 Jan 2022 22:50:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> autoreconf is not needed since commit
> dbf8047f64f081ffbc97b67dd891690632377692 as the official tarball already
> ships a configure file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pkcs11-helper/pkcs11-helper.mk | 1 -
>  1 file changed, 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
