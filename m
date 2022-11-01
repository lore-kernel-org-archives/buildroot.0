Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A386C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6560410B8;
	Tue,  1 Nov 2022 20:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6560410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4F_P6KopUvth; Tue,  1 Nov 2022 20:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C573C410A7;
	Tue,  1 Nov 2022 20:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C573C410A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E96951BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3FBE60AF6
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3FBE60AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPYE_YbBYOre for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:32:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E8B60AA7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5E8B60AA7
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:32:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92BE8C0005;
 Tue,  1 Nov 2022 20:32:41 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:32:40 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221101213240.031261eb@windsurf>
In-Reply-To: <fe30717bf4f0096985334e3e23fd1f1573eb53f9.1667288516.git.baruch@tkos.co.il>
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
 <fe30717bf4f0096985334e3e23fd1f1573eb53f9.1667288516.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667334763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2iIK9B4y+i9lGRAp8KQ5zmVZnAKxDmHH2wdtyYEZEM=;
 b=SLAlsjsp0eZJflTD0DK0h6y8rFlQIdFRuZztYaSZ3D/7Kr/oN5wsb3WbvAENBA2yAD+hQg
 G8NVZvTFaVvNypA6a0SPMrDrpL85u+QgxeW4Ssm+wCZAQ7ZFUv8fEI+IHjsguQr3S57nv/
 3zFaujlxtfYwVXCcsG4lH8GTpj6rE7TBWYJbHC4VZ4YbLd2NTFEcvis84sz6W/1bVxkf1z
 wtH6EG6gQIOcug84dbZ4P5cYcQTPlz6FzkK1TmRFQDVDH7HyJtnTO6EhPA7EUqMXG8XHOY
 7LHMwpOrvkoT8A29Hhup90vS+ancEEp7A5pPxdwnHnvz6UR2j2mCjIrEKcUdWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SLAlsjsp
Subject: Re: [Buildroot] [PATCH 2/3] package/socat: disable openssl for
 static build
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Baruch,

On Tue,  1 Nov 2022 09:41:55 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> socal configure script does not take the zlib dependency into account
> when linking with libssl. This break static link. There is not easy way
> to add zlib dependency, so just disable openssl for static builds.

Even:

SOCAT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`

does not work?

Also, do you have an autobuilder failure for this issue? Or you just
encountered it locally?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
