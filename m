Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98B6C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 770184045C;
	Sat,  4 Nov 2023 20:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 770184045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiD3Z8lQlXXL; Sat,  4 Nov 2023 20:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71E0F4033F;
	Sat,  4 Nov 2023 20:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71E0F4033F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA3881BF20B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B64E860E13
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B64E860E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xc4qyPvVZzfC for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:26:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8920560C00
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8920560C00
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0C221BF203;
 Sat,  4 Nov 2023 20:26:22 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:26:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231104212621.0715724a@windsurf>
In-Reply-To: <20231003123208.2688289-1-bernd@kuhls.net>
References: <20231003123208.2688289-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699129583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HesJgzzS0Yl7s6pRUyrdaW8T2TJ2McobS9FDNSG/1aw=;
 b=BdDxb0rE6vDVKJR4mMYJv2fUStL4Eaf8WwCLsFblHSoYKEmn8rmXxeDW4wNouKAL4BVon1
 4sHmmfTGE6ALNUeKC/ZdsgXKJYgrEjxG4FjQvxPQAJQ5v9Q+Mni4ylU1kDuXgc2IIAfQPD
 aKJxfc+qlPfHnFKdambDHF/rOloWOAZ4emr6cnx/O3uXeAg1jaVYH4kIFr+qG3tPZx8Xh0
 Zs7xi0J2X/h8lcyLFkkXeql6XAySqaTqkdUO3X4kHLshkY0Fd1wFvisSVtEggm7aww9r5h
 ZC1AJsgZoDSZhsJDJuKSsqbL4qIJhmmfcpQMBp+vcpQgB+H1KJG3y07MODUT3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BdDxb0rE
Subject: Re: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.32.3
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

On Tue,  3 Oct 2023 14:32:08 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which was applied upstream:
> https://github.com/madebr/mpg123/commit/e1e6aa201a88d9d7f91c806b71270dd0013c6ca6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mpg123/0001-mpg123-buildfix.patch | 24 -----------------------
>  package/mpg123/mpg123.hash                |  6 +++---
>  package/mpg123/mpg123.mk                  |  2 +-
>  3 files changed, 4 insertions(+), 28 deletions(-)
>  delete mode 100644 package/mpg123/0001-mpg123-buildfix.patch

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
