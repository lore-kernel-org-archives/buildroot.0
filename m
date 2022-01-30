Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74669C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3698860AF4;
	Sun, 30 Jan 2022 14:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1zR8i6h2Fle; Sun, 30 Jan 2022 14:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8496260692;
	Sun, 30 Jan 2022 14:57:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4947F1BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34E6F40332
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UiKVYWTnEiX0 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:57:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D61384053C
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:57:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7BEB4240002;
 Sun, 30 Jan 2022 14:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643554649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78ysgwqPr4lK+bHAXDqA4+nD+MIG5mAOhiNA4fz6lJ0=;
 b=aadB2P/P1sIWNBPaDwKlRLcKwNt7v9J+sNXzookpONQUicyPnMhucBuZtugGWpiP4jtNSI
 7flib3/K5oji1iCUlkSxo6hDCbcocNfI3pFxpmHeyn1Bfmj0q1c2eC+0AYVmXQcJc7VTjP
 MHeblr2VIEFsRiO0HvNGq8C7W52y1EuGzhjlvbMVrigcHwFVkqE0c3tqdrQ3s/frDmtkpb
 ps2tOdQYuk85ZWvPZr/h3EagsZIspGByDHn7rhRJ6ZjM78Oq4WZXsAhVCTmN571P/iN9eQ
 MpMHxUNzlUnMgBdKCSncaIscmOOQs9reNIcGjDeYXZ2mVlu5LF7Ipvz+m1IRbg==
Date: Sun, 30 Jan 2022 15:57:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220130155728.7f171314@windsurf>
In-Reply-To: <20220128220738.3028614-1-fontaine.fabrice@gmail.com>
References: <20220128220738.3028614-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: bump to version
 3.14.1
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jan 2022 23:07:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.1
> https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.0
> https://github.com/zhaojh329/libuhttpd/releases/tag/v3.13.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-openssl.c-fix-build-with-wolfssl.patch | 47 -------------------
>  package/libuhttpd/libuhttpd.hash              |  2 +-
>  package/libuhttpd/libuhttpd.mk                |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch

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
