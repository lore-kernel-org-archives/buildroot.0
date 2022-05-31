Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4627EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 06:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C505F40A6D;
	Tue, 31 May 2022 06:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGgK4alKG6eg; Tue, 31 May 2022 06:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3B35404AF;
	Tue, 31 May 2022 06:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAFD01BF368
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 06:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A89EF41B75
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 06:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLogaQLNnAmK for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 06:54:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3672641B42
 for <buildroot@buildroot.org>; Tue, 31 May 2022 06:54:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04117FF808;
 Tue, 31 May 2022 06:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653980065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vX5Q/Ip0IVwdAUUvY2xyY1feIbf7kL3LSkIOeLVCOIE=;
 b=EDDYYobxjUJQ8xcv0WKMWMirHw8Nd8ZGlNRzTkOMtXEA2sG8eghum6P0Q9YxLFXmiDrAvu
 oUObcGymdGHVbGkNw4L0hYDEj9HevNDa03sWkFpZ8Fp6aOeqJxlikgiqkirtNbaXx9+PNb
 9qA43PPSy03jwA3bIKQ9zHOpDo9bEuE6hR3KDsu1rFi7wJgpkdhphQMX8qSg1nIk7mCyXk
 qpBCWUY07BvTorjSjpmhN9IRYOkn/KtReVZ/uOPtcGrtrmbQzm7EBhILAlUNilSGP8UJwr
 qRgz9F0jBbEBUVK/sstPt8Vwn5nWIUHni91nt1iTmZ0No5nW8/vnbTVbUKa2tg==
Date: Tue, 31 May 2022 08:54:24 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220531085424.344c46c8@windsurf>
In-Reply-To: <20220530215627.1441783-1-aperez@igalia.com>
References: <20220530215627.1441783-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.36.3
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

On Tue, 31 May 2022 00:56:27 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Bugfix release, mostly with build fixes, media playback improvements,
> an important fix for when using threaded rendering, and security patches
> for CVE-2022-26700, CVE-2022-26709, CVE-2022-26717, CVE-2022-26716, and
> CVE-2022-26719.
> 
> Release notes:
> 
>   https://wpewebkit.org/release/wpewebkit-2.36.2.html
>   https://wpewebkit.org/release/wpewebkit-2.36.3.html
> 
> Accompanying security advisory:
> 
>   https://wpewebkit.org/security/WSA-2022-0005.html
> 
> This also imports a build fix which has not made it into the release.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...en-cross-building-for-64-bit-ARM-htt.patch | 32 +++++++++++++++++++
>  package/wpewebkit/wpewebkit.hash              |  8 ++---
>  package/wpewebkit/wpewebkit.mk                |  2 +-
>  3 files changed, 37 insertions(+), 5 deletions(-)
>  create mode 100644 package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch

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
