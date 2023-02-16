Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298D1C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 15:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C13DC611E4;
	Thu, 16 Feb 2023 15:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C13DC611E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrC_e0O_6wQN; Thu, 16 Feb 2023 15:02:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18AD960ACC;
	Thu, 16 Feb 2023 15:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18AD960ACC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 362921BF5A5
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 15:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 102D3408B6
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 15:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 102D3408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ka8f-Jzn7HXN for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 15:02:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE5494015E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE5494015E
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 15:02:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA8101C0018;
 Thu, 16 Feb 2023 15:02:39 +0000 (UTC)
Date: Thu, 16 Feb 2023 16:02:39 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230216160239.3cf956fb@windsurf>
In-Reply-To: <cover.1675884676.git.yann.morin.1998@free.fr>
References: <cover.1675884676.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676559760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LYLU4Xt/DedY7leU3zVtM3tvE0RwqvNI2EmU5rr/4I=;
 b=EAqj8H3hlAeBybe1WowptdfSybfEXIPIlFRHUHlLqpKXkZoQEmK4TPLSLNublYG2lx+xHc
 MuU8YI3NF6//u6i51zp8hkl9LTMzGuFntUmzoMay+Xr+sKS6ou4oyVrXGi0+Vkt/Ol3Mav
 RrQvMRvWHn+qLD6v+uM7N+3gJAwVeE4y/fkKtJqWhxOZvpxmOI0AXAeXJ7uHRh+uvyseIh
 1VX5KdEucXF3fCHPvs1d+CB7fdr6xwJ6/x/ehLGEhwOy3R4DQbZ1j2l1J78/VoVh+MgKim
 DpKymqUhb9b7PlZWSKYktvwdj3D7KxnJzEnn0j1UHFJ3Lu3B97pzhplzJKWzpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EAqj8H3h
Subject: Re: [Buildroot] [PATCH 0/3 v2] package/dmalloc: cleanups and ssp
 workaround (branch yem/dmalloc)
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Feb 2023 20:31:31 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (3):
>       package/dmalloc: convert existing patch to git format
>       package/dmalloc: use actual patches rather than sed-ing
>       package/dmalloc: don't use SSP

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
