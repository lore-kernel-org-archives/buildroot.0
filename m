Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C72C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 19:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D9C640616;
	Wed,  6 Jul 2022 19:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D9C640616
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-c6v5hErJGL; Wed,  6 Jul 2022 19:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02CFE405DF;
	Wed,  6 Jul 2022 19:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02CFE405DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06BC11BF32D
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 19:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5D5F83EAB
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 19:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5D5F83EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kq5HSDJa1Kxp for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 19:52:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13068814BA
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13068814BA
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 19:52:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1090200004;
 Wed,  6 Jul 2022 19:52:35 +0000 (UTC)
Date: Wed, 6 Jul 2022 21:52:34 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220706215234.71f1c5d7@windsurf>
In-Reply-To: <20220704055649.2780-1-heiko.thiery@gmail.com>
References: <20220704055649.2780-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657137157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CR7R6/XepEiktHEmg7kfLrk82H30oxyAKm+3cYv9kEw=;
 b=EZG3Zgje03YiLfs01CJFTbLY434oCep4A1Bs+TBT6eR6soFSysOUMCBxI4TV/vBapNcO8u
 ZBe/to5YKRTzaPU5wvHQEJphDZX8jngKEA3m0W3uxqJ5/wEgxaMojc8FIFeHoz7nOkU1nc
 StJF+j+8g2VhdEMBYwqAdb2zgllk/8vjEIRY3a+8L1vEAXMXWy4tJ8me89YmAuQN4rsvyR
 LTUw8JCBxVuN3aiI1mIZ0Cy2wQKCLWOwCEx9Bjtde0jSG40lpDnuszEge36ucb/uq/MpJp
 y2OoCDkpXVrXHQRqBO2hFkRVA63aUemUraNGUV4OEkVwuNqDByT/87Ch49oN8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EZG3Zgje
Subject: Re: [Buildroot] [PATCH 1/4] package/libyang: bump version to 2.0.194
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
Cc: Jan =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  4 Jul 2022 07:56:47 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/libyang/libyang.hash | 2 +-
>  package/libyang/libyang.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
