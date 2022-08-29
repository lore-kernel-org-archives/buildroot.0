Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69361ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 133B940888;
	Mon, 29 Aug 2022 20:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 133B940888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Be_ovnEduhgH; Mon, 29 Aug 2022 20:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3D940883;
	Mon, 29 Aug 2022 20:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB3D940883
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCAB1BF3D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 482C8813D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 482C8813D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3JJSRYyOo2M for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:08:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F042813D2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F042813D2
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:08:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22081C0007;
 Mon, 29 Aug 2022 20:08:21 +0000 (UTC)
Date: Mon, 29 Aug 2022 22:08:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220829220820.3f8912bf@windsurf>
In-Reply-To: <20220829062533.47384-1-fontaine.fabrice@gmail.com>
References: <20220829062533.47384-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661803701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6qib8YQOKDsOTSgC/3RyhoCM2n/nGv5DcC4x7mDytf8=;
 b=mXpo8GzWv8zpHU/YpRiYGnGxfIGLtmN2r+mJaf933AEgXC1xJJsTu4mIP5CtWPUO8Qum0j
 exft6L5mWXxS7SWSu7XBvit/HX8ek5b5yQY+znZywlKCHi+9QSXqjXsHccxRMFCAlnA6Bj
 8VgtSFyBY9RLLjNUJz6crSiAo71omCFamp0Y0w25l5LyEqslVDcZrBgjDnNkcA/Zck89B7
 cGgQX2yaka7k38GRjv0+dKKeUurHeTvP1rN5rtxpTezTZo/v5TrmVJD4VRODoJ2emVM7Fx
 89DC1spzWLBiEFqN8SAOAJHNIFwC4F1Mh8eUHfQ9rFhED6WraLGv7wH/echlMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mXpo8GzW
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libzip: bump to version
 1.9.2
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Aug 2022 08:25:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of license file (contact email address updated with
> https://github.com/nih-at/libzip/commit/401ef3dd977066bc8f9b9ae53ce60934501b47d0)
> 
> https://libzip.org/news/release-1.9.2.html
> https://libzip.org/news/release-1.9.1.html
> https://libzip.org/news/release-1.9.0.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libzip/libzip.hash | 4 ++--
>  package/libzip/libzip.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
