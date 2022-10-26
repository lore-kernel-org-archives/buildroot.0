Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B6DC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4A780FAF;
	Wed, 26 Oct 2022 19:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D4A780FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3kSC-opBcbd9; Wed, 26 Oct 2022 19:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9304E80FA2;
	Wed, 26 Oct 2022 19:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9304E80FA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4904F1BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1752660D96
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1752660D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Fxj5Wj6B94M for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:53:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C4160D7B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7C4160D7B
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:53:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FE42100004;
 Wed, 26 Oct 2022 19:53:25 +0000 (UTC)
Date: Wed, 26 Oct 2022 21:53:24 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221026215324.63c63c41@windsurf>
In-Reply-To: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666814006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qoCcU8Kvpa5q866H6XEL16DbDxzyKFuI+uLXpSrKlw=;
 b=ihWR2uxP7gmTl1/uIBWQSQiRX3SKpLiGXyBvtYbNSpVTdd6chNV57LxG4IlTQ7XoxIZWC+
 rWsT8K10TC8iKAMNaav4B8FtdxGIdcvKC2ug5NsAjEveKz5PPGESniLU30QYiKUWewQKgw
 qqaV3653OGEubdWHhb3G2atzDwLeUcd0FenMhlpgOwIHCM5ayhklD216V+W5TtGLwJ9aMK
 nBb5aBTVpKYdortl6Zysa1h1SWZ5CFwoUGifN2Cf/g1VRVbV987osz9gJFWJKSkaDI2sKR
 mbVXfpQ51/SMYtx6rtL6X3Cg50CFiK1jsrj7+DI/FSQHyxTjrjOb/1eOjW8WGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ihWR2uxP
Subject: Re: [Buildroot] [PATCH 0/7] Disable packages with CONFIG_WIRELESS
 on s390x
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 15:26:27 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Linux s390x doesn't support CONFIG_WIRELESS so this patchset disable
> all packages with Linux CONFIG_WIRELESS for s390x architecture.
> 
> Giulio Benetti (7):
>   package/rtl8189es: disable package for s390x architecture
>   package/rtl8189fs: disable package for s390x architecture
>   package/rtl8723bu: disable package for s390x architecture
>   package/rtl8723ds: disable package for s390x architecture
>   package/rtl8812au-aircrack-ng: disable package for s390x architecture
>   package/rtl8821au: disable package for s390x architecture
>   package/wilc-driver: disable package for s390x architecture

When I saw this, initially I was a bit "meh", and wondered if some more
generic mechanism wouldn't be more relevant, like a
BR2_LINUX_KERNEL_SUPPORTS_WIRELESS or something like this. But then I
thought that this is the first case for which we have a situation like
that, so we're not sure what other cases will look like.

So for now, I applied your patches as-is, and we can revisit later if
we identify similar issues that would encourage us in finding a more
generic solution to the problem.

So: all patches applied as-is. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
