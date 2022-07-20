Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793D4C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17BC641B6A;
	Wed, 20 Jul 2022 21:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17BC641B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5QMj3HbH6hT; Wed, 20 Jul 2022 21:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50FE41B66;
	Wed, 20 Jul 2022 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D50FE41B66
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 128A21BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D085E612C3
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D085E612C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YE01NYjKt-N for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:36:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BC48612D9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BC48612D9
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:36:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9191960003;
 Wed, 20 Jul 2022 21:36:03 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:36:02 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220720233602.643eb170@windsurf>
In-Reply-To: <20220619210102.1021263-1-fontaine.fabrice@gmail.com>
References: <20220619210102.1021263-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658352963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJcfkTQJdAcCqMjHDoJhFzJRUImZFw0dErJoL8PHLvc=;
 b=b1QfnfspaQlf5ymKDiu3Odw55K/GyC/lfzYws6NgCeNb2C5DIbllOJUOkYF1xmFWVk6Oa/
 itaHRaEgl5wzXWyZplBYuqXJM3MMYAEv8qBEUV4R5og7zERcgwRe5xYzeDf+usvmxb14/k
 ql7dS1KwpjTZGDb62RiMdmZ0UuiE/Sl3xB6YbzGJcV/+xz1hnb5hHLoMJ40mecQk8evTMd
 kMVXJ/gINA/1oEs09fc8HOTanTdVZUMMqogRo81mKhizH2Qgh8Kb2wKkEE2TFiZOrlDWqx
 8nJRwyHzlwrIMiDEKm7juOc44mRNH6rRRFOJCzr9+de/FDb0y9qC0CXvNBajgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b1Qfnfsp
Subject: Re: [Buildroot] [PATCH 1/3] package/bind: drop unrecognized options
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

On Sun, 19 Jun 2022 23:01:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --enable-threads, --with-randomdev, --enable-filter-aaaa, --with-ecdsa,
> --with-eddsa, --with-aes, --with-gost are all unrecognized since bump to
> version 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92:
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --enable-nls, --enable-threads, --with-randomdev, --enable-filter-aaaa, --with-ecdsa, --with-eddsa, --with-aes, --with-gost
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bind/bind.mk | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
