Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AA4ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A8361127;
	Sat, 17 Sep 2022 14:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A8361127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPSJJP1ZswwC; Sat, 17 Sep 2022 14:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D18461122;
	Sat, 17 Sep 2022 14:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D18461122
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8421BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B34840AA8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B34840AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5un7rCxBQhn for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:25:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04BF24049C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04BF24049C
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:25:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B910100003;
 Sat, 17 Sep 2022 14:25:43 +0000 (UTC)
Date: Sat, 17 Sep 2022 16:25:42 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917162542.16befdf4@windsurf>
In-Reply-To: <20220904211117.218817-1-fontaine.fabrice@gmail.com>
References: <20220904211117.218817-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663424744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWYk3V1Agtn8P9Kftz7uY1xYXd8ibQ9EkXuW522EWeY=;
 b=RcYOu86uap/W7Xc4+x0hLwAf+6h8Zano8348W7TpzzJleoQP+66U6ODp+Gd+P3OdKREhg+
 +JwwEzB+m4WJEfxFkn87sJZw/sBylE9SjMfDDLDNci2VAi7Henh72PvBon7Nannv5JZ5PD
 SGWPZ2BbQlNUNxKXxfSsuBLS9Dt6LasqeUT1cIBWZDhMzM2t3ial0fzfneZq9Bh+cSVQYW
 4M0BAWbciPXFufTScFdx1tyELjw3PBcSH4dL4PjMe2dub99LGtAnfVmpH5ch/ymhA9JkiP
 4rqlIR0L1P1xxNGIE9scsF/8Cg4Nkz70ukrlCgfOI/jm0g7wXDLgXWWZrDEbmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RcYOu86u
Subject: Re: [Buildroot] [PATCH/next 1/1] package/minizip-zlib: bump to
 version 1.2.12
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Sep 2022 23:11:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of README (version and year updated with
> https://github.com/madler/zlib/commit/21767c654d31d2dccdde4330529775c6c5fd5389)
> 
> https://github.com/madler/zlib/blob/v1.2.12/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/minizip-zlib/minizip-zlib.hash | 4 ++--
>  package/minizip-zlib/minizip-zlib.mk   | 2 +-
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
