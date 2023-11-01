Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFFCC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7904F43295;
	Wed,  1 Nov 2023 21:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7904F43295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-fLaOcyrrcA; Wed,  1 Nov 2023 21:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C47F8432A8;
	Wed,  1 Nov 2023 21:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C47F8432A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 349701BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0105C84D89
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0105C84D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W91pbypMqSyP for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:44:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AAD884D8D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AAD884D8D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ACF7C0007;
 Wed,  1 Nov 2023 21:44:29 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:44:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101224428.054879dd@windsurf>
In-Reply-To: <20231016204039.4191-1-fontaine.fabrice@gmail.com>
References: <20231016204039.4191-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698875069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjqNLyBa/Twszff5ByNDOig58ir+EvfEmyvGLrhgEbY=;
 b=l3c/qi5LAKty4sHYvFxw4bqchVrcHPxtwXtJ9sOQmCjq7iiid/6LSSaq6FrDt/mtOW6elO
 rhftzEZJZ6os71lUboRbSUSUbMDPCyKCiWgIveGJ/3JnNfik0Xdds4J4N73w/MYXBZNKyE
 CJVg2wC2FVcqhV4ncZtggPhCTlNi73G5sjkwc4X8AEyeW/QJ4bqgAzoKIoRexQeokjZimA
 rfzB+rku7pr+D1XFA/GHERLHZpJxMEInQE7fBU14YhLvraTYWzkg2HIOsBDaZ6TT+y36Mm
 yw1xalv0ki3YurWwmzaCIkZp9io7vK4hqum+ZVyEB9iYkcJUrJJcJRXOE3BXmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l3c/qi5L
Subject: Re: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.14.18
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

On Mon, 16 Oct 2023 22:40:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/pupnp/pupnp/blob/release-1.14.18/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libupnp/libupnp.hash | 2 +-
>  package/libupnp/libupnp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
