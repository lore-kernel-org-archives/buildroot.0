Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045A6C00528
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A55660E8E;
	Sun,  6 Aug 2023 21:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A55660E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUqhs9fbrcP1; Sun,  6 Aug 2023 21:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D057960E46;
	Sun,  6 Aug 2023 21:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D057960E46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E68F1BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5CF0400B8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5CF0400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfo3jQ6kj4zD for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:34:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 948F8401D1
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 948F8401D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B241C0002;
 Sun,  6 Aug 2023 21:34:11 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:34:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806233410.2bac4305@windsurf>
In-Reply-To: <20230806140646.4158881-1-bernd@kuhls.net>
References: <20230806140646.4158881-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691357651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNp86Ao20AtpNixsJu53xZieH4GQHrKClbc8mtGfQkQ=;
 b=SbBR37KMlV5oUFAZGD/5/mNeqVjRvAMRkKAQyhYg70L2P20HDj5dwbbQQA3rdG3J/DKQHX
 GPtg8IupmzBS2lDKyhdEyCtdQv6tcQtKiHkazWPbiifUIgQ/Bv48VyBpu37oE8FlDVDMql
 IecoA0915LwQwSj22Gjcf29ku9MQHOsO38dKOKo6nxDCH6GLTKNgJ7IjuXkAytjVshRNjX
 quJNVvEZLrrgJ//RZf585+zgrdZehO6BvjHhT/xW7va6/FfpofsDBYrI1RBvD9wMhk9WJn
 kh6w2xezumpsSsK1hHtp3FOwyjwtkIDCcUfacNk+HXVbrENBwXXXXjhwnuhQ7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SbBR37KM
Subject: Re: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-zattoo: bump
 version to 20.3.14-Nexus
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

On Sun,  6 Aug 2023 16:06:46 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
