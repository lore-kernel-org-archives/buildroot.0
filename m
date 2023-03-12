Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72A3C74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87C33410DB;
	Sun, 12 Mar 2023 22:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C33410DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5dZr6U6h_R3; Sun, 12 Mar 2023 22:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D3841C8E;
	Sun, 12 Mar 2023 22:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D3841C8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18F261BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA6D481255
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA6D481255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGkV58c5XHir for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:17:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9CFD81247
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9CFD81247
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:17:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE29BC0002;
 Sun, 12 Mar 2023 22:17:31 +0000 (UTC)
Date: Sun, 12 Mar 2023 23:17:30 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230312231730.5e319ec4@windsurf>
In-Reply-To: <20230312220929.288449-1-bernd.kuhls@t-online.de>
References: <20230312220929.288449-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678659452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeCCxjlsy6+6n6OVuFJ5j+uyvybozsVToGXVe0in0pE=;
 b=YrOzRNVR5kgxV2phttlHM1Xj61yntvP3vZD6zunnkRY/O6ISAkxSHlOOkd1QTPgB/m6yar
 9p1eMmnQD1sC6p+TCl0WEla3naRduDr51Am5kwJ7toDqWRvZUBq8gPyu9Veix5U/gU1Mo1
 tFmP85XsXuhUBkERHzGCgHcKAj9X05gusiG61E8XjcWVBnm9dISAwig35LRlCN18nBZzpg
 lzRMaoyK90xP6adjneU4O5p9tZGQL+nPLP3j5fxVidlb/RNRNP5SJkY6LwEE9zDU8FisU0
 C8WPZff5ELQVYnmuAiFxNMQTJ6khkjzl8LfhGoZ95tZh8goXJCQdeLB31eYQkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YrOzRNVR
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: bump version to 0.35.1
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 Mar 2023 23:09:29 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> https://github.com/mpv-player/mpv/releases/tag/v0.35.1
> 
> Updated license hash due to upstream commit
> "DOCS: use upstream license files":
> https://github.com/mpv-player/mpv/commit/7314253180e7c5d06bec6d1fed79ce92bff4b6be
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mpv/mpv.hash | 4 ++--
>  package/mpv/mpv.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
