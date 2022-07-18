Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7255C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE5060FCA;
	Mon, 18 Jul 2022 10:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BE5060FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAiGj-Wxpikf; Mon, 18 Jul 2022 10:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8B060FD8;
	Mon, 18 Jul 2022 10:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F8B060FD8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F39051BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C076381B70
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C076381B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a03h9XbpQ_rD for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:20:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C58E481A46
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C58E481A46
 for <buildroot@busybox.net>; Mon, 18 Jul 2022 10:20:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DD141BF208;
 Mon, 18 Jul 2022 10:20:26 +0000 (UTC)
Date: Mon, 18 Jul 2022 12:20:25 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220718122025.57c3b2d5@windsurf>
In-Reply-To: <20220709155557.2907518-1-francois.perrad@gadz.org>
References: <20220709155557.2907518-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658139627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StIY4+9yfHNQRg85arhYvSkhCQu8sHiSHTaN4Ah6oQY=;
 b=UukUVU/0vUUGvt4idJKOwZKYDHJ0/DqWhNMN62y6q0bUMc0P5wFOVwX+YKpPQD7Z+vNZF4
 wkVrOCIGQYmwg/rFqPMfkauU+G3hgvjYPFzVp9J6ekxHDORcQDXuxyd56+uLbpJhe6WmEd
 rDepVVuiJvtqFJzvbINgCjp5RYfUKalRw4j5ONC0ZuOTkpgm10g3vMoo5gVbxR7zm3PR91
 5t6B9DELpmZh4L+fCf/fDHkV3oMyO9i5LnUTd5gC+VWvjRoAviDagh+Zlt1k8mZvtDjxyU
 UfK7Fgfry51kBKwT4mfuJSG+k2ZxbI36rLLtFRE3yuWelSmKQOVNqsrIlzEO1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UukUVU/0
Subject: Re: [Buildroot] [PATCH] package/mstpd: fix install path
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  9 Jul 2022 17:55:57 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> note: the current configuration works only if BR2_ROOTFS_MERGED_USR is enabled
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/mstpd/mstpd.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master with an improved commit message and comment in the
.mk file.

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
