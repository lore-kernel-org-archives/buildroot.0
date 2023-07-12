Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0CDEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51316416DA;
	Wed, 12 Jul 2023 21:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51316416DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRvxkub47eQO; Wed, 12 Jul 2023 21:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87C6E416C6;
	Wed, 12 Jul 2023 21:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87C6E416C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7375A1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B73F61291
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B73F61291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqaiUX8xdZGN for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:42:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CDC160AE6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CDC160AE6
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:42:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2009A40003;
 Wed, 12 Jul 2023 21:41:49 +0000 (UTC)
Date: Wed, 12 Jul 2023 23:41:49 +0200
To: unixmania@gmail.com
Message-ID: <20230712234149.17ae891d@windsurf>
In-Reply-To: <20230524133138.60117-1-unixmania@gmail.com>
References: <20230524133138.60117-1-unixmania@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689198121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+0SoG8DSSHGufOiBz8P2AwPIP9aGNDvvhaXBBr19Ow=;
 b=HEPKjsuY+lNXJoPqEp0Sh4/Cji+URXafK66BPJcGrO34OwJMtTPhjAXRxSqTD94EBdYJwp
 3vAMpzkz1AgmzgG3KjJ6+95yPOVN5lRByJ8Ki8xaBf3laL2UUO+6hRkQDuWupeB3HgAore
 QkvXNXpRFzBRlFRN8LSDt8SrgyMz8qUbKwVh+OHGR7gxkdc7ug9D0JrJBZlfKOdebzeRUU
 K/huKazxSSiWQiUeOoWuMoh0AO45dtMKk3su8JUvFqNYxhZeZLwnMuBnIBmnWwe71kERbk
 g/eUSgxXqPvBe//Nn+hVx8AnfHZ/ryMm6D7Gf9Zr81Atq6cwqY0DagEE+agM+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HEPKjsuY
Subject: Re: [Buildroot] [PATCH v3] package/qemu: install keyboard maps only
 if necessary
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 May 2023 10:31:38 -0300
unixmania@gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> They are required only for system emulation, so pull a patch already
> reviewd upstream that makes the installation conditional:
> 
>     https://patchwork.kernel.org/project/qemu-devel/patch/20230327172147.196607-1-casantos@redhat.com/
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> Changes v1->v2
>   - Fixed reference to uptream patch, using the QEMU patchwork
> Changes v2->v3
>   - Fix SOB, as required by the Buildroot policy
> ---
>  ...tall-keyboard-maps-only-if-necessary.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch

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
