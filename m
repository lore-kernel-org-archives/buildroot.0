Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE4EE57DF
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 237B46062F;
	Sun, 10 Sep 2023 16:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 237B46062F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uETcgMBg0Mdi; Sun, 10 Sep 2023 16:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846A1605BE;
	Sun, 10 Sep 2023 16:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 846A1605BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3780E1BF2A3
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10E3F60A8A
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10E3F60A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTcpcRaFr1HB for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:26:42 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32271607F5
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32271607F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BA2C240004;
 Sun, 10 Sep 2023 16:26:38 +0000 (UTC)
Date: Sun, 10 Sep 2023 18:26:37 +0200
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20230910182637.180ac9dc@windsurf>
In-Reply-To: <20230905064554.806567-1-fido_max@inbox.ru>
References: <20230905064554.806567-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694363199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhy46m8GRKmxjgufdC9C5RoxiKXlhqFkz+g9WK2SM0k=;
 b=D78ikYD/c596H8Q0T2GeJ5rhI1k5DOhUoktBLTKfIGe0moK3sl4Zmyh7uU8fNJu5yTkqKu
 n9MqiwE7cI8jfnb0TAdilRAe5+TsOr0QdXPH6qHTufYXuMZWVLLDNUJhWYPbxI/UM8dcpW
 Iy4r0sJfdz3edBaLKHgJkVOBht/EyFp8GxrA8+525DUZwehq2LcrRJmnQm7NdwwKsiLCOk
 IMj2z/oPcpQyNjjvvbHr5Pz0wiGGYFXLB8iinpgoAU65DodYNhtpFEZdmj3ZDeOcfzb8WY
 OEIiqddIsQgO1xAymrtdBzt72dzSQtUBjumpfPUsikgnUAN3CbYuhXuT4IOnVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D78ikYD/
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.11.2
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  5 Sep 2023 09:45:54 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Release notes: https://github.com/timescale/timescaledb/blob/2.11.2/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
