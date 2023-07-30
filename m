Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E89C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 543FD60B42;
	Sun, 30 Jul 2023 10:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 543FD60B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HE77MCQ-QSoq; Sun, 30 Jul 2023 10:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7791660ACA;
	Sun, 30 Jul 2023 10:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7791660ACA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D771B1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CF5881C58
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CF5881C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lrqdV-NqCCop for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:33:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21B778176A
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21B778176A
Received: by mail.gandi.net (Postfix) with ESMTPSA id D36E81BF203;
 Sun, 30 Jul 2023 10:33:03 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:33:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730123302.06112283@windsurf>
In-Reply-To: <20230708200447.3919009-6-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
 <20230708200447.3919009-6-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690713189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQzVg7oU2pAeo2Cn9yI6VXK7PE752uQ/kT26YwrvIBE=;
 b=JQdxPHXpZiVszTECcrvqf6LNZlz5a1O4+OnCm906CAR9rA/NUXdzcsw17a0rlxx4C5G4Ey
 yNxVtE9QQBrHyiYtqWSw3egn/PpHzKGlCZ21qIPzTn92PNBpAus9QKiHXhjjVha9Mo5Xp/
 KJxvhtZZxQQBkow8tTT6N7paY59voZSEISQy4HWEi7r6+tUaPO9afkTcgdR8Fl4te0t4IZ
 hjCU4d3bfceIqYI31i+5veMFsyg41jy4hDb+OyKSc+n1EP0u4K0Q6EaxGBdqXarYYc11p2
 t2o7XomtEWeSP5s/BGH++YwYLKypXB3I38oSlOS+wXE38LtfpkbSkfQMUBgX2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JQdxPHXp
Subject: Re: [Buildroot] [PATCH 6/7] package/kodi-imagedecoder-heif: new
 package
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  8 Jul 2023 22:04:46 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-imagedecoder-heif/Config.in            |  9 +++++++++
>  .../kodi-imagedecoder-heif.hash                     |  3 +++
>  .../kodi-imagedecoder-heif.mk                       | 13 +++++++++++++
>  package/kodi/Config.in                              |  4 ++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/kodi-imagedecoder-heif/Config.in
>  create mode 100644 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
>  create mode 100644 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk

Applied to master, after adding the missing "depends on" in the
Config.in file as well as the Config.in comment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
