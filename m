Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50153C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9DC241505;
	Mon, 15 Aug 2022 09:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9DC241505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyQLNmjRCbkl; Mon, 15 Aug 2022 09:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA569409F7;
	Mon, 15 Aug 2022 09:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA569409F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1751BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39B6A40159
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39B6A40159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oy3hBJCgxK7b for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:35:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D06D40146
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D06D40146
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:35:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 178BB60002;
 Mon, 15 Aug 2022 09:35:33 +0000 (UTC)
Date: Mon, 15 Aug 2022 11:35:32 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815113532.6b1c844a@windsurf>
In-Reply-To: <20220810104450.3424068-1-fontaine.fabrice@gmail.com>
References: <20220810104450.3424068-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660556135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1yxPLC0oyQWoh6W5KyWQt6r0hz9m2YsY0FzSqhQN8M=;
 b=oBsDh6SqNeGaXS/t9/XOGezfTWRR9mxmUYOzl5fa7hiFWuDkdb67Oz8mzpgd9ldFwYDMtx
 SqQTMmIOv9WVHMITztyXys2HXGQgO/eMv8d7h5dAjaGnv08WmWwU4TLQNHTe5yFDpI/KxA
 +9c19bdGc1rpTb6LGfvJgiCpynn5jmf6lOI6P9v0+RGkWJK5P6cvSfcBNmUJr7pvZLLXJL
 wMRpGUHDEzFLmeGQu4D6QCrspY2jd3Vpx3rOC75QJ+V24IMG8V19Jz1XAKaivVb6cr7Bwp
 rUcYfGy1K1+YatM4U6r5I4PgfK5wlpDdA72i1JRLKiK1WisLCi/veMxiNvle3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oBsDh6Sq
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/q5doc: fix dependency
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Aug 2022 12:44:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit fa917d0ca96baf4ef877a80e57d438bfbb8cdf2d forgot to add
> BR2_PACKAGE_QT5_JSCORE_AVAILABLE dependency:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5DECLARATIVE
>   Depends on [n]: BR2_PACKAGE_QT5 [=y] && BR2_PACKAGE_QT5_JSCORE_AVAILABLE [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_QT5DOC [=y] && BR2_PACKAGE_QT5 [=y]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5doc/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. Sadly, it's only after pushing that I
noticed the typo in the commit title (q5doc -> qt5doc). Oh well :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
