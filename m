Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1151C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA4440359;
	Mon,  8 Aug 2022 20:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA4440359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AztV9U6_sNSi; Mon,  8 Aug 2022 20:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 821B240275;
	Mon,  8 Aug 2022 20:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 821B240275
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17B651BF283
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D95F240180
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D95F240180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4gW6uZhBBPz for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:49:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2EB54015F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2EB54015F
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:49:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 94F3C1BF203;
 Mon,  8 Aug 2022 20:49:29 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:49:28 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220808224928.50e15400@windsurf>
In-Reply-To: <20220808133304.965683-1-fontaine.fabrice@gmail.com>
References: <20220808133304.965683-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659991770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7X/R931vM99PCUJ9H7iHyO5VqCGOB7lhsoHNZtdhd5c=;
 b=JB11ZsawNE5iEnhZEpD0XHN1uv7mPQHBW37FxpP2FKMLb5eil3CoNlotVSdvayiXct6lTA
 IzUXosMHYA4rTJfA7khTNC9yvjq9CgXKOUB9rdCLcg1vplcR984wfbKePZzZIDmyJWYIkE
 Y/s0F3YwCCde6akSKLKLQu8dygr93adlkFJhXBhDIsKgGDoYly6d1bkX9zb0O0PSu4ftUH
 AZdn+VzSnvhul5F7b64GMrUDLi5TQJ+QZ2SvX3KSLm+JJC38+Nzv1TNLyPeZLj61leA/Lg
 ND2JhFWmWvdAM49UTczybE6mIF2WW6uFW9PnW9rs7PWws3qSCrXiBEUdjJbKYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JB11Zsaw
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/bayer2rgb-neon: replace patch
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 15:33:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace patch by upstream patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix title

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
