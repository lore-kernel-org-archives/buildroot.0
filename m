Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8979EE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB3C41548;
	Tue, 22 Aug 2023 20:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB3C41548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrKK_czBCVwb; Tue, 22 Aug 2023 20:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC6DA408E3;
	Tue, 22 Aug 2023 20:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC6DA408E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 830FB1BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29C9760A93
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29C9760A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFV6-zcwWDVz for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:06:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 019BB60A8C
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 019BB60A8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95DCA1C0002;
 Tue, 22 Aug 2023 20:06:09 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:06:08 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230822220608.001dae37@windsurf>
In-Reply-To: <ZNkQMgmLXTtuItPp@waldemar-brodkorb.de>
References: <ZNkQMgmLXTtuItPp@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692734770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lKj+mleODMzFtOcQ8puobH2SenzEm76zeS/lDricrXA=;
 b=XbKk+y8XofPH2naDxR1YNk8/luZhCz2FrG3WnLLV6vneWA9Lt4m2folPZKJHCbnFkxiURE
 ALDAJRJWSPlYXQYJkvGeEt+f7IfM0KfSwc6v2NTiKhKF2vhnetg0+4Rn7cG16boqG2zYA7
 g/WxBz0hHOw5Im82NwlbAPtdzJvNe/RFaHUv6OJtuT9URFfUUL01lc6sGkyNvuA4RPF7U2
 soiVKNIxHGgNXx2dmqU4cQm4VrlOAe/RwsRiKSshycSNg7hMaImhsGgjbMU9nLr6lwazeK
 2orbsgkx6/Czx9THB5yIDVlIhDrKGoV1vUwjUz7IGliOZTk3Zpy9RYbHYvdO9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XbKk+y8X
Subject: Re: [Buildroot] [PATCH] package/f2fs-tools: fix musl compile error
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Aug 2023 19:17:38 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +F2FS_TOOLS_CONF_ENV += ac_cv_func_lseek64=yes
> +endif

I am not really happy with this, because it's really a workaround. I am
not sure to fully grasp what the issue is. Apparently, in commit
https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4
in musl, the lseek64 -> lseek alias was removed, and now there is some
dynamic linker trickery instead.

I think the issue is that what f2fs-tools does is wrong, and this is
what needs to be fixed. I would suggest to reach out to the musl
community, as they are usually very good at suggesting how to do things
right.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
