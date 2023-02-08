Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2054C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85130400B3;
	Wed,  8 Feb 2023 11:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85130400B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwBF5huuXtOH; Wed,  8 Feb 2023 11:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C5D540352;
	Wed,  8 Feb 2023 11:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5D540352
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8B511BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77493416D1
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77493416D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uV0oc85Xdn5Y for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:08:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E23E400B3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E23E400B3
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:08:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88395240009;
 Wed,  8 Feb 2023 11:08:44 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:08:43 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208120843.420c8ed3@windsurf>
In-Reply-To: <20230207171721.2973997-4-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-4-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hTGvzHskXk8BJb5bIIjXAaV7NcI72t/7fBoFj3ETc4=;
 b=TB/3Th3xXpdp5CCHcJvvdMMy6TAmU+GPpWnWzDKKga/G8TpzYrOsA762SCBveuEsecixIp
 MaTpJho344c/V25c90OBDy8ncdpX1pqyFyaudO/vr7LIdMMuUu7tCply76j3irUTXLY0NX
 27iIcO4UweV6U8gdNAqP2rXYF5rlidRc5gdwyye8xrqUd03d15oX4ocwdv5MYNbexbmYYh
 IfkRTUrraibHkqG7DMafLUXF/f5JspYaiBr67PBiVP47jGE5FUuRBDbm0RNhQtbLTrk27y
 sDF/KyBrpe49EPGh13GzNo2MeY4ABzAnGSePKGiGWvXq6BsRxlUekA2uHOJJoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TB/3Th3x
Subject: Re: [Buildroot] [PATCH v6 03/13] package/qt6/qt6base: Add support
 for jpeg/png/gif image format
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:11 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Jesse Van Gavere <jesseevg@gmail.com>
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/qt6/qt6base/Config.in  | 19 +++++++++++++++++++
>  package/qt6/qt6base/qt6base.mk | 20 ++++++++++++++++++++
>  2 files changed, 39 insertions(+)

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
