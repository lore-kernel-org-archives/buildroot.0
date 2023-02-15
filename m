Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1424C6379F
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 958CA8161D;
	Wed, 15 Feb 2023 21:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958CA8161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VwyOuhGDU2iz; Wed, 15 Feb 2023 21:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D43CE81F9B;
	Wed, 15 Feb 2023 21:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D43CE81F9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6E3E1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80D69607F5
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D69607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zj9MD_0jGTq8 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:00:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74B6360776
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74B6360776
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:00:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED702240009;
 Wed, 15 Feb 2023 21:00:27 +0000 (UTC)
Date: Wed, 15 Feb 2023 22:00:26 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230215220026.1a771114@windsurf>
In-Reply-To: <20230214120808.1282621-1-giulio.benetti@benettiengineering.com>
References: <20230214120808.1282621-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676494828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BT31JYrcHSVzzTIZifC6RMvnpGYakfwcDjAQPLl+q2o=;
 b=Zf5jhpzwjbnwWLm02HCjB5JQ8LEZKpn4/OHt+VqXMGWh+WJ/kq6JjSRJE+ifpe/IWDMpWc
 bygtJn3IJk9i6flmQDFmYHoWTVhvFFazCAewY6IhFzBCLVI32ULacGT4/lJrFq+/Y3tq6G
 MmTmYTIDLrppgpAwxtdSlchdNnve8x4hDsszptwfoo10bV3dCygdNb52djFSsOrdpqfsgc
 njTypY9JeHcmNcwfQ8GlCCVl4FeSSmEpH+68jZEjM+ebNWPGvThCStHkCJJF84X+4BsvRK
 PWan5C6Vub+Bvg8ts5ZsPBGTcaOai57GcWXR2hs+9Ecbs8x+JWIZgUvuRsEtMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zf5jhpzw
Subject: Re: [Buildroot] [RFC PATCH] package/Config.in: move all Wireless
 Driver into a separate menu and enable them only if architecture s390x is
 not used
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Feb 2023 13:08:08 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/Config.in | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)

Why not, but then you need to change all the existing packages that
have a !S390 dependency to remove it, as it becomes redundant.

However, I feel like the dependency is more "obvious" if it is in each
package. I know it's a bit of redundancy, but it is less "strange" than
having it in package/Config.in.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
