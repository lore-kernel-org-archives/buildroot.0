Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD504EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AAF460672;
	Sun, 10 Sep 2023 16:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AAF460672
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Jmwp6JkeIBK; Sun, 10 Sep 2023 16:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04F46062F;
	Sun, 10 Sep 2023 16:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A04F46062F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DF131BF2A3
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A0FC605BE
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A0FC605BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RBkHzezy_86 for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:26:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FDB860655
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FDB860655
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4E4940007;
 Sun, 10 Sep 2023 16:26:43 +0000 (UTC)
Date: Sun, 10 Sep 2023 18:26:42 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230910182642.7ade80c5@windsurf>
In-Reply-To: <20230905071119.1277036-1-fido_max@inbox.ru>
References: <20230905071119.1277036-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694363204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0xGx7vIUEXzV5AayL+iVZw5d8sO++QSyKFbWNKUABU=;
 b=dufHJkaW8rzi61kJ0WbHT43pG6p7mtq+Y8T8fYXPbU0i8E5LxSEDYjLXpA5FdjKoTvWPx1
 MSwiZMHv6WCQ1nkK3o0O+HoW2szic7/Gj6d+DP2IlsZaEMfsyaZQxJzUkyZWbNpx+rFrHd
 2UINK59esIBHvKNyxK/wbh/w1DMiSQMwuBdCnpRZEMvI4rxAW1vzAeXRlBXugL+rP1UAU9
 P+lXk/Xgy3oHYdufyOAzDMX483bckIxsvQcSJ9upRparlghZAQRiQ5PW/VMOHVzfdvEgyT
 WxX8HjNkAzhclo7u8kTZTMgx5z1qCuNHPZN4Nk+6emT8qRJtq6oqhPnYLD5pPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dufHJkaW
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.9.2
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

On Tue,  5 Sep 2023 10:11:19 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.9.2
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/osm2pgsql/Config.in      | 1 +
>  package/osm2pgsql/osm2pgsql.hash | 2 +-
>  package/osm2pgsql/osm2pgsql.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)

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
