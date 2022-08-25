Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808C3C04AA5
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 08:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38FF41833;
	Thu, 25 Aug 2022 08:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F38FF41833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vfMZ7Za6oD3; Thu, 25 Aug 2022 08:43:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B88704182D;
	Thu, 25 Aug 2022 08:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B88704182D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1FEA1BF37C
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 08:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C46360C23
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 08:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C46360C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YOe9PP8ubPHm for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 08:43:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553DF60B9F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 553DF60B9F
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 08:43:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 725851C0002;
 Thu, 25 Aug 2022 08:43:43 +0000 (UTC)
Date: Thu, 25 Aug 2022 10:43:42 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220825104342.61d691ac@windsurf>
In-Reply-To: <20220825073951.3920874-1-jesseevg@gmail.com>
References: <20220825073951.3920874-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661417023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZyRKmFOVrxgGNJT/Qka3ZnPU/pl5FS4tsbyL5zIPuVc=;
 b=V8Q0H40RifrS6Ezeij+E2QR5kOy+rOyypXddbbmt4mOxSQ/8T/pUVbMSo0Bz3KXtkaqB4y
 tHH2aUvZ+sz9T8Ew26Ni0H35+Csyd6eI94k4wLZMlqwtWtDFSFvvKBhKa1OZ5RROa8v+R1
 Stf1ljQeqPxS4ymr1wr9OZ20ydKMjUg9UBjisN5cEjRqKRNUkR274iFbX+LIEv7QC9OYLj
 TCJWZFOBP0y3eYOjI3gk7gv54Mcmrr9GTM8oJYbB4ExpBphQW6/x4wtdcR6Zg4mxxKYhDB
 DvKIX8NV+jPQdF1X/CRO+qEo7ERnPQGjSCRJk6qGqLbMvJE28X8Z2I7sTfn1DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V8Q0H40R
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: extend qt6
 configuration
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

Hello Jesse,

On Thu, 25 Aug 2022 09:39:51 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> This will bring the qt6base functionality mostly on par with the qt5base
> package, building the package has been tested to the best of my ability
> and went without error as far as I can test.
> One bug to be noted is that for the GUI with fontconfig without harfbuzz
> support, this will produce incorrectly rendered text for version 6.3.1,
> see https://bugreports.qt.io/browse/QTBUG-101430
> I have however already verified that 6.3.2 and 6.4.0 will fix this issue
> so I've decided not to add harfbuzz as a fontconfig dependency as a
> version bump (which should be soon) will fix it.

Yes, let's bump to 6.4.0 then.

> Also add the version hashes for qt6base.
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>

Overall, this needs to be split into a number of patches:

 - One adding the hash file, with just the hash of the tarball

 - One adding the license information (which is totally missing today,
   and I noticed due to your addition of the hash file) together with
   the hashes of the license files

 - Several patches adding the different options. I'm not too keen on
   copy/pasting directly the qt5 logic, as I'm not sure all the
   dependencies are exactly the same, so let's do this one feature at a
   time.


> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +QT6BASE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
> +else
> +QT6BASE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
> +endif

This is already handled by the cmake-package infrastructure, do no need
to handle CMAKE_BUILD_TYPE.

> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +# Qt 5.8 needs atomics, which on various architectures are in -latomic
> +QT6BASE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-latomic"

Is this also needed with Qt6 ? (Most likely yes, but the comment is
weird, another reason why I don't like the copy/pasting from Qt5).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
