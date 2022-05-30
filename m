Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAE5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4C01840DB;
	Mon, 30 May 2022 20:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2BjDSQuhQR3; Mon, 30 May 2022 20:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E323840AF;
	Mon, 30 May 2022 20:30:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16AF81BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04B9460B4B
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFLgh_BqjK1D for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:30:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBAB0607F7
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:30:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8E5EEC0003;
 Mon, 30 May 2022 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653942613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxpSaxwtAwNe5/otARGIPTkttRn/oNGjpq2pnYPqhq0=;
 b=KZC/gWAezOXPaEiUoDaD6kZYbJAsVUlZQmCCy5NJsVh3tDvKbD+vJGjLy4ZtcO1vI4W5T5
 IqMPRcIDIERNMst/T35XrsoszZqYWCt/PXnmnsE/FEGxQJvIXxa0Dmb+x404yFK7Hl+17K
 Ozu7NaLK0Zg0t9y0tla52+X8xjsysLiDEMb3or1FDYE0ngK0T6j08cnxhNHZfQLdQN/i3B
 3mn/QlTrvchhFcNKlo3d8icrWQJpvXABe+tAewE+w766LwhGsfkfe2YwPV9xvVHMAsmv3t
 wzf+WkFNY1pBq/64qbLxahnb79O4IjBs5QyH98yL5VnNTfnxSUAToNXOLcikIQ==
Date: Mon, 30 May 2022 22:30:12 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530223012.03751abd@windsurf>
In-Reply-To: <20220521124033.209309-1-fontaine.fabrice@gmail.com>
References: <20220521124033.209309-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/unrar: security bump to version
 6.1.7
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

On Sat, 21 May 2022 14:40:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2022-30333: RARLAB UnRAR before 6.12 on Linux and UNIX allows
> directory traversal to write to files during an extract (aka unpack)
> operation, as demonstrated by creating a ~/.ssh/authorized_keys file.
> 
> 6.12 application version corresponds to 6.1.7 source version:
> https://github.com/debian-calibre/unrar-nonfree/compare/upstream/6.1.6...upstream/6.1.7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/unrar/unrar.hash | 2 +-
>  package/unrar/unrar.mk   | 2 +-
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
