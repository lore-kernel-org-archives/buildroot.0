Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3486C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261B660B05;
	Sun, 21 Aug 2022 21:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 261B660B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CsL0g2UwgILc; Sun, 21 Aug 2022 21:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4067560A6C;
	Sun, 21 Aug 2022 21:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4067560A6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B06A1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 21:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F307360A6C
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 21:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F307360A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jvah4ACw8t1t for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 21:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E45D60A6A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E45D60A6A
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 21:03:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A2116240003;
 Sun, 21 Aug 2022 21:03:52 +0000 (UTC)
Date: Sun, 21 Aug 2022 23:03:51 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220821230351.69cee603@windsurf>
In-Reply-To: <20220821153104.239709-2-romain.naour@gmail.com>
References: <20220821153104.239709-1-romain.naour@gmail.com>
 <20220821153104.239709-2-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661115833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQZKYYasJjd7MxComwMwSbNT4ibVXps291bycsRmkaU=;
 b=iitI9DX8nLMTRXOz/Dk0C7Y5E0RwduAVYXf5fIWMRbGDBilT1fAQnDodXhIL6PjpxErnx7
 zalxVTqkg+t57N6x01JtYfokMHwFr0rXsCiP6rTjceoLXRjeeAAFNLWcVjCPGHksFDUT6Q
 SWbUedZ25Ox3d7O/6SW+TkjYWmUgTzLhRxhufJjPlKKwPKsl01R2Lhd043bvGDpTjlZrja
 9FPbx8JHJKW1HuJ8uJugk19O5rumgViDWnaFJeNX5G0sXossae7F4N6BrTX4yav7hLvP06
 4dXjdauA0m8UUik5oFkWbA7rXMrN4X4wi4ia5sU8W4hHidhSV10kEOnMCL0yqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iitI9DX8
Subject: Re: [Buildroot] [for-next] configs: select uclibc when needed
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

Hello,

On Sun, 21 Aug 2022 17:31:04 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Following the switch to Glibc as the default libc in Buildroot [1],
> all defconfigs expecting uClibc with wchar (or any other uClibc
> specific option) must now select BR2_TOOLCHAIN_BUILDROOT_UCLIBC too.
> 
> Some defconfigs provided by Buildroot select BR2_TOOLCHAIN_BUILDROOT_WCHAR
> without selecting BR2_TOOLCHAIN_BUILDROOT_UCLIBC.

I think we should rather switch those defconfigs to use the new
default, i.e glibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
