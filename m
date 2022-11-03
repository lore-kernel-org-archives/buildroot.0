Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3033C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7849340BD3;
	Thu,  3 Nov 2022 22:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7849340BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVtcFKFlYvfm; Thu,  3 Nov 2022 22:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B576040520;
	Thu,  3 Nov 2022 22:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B576040520
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E138C1BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA19861042
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA19861042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIC6dyL-SDDZ for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:07:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E9AF6105C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E9AF6105C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:07:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F13A1C000B;
 Thu,  3 Nov 2022 22:07:28 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:07:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221103230727.32487dba@windsurf>
In-Reply-To: <20221101222336.434052-1-fontaine.fabrice@gmail.com>
References: <20221101222336.434052-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667513249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvuRQbozNpoPAZSbAdlKjp5EJ1tk+we9ciVX0oUT4mc=;
 b=TU4z8rqpbdNhdHRIhQFwG84wi5A2Q3P/vtzaHZfHaLxWFd4vLEDWgwv3CoPEXgm0F7g97c
 bO7tCMGIz6B3gtefi974S1zGa1tHSOapwSvDkSAuhB3Eyie5czpZz60gtZYJhSYd6T1zb8
 x3BRkW0ZqxJUK6iA4ygD3UlQJfRzn1Dic0kPGvl9oo2I3dmzFzk9D9NJNRGAv9r/XJUD8b
 avbOPg4eRRtzaCSBZ++FnVVORMf5Ihh4cVbBl3pfLbDNUpQ5gh4+eb7a3Jyix4bD+EkSz7
 8v3MPMwz/4P6iOKANT7wi01ws7HNOXx9cRwKiYTDwodCcOeIV5zrd4KGL/j1kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TU4z8rqp
Subject: Re: [Buildroot] [PATCH 1/1] package/quazip: bump to version 1.3
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 23:23:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/stachenov/quazip/releases/tag/v1.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/quazip/quazip.hash | 2 +-
>  package/quazip/quazip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
