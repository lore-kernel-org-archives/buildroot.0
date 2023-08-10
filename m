Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D7CC04A94
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0632041DF7;
	Thu, 10 Aug 2023 20:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0632041DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0wDK7R8irom; Thu, 10 Aug 2023 20:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E65841DBE;
	Thu, 10 Aug 2023 20:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E65841DBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2BC31BF97F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9AAD41DBE
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AAD41DBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8eywmgHbiIWT for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:37:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54BC341C5A
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54BC341C5A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 598E720003;
 Thu, 10 Aug 2023 20:37:06 +0000 (UTC)
Date: Thu, 10 Aug 2023 22:37:05 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20230810223705.2a96aef5@windsurf>
In-Reply-To: <20230809123847.1192879-1-zgyarmati@zgyarmati.de>
References: <20230809123847.1192879-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691699826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+NZG6xSHjVag3bV7/jOsKjWzhSPS87K/ts048qev7Y=;
 b=fykB+zudInZGOpluv0oEZzV/9lHpxaQvmDFP/nyJqUL/m/YVZIoopmjhSOLd91mLsMrI4a
 N0Rfh3Z1v0SS07DUHHIF9NMEG6YKM0+hU0Tl7R1zTC7vhK5HbZoM9wy0SEjSxxvUL15CIN
 IZGWcJF6Iqh7tdRHevA+p8+XVbf8n7aCz3KafXgTO4ukAjBYoODQCugpX6P8n38wU1/yDG
 mwD0Cjfe5HWGJcogKRjkX6rBumy/xWaAVa4EKIZWevC5mWK/lBoMfef+agab83O9CHFDqS
 /8qralCRGiX7WU6gKWXmwlWHTiTtFqPduNvsrWPeyeROvRLDUR762lzPKIgc0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fykB+zud
Subject: Re: [Buildroot] [PATCH 1/1] package/grantlee: bump to 5.3.1
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

Hello Zoltan,

On Wed,  9 Aug 2023 14:38:47 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Now it also selects
> BR2_PACKAGE_QT5DECLARATIVE
> BR2_PACKAGE_QT5DECLARATIVE_QUICK
> as the new version requires it.
> 
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

Are you sure that BR2_PACKAGE_QT5DECLARATIVE_QUICK is needed? From my
testing, and also reading of the CMakeLists.txt from grantlee, it seems
to not be needed. Could you check this, and send a v2?

Some other suggestions about grantlee, of course that should be handled
as separate patches:

- Grantlee is now also compatible with Qt6, so it would be good to
  support this

- It seems that Qt5Gui is only needed by the textdocument library,
  which can be disabled by -DBUILD_TEXTDOCUMENT=OFF. Perhaps we can
  make that optional?

- Generally speaking, Grantlee has a few options to compile or not
  compile certain parts of it:

option( BUILD_TEMPLATES "Build the Grantlee template library" TRUE )
option( BUILD_TEXTDOCUMENT "Build the Grantlee textdocument library" TRUE )
option( BUILD_MAIN_PLUGINS "Build the Grantlee Templates plugins" TRUE )
option( BUILD_I18N_PLUGIN "Build the Grantlee Templates i18n plugin" TRUE )

  Does it make sense to support some of them, or is Grantlee only
  useful with the full thing built?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
