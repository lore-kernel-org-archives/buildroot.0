Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76402C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36CE140550;
	Wed,  7 Feb 2024 11:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q23CKXGVE7FN; Wed,  7 Feb 2024 11:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 475624033B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 475624033B;
	Wed,  7 Feb 2024 11:51:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D92641BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6CD360D59
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fz_bi6DFzg8p for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FD6160B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD6160B5C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FD6160B5C
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:51:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A5F1C0002;
 Wed,  7 Feb 2024 11:51:12 +0000 (UTC)
Date: Wed, 7 Feb 2024 12:51:12 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207125112.4d4f7de2@windsurf>
In-Reply-To: <eae889ce783ef15ffa62e2af3f2d2ef0e8e079dd.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <eae889ce783ef15ffa62e2af3f2d2ef0e8e079dd.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707306672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOq21qqBzc7QjPiDcAyxZH+SZNjcVDVNXENdhjerryQ=;
 b=F5Pc8bQ3j3UEO1MukkGNYV9Qbg4OpaCJSjY0rHM/YuC83gi4fvpiBGtTF49cqn0JOVBCJ3
 w2s6/yehO78eu3lzOIbFQALlT+13ElcW7vo7WjmI7NsOHZxMeOHKaewGGl7nO/FGRkg83+
 gMww+D6B4/lC25EB344AgMMndA2X4QstX7Dvl+yTVvwZqq+jVN99eQj4VQbtOoMLqFOa3x
 zrLpIq8CSkHe7ZGt2TXo3AfayCaSEhuSGjFth9e7nOQ3BEqWCKGLwO48aqrvF23XF7syhd
 7rVi9Tehl+4WkP6MJOX73lTlo94N9XCDn+pjamhwcd/lqMKZqM9oiblRNSc3ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F5Pc8bQ3
Subject: Re: [Buildroot] [PATCH 05/10] package/petitboot: fix ordering of
 comments and sub-options
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

On Sun, 28 Jan 2024 14:20:54 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Currently, the comment about availability is between the package main
> symbol and its suboptions, breaking the threading in menuconfig.
> 
> Invert the order, and move the comment last. Also enclose the suboptions
> between an if-block, as it is more customary.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/petitboot/Config.in | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

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
