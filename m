Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E95BC19F2B
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 387BF60BDD;
	Wed, 27 Jul 2022 14:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 387BF60BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwllugp8U9f7; Wed, 27 Jul 2022 14:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 644A460D74;
	Wed, 27 Jul 2022 14:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644A460D74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 165BD1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F2F818AC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F2F818AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zuDK7bvpF4Nn for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:55:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75E1B817A3
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75E1B817A3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:55:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 64A9A10000B;
 Wed, 27 Jul 2022 14:55:39 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:55:38 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727165538.22e5ff73@windsurf>
In-Reply-To: <20220727133929.1325636-1-fontaine.fabrice@gmail.com>
References: <20220727133929.1325636-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658933739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44jF/4S/sIIUv7DVMcVBcjxqW/P99avy7ymjKXdh+Xs=;
 b=JZyHavFUTuWSpjehbwbvqaiNLCmV27KEjppNwFud2kYmk+0peSFUbdM0kFTBq5wg9YzJAo
 L1nBpmZqj1Dbsgtx/Zczk0t2Av93greYaTHJKdNYC18hS5rpZz3j+NFHXlguDHJz5sOrkH
 9o87ixZgb1UiB4zFXnLMGUPA3HoGB+LKLW0w8tr99ccWhiklcO/6gfAyPPlcxZWuveLH8W
 nj98To3PP1b9weGGK1aK9tkC8GIDqfEj1nagzYkyC9Vy8zOWnRlPoW6einp/0JEsDiXUdU
 tmISvT6fndERUtttTba7ERfizYt11NeEOR9rz73S/77vPJ0LusX9PKe2cp0INw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JZyHavFU
Subject: Re: [Buildroot] [PATCH 1/1] package/minizip: use minizip-ng
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

On Wed, 27 Jul 2022 15:39:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/nmoinvaz/minizip is a symlink to
> https://github.com/zlib-ng/minizip-ng
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/minizip/Config.in  | 2 +-
>  package/minizip/minizip.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied with a slightly tweak commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
