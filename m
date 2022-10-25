Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14161FA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABBB440487;
	Tue, 25 Oct 2022 18:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABBB440487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMJIa6bdsfGT; Tue, 25 Oct 2022 18:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE3C4012B;
	Tue, 25 Oct 2022 18:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEE3C4012B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58A711BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28EC5401EB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28EC5401EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBWWm8EmFgWd for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:23:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9816B401E2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9816B401E2
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:23:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92C14240005;
 Tue, 25 Oct 2022 18:23:16 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:23:15 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202315.1372ec80@windsurf>
In-Reply-To: <20221023205440.36753-1-fontaine.fabrice@gmail.com>
References: <20221023205440.36753-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUx2ud+QKtDPpOCvCc00CZ4jbylcdl8Wrt2NAm7nYxM=;
 b=nmE37QHo6UmFktg+xjvZBHFJPgL+vagc83mSU0b7LCNY62uwzNuAkioU3bqXAXIJRQ8cXj
 UWKVlUeyOUQRRVpML4RHfm4l7TcZmklYx/6FeJtBuTiNzAgf0cCbYto7Te6Qa2znwaEak8
 q2cKSk7ZaV7hMEIwAMfUPTEV8+saGkcvgP5wTcr0zqA16SP5vsAYU9m++BuTUjX0YTZuuv
 LwerI2j0ufPgW+cHUT34ffAn8M7FMN9mwU//gzbqJ/B6mC0FTyKvEyd0SXRQNEeBJoJsaT
 rFl7FLVQsjLGp5dMEdhHa9osUOFfovVaevEO0OmgbnPwDVBQ0fM+iM3oaLetGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nmE37QHo
Subject: Re: [Buildroot] [PATCH 1/1] package/libminiupnpc: bump to version
 2.2.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Oct 2022 22:54:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> 2022/02/20:
>   upnpc: use of @ to replace local lan address
> 
> 2021/11/09:
>   python module : Allow to specify the root description url
> 
> - Drop patch (already in version)
> - Update hash of LICENSE file (license "refined" for github with
>   https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13)
> 
> http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.2.4.tar.gz
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...akeLists-txt-fix-install-for-headers.patch | 43 -------------------
>  package/libminiupnpc/libminiupnpc.hash        |  4 +-
>  package/libminiupnpc/libminiupnpc.mk          |  2 +-
>  3 files changed, 3 insertions(+), 46 deletions(-)
>  delete mode 100644 package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch

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
