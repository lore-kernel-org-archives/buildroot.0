Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86852C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384458177C;
	Sun, 24 Dec 2023 17:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 384458177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9dA4vsQNsxp; Sun, 24 Dec 2023 17:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9095F81CE3;
	Sun, 24 Dec 2023 17:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9095F81CE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B89ED1BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91BDC819B8
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91BDC819B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MuBI1edO_Yf9 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:54:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 885708177C
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885708177C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6ECE1C0002;
 Sun, 24 Dec 2023 17:53:58 +0000 (UTC)
Date: Sun, 24 Dec 2023 18:53:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231224185357.4a058a3e@windsurf>
In-Reply-To: <20231224081512.19928-1-bernd@kuhls.net>
References: <20231224081512.19928-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703440438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeFyLwWK0HelE+Mi7IgFOctOWhPk+anRjuOwfmzyWq0=;
 b=ggBKRnSE9lRngOjMqJuxGHMKO7VBa6FnaHfmEjY9iAQhEro8gYPH5qlvMTpmPT38cd9t2Q
 8UrCI+0hWJnQTJvhJ6iBlGaM0E0m4afL5hd60K7cHpljThbtrRdnF1GOt9l6dhOXlx/Mc0
 KY0CcXwc6Ns9W62HM8BVfPEXvQo/nYFLc5Yh+/z8+2UgZxC6JMLHYCC1jxj5fp61az70Md
 Mv760U+yH+vRkHyp5xMupexLgAAHig1Dq5G5TgzX1vIqHcUo6RDUe/vgiomZMW8HQRQRu+
 ce+SIH/rx9HIzLEJ4COzR2KOVW/f+6zzyHWuoaBrQNpHc78WiDvqGlSFHL2KNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ggBKRnSE
Subject: Re: [Buildroot] [PATCH 1/3] package/libxslt: bump to version 1.1.39
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Dec 2023 09:15:10 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.39.news
> 
> Fixes:
> http://autobuild.buildroot.net/results/8dc/8dc9b1fb68c196deace94951ed81a9a520f98973//
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libxslt/libxslt.hash | 4 ++--
>  package/libxslt/libxslt.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
