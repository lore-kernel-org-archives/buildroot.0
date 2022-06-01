Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EA2C43219
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2987040C29;
	Wed,  1 Jun 2022 12:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gGXlQv7f5_-6; Wed,  1 Jun 2022 12:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52E1A40BA4;
	Wed,  1 Jun 2022 12:44:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA1D91BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A839C408ED
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrJ6c8jIPwoA for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:44:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 718B9408CC
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:44:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 008D960009;
 Wed,  1 Jun 2022 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654087457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8WohSBJTjDe7IGtntGVXwpDSVlGtfcpflLEfg+HISk=;
 b=DLdY4+MPnMVtjVPdApDhwYHU/F0U269jSqiXA+D9iDjZOSapn2XvaYgYMRXF+20jQ9TXRW
 zWoj4CXhqwWfULl7h9T3ydQZUrOzU5bZN63XN/kd+IzVexVG14pGr2tPxZ4LLN6IFSBpeT
 nKvOCu3GBrAc5X29jdqy6yeWUtX6HQy6oi6B7vM+w2SU0rsKZe2q0Vb0kGPlMRi750S8cP
 5FAzLbzFFYtpe2aVVgRhnSe7mjt6JgATYP1MmrXznrv5ifBLlTzyOGAeQTReGg8GRoRxSs
 rU+HJk734Y1183dqZAfe/AJBESnDCQE5P8CX/IIujeJ3eQ0Z4e43o50PF/W/NA==
Date: Wed, 1 Jun 2022 14:44:16 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220601144416.5567c828@windsurf>
In-Reply-To: <20220531210109.472212-1-fontaine.fabrice@gmail.com>
References: <20220531210109.472212-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: sh4{eb, a,
 aeb} are affected by GCC bug 101737
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 23:01:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pixman fails to build with BR2_OPTIMIZE_S on sh4{eb,a,aeb}:
> 
> In file included from pixman-fast-path.c:33:
> pixman-fast-path.c: In function 'fast_composite_scaled_nearest_8888_565_normal_OVER':
> pixman-inlines.h:586:1: internal compiler error: Segmentation fault
>   586 | }
>       | ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c9d35d5975311a191dfbe12291398503987e804e
>  - http://autobuild.buildroot.org/results/d34b8672f6211d60af4122bdd94fa8c2f4f4bf6a
>  - http://autobuild.buildroot.org/results/933c4a2e73c987573ecc97172f442b78199462d5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  toolchain/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master after changing to use BR2_sh, as suggested by Giulio.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
