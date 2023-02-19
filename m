Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892DBC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3162541590;
	Sun, 19 Feb 2023 21:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3162541590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KU9G8E9t6Z_l; Sun, 19 Feb 2023 21:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78642414ED;
	Sun, 19 Feb 2023 21:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78642414ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AD721BF405
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 429B740B48
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 21:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 429B740B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZoKtvCzW38d for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 21:10:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD32540BE8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD32540BE8
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 21:10:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5D2EFF803;
 Sun, 19 Feb 2023 21:10:13 +0000 (UTC)
Date: Sun, 19 Feb 2023 22:10:12 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230219221012.31f1977e@windsurf>
In-Reply-To: <20230218180215.1077049-1-romain.naour@gmail.com>
References: <20230218180215.1077049-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676841013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNk62/UueGd4MglxrIcusClgkJFihDcvAqqyNw7963Q=;
 b=iboxH77Cgo+wNA4c84G/rVrZK5G3wrureHg5fRFsfWqKKYZb/h2Sj/qZiAH5DH6nrie1I+
 EA8zIJ+dURdiev8+xQVwFolITssZ+BPcSTkF6uGZGA4iQl6QtXiDKbTH5+mS3ccRiiHag6
 2/vn/9317h/XYdPhXFH+jurAVPBICKoXRsiS1IvBsKN8t+nKIO/ZzZfj7vwbmtxOyRIBNl
 2RuseCGGYw8+9vViDD9FB0ORMo3WuQ/EtgNr/konQN4hY9rJMsYtoFAKOaHBRDTO3WWD0V
 BdqcA1WpJNC6W3NK/AvJmP9UEmMghTm72wkX++t/Gi6GisGKDxv9C8r7aWLBZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iboxH77C
Subject: Re: [Buildroot] [PATCH] package/poke: bump to version 3.0
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

On Sat, 18 Feb 2023 19:02:15 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> See:
> http://www.jemarch.net/poke-3.0-relnotes.html
> 
> Build tested:
> https://gitlab.com/kubu93/buildroot/-/pipelines/782116399
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> test-pkg config:
>  BR2_PACKAGE_POKE=y
> ---
>  package/poke/poke.hash | 2 +-
>  package/poke/poke.mk   | 2 +-
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
