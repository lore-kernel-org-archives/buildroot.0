Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E29BC00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB90D61027;
	Sun, 30 Jul 2023 20:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB90D61027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQ4iUGpEOaG6; Sun, 30 Jul 2023 20:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C6C961029;
	Sun, 30 Jul 2023 20:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6C961029
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91D731BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78AE061027
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78AE061027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVNGnjnJzu4V for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:45:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C21B61030
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C21B61030
Received: by mail.gandi.net (Postfix) with ESMTPSA id C58DF60002;
 Sun, 30 Jul 2023 20:45:13 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:45:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730224512.62d72513@windsurf>
In-Reply-To: <20230730171232.3381097-1-bernd@kuhls.net>
References: <20230730171232.3381097-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690749919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49bXemeU3/za1i4BvWoLCrRBSXY927O6pPKhZE5uIWg=;
 b=QUj/CSu5hOTc2bKZir1HtuwGBHjFyx5u8KdB0KnJ2YSlXtMLfl1JZo1xjk75dJQlDjDTWc
 caCIJvTVvjGdzyyXh6Yc0JVZ40schOB6F5clewvWESu2I0jiu93WKnGBjUCQ2pCN3T4+jk
 +mUNz7BfRc+oHKc8D73TuTmzCG5gmQnqr6Ret6ECPcOHujaalbpqJMdqWky8Bg9US20dEa
 ombuuElXEurMmASyEG4wcrsXQQTASFj3K3QR5aOOkDk8C4bnnbk2okJhmfev8GMoe6J03i
 elG3PKzK8lcQxy7sijc6a6sFRXOk8Fujtcehsx8yqkTtz6sK6DlMwdC5aEdEcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QUj/CSu5
Subject: Re: [Buildroot] [PATCH 1/5] package/gerbera: bump version to 1.12.1
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
Cc: Semyon Kolganov <semenak94@mail.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 19:12:28 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  .../gerbera/0001-Fix-build-with-fmt-9-0.patch | 36 -------------------
>  package/gerbera/gerbera.hash                  |  2 +-
>  package/gerbera/gerbera.mk                    |  2 +-
>  4 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/gerbera/0001-Fix-build-with-fmt-9-0.patch

Series of 5 patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
