Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FAEEE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53174404AF;
	Mon, 21 Aug 2023 22:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53174404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0igmwWFekSqz; Mon, 21 Aug 2023 22:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A184F40B4F;
	Mon, 21 Aug 2023 22:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A184F40B4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 055451BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C58D060E24
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C58D060E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id loVtCLhav9_R for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:11:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E4C060A98
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E4C060A98
Received: by mail.gandi.net (Postfix) with ESMTPSA id 549CA20007;
 Mon, 21 Aug 2023 22:11:29 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:11:27 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230822001127.1967b570@windsurf>
In-Reply-To: <20230821202217.474022-1-ju.o@free.fr>
References: <20230821202217.474022-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692655889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IzTUYcY9GPQa8+2qUsDMFxTbHb3op/4Lke7Tgmpjotw=;
 b=F4NK7aj5WkUhTXssj/pqvClB3LQ4JNyvGq7ic8We/BAt17JDQChu5uM6PgctGvi3hcnJJN
 uY93LeMO0/HWKlulmYN6KB61e0RVfp2qsBE3Nd6jOFyIQLg9CT5zDGLwcuiNSZLyQJXEzW
 l6+yBd6nog4dhWov+ZjEWFl5n9Z7JZJniCQ41SNk/sske6bl3H6ElpFt9z4Fi2OW/Jl1tm
 vR7g8njbxz2+Fa9Q23cpFO9V1eutLSEyUTeST4PQgfMTiGBTR5hqFVfP+GRvn6ei4JqnBl
 VdP7Odf+t6zMPyVvWzaPd7bJyt/NfZrZfstWdRb4sA65vje4fM8CU9tk3C1AlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F4NK7aj5
Subject: Re: [Buildroot] [PATCH next 1/2] package/libassuan: update _SITE
 url to use https
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

On Mon, 21 Aug 2023 22:22:15 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This new _SITE url matches the one published upstream at:
> https://gnupg.org/download/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libassuan/libassuan.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
