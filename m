Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CBDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D9D6FB7F;
	Thu, 13 Jan 2022 20:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rt7X4FpOIxJv; Thu, 13 Jan 2022 20:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0B3F6FB7D;
	Thu, 13 Jan 2022 20:22:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC2551BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A402140197
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwbeTL8L8nqE for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:22:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D7D94010C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:22:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 75CE460007;
 Thu, 13 Jan 2022 20:22:23 +0000 (UTC)
Date: Thu, 13 Jan 2022 21:22:22 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220113212222.282b9a9c@windsurf>
In-Reply-To: <20220113205437.47e82728@windsurf>
References: <20220113114951.549960-1-jose.pekkarinen@unikie.com>
 <20220113205437.47e82728@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/opensc: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 13 Jan 2022 20:54:37 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> > +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM  
> 
> Unfortunately, this is not acceptable. If it breaks with this
> particular toolchain, it's also likely to break with other toolchains
> that share similar characteristics (gcc version, etc.).

Just pass --disable-strict in OPENSC_CONF_OPTS, and opensc will nicely
build with the Sourcery toolchain.

> > +	select BR2_PACKAGE_PCSC_LITE
> > +	select BR2_PACKAGE_OPENSSL
> > +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL  
> 
> Why do you force OpenSSL here? Is LibreSSL confirmed to not work with
> opensc? If so, please add a comment above this select that explains
> what explain is broken.

I just tested the build with LibreSSL, and it works, so please drop
this BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
