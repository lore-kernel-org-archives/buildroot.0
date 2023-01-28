Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340D4C61DA7
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 20:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87CA41748;
	Sat, 28 Jan 2023 20:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87CA41748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7jh-cxKC-tB; Sat, 28 Jan 2023 20:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B677D41745;
	Sat, 28 Jan 2023 20:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B677D41745
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C0D71BF48B
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45B9060E29
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B9060E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LVuxAJHRNJg for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 20:04:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC6660DC2
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAC6660DC2
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 20:04:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AA5C0100004;
 Sat, 28 Jan 2023 20:04:12 +0000 (UTC)
Date: Sat, 28 Jan 2023 21:04:11 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230128210411.1f0fe820@windsurf>
In-Reply-To: <20230124054748.13980-3-fido_max@inbox.ru>
References: <20230124054748.13980-1-fido_max@inbox.ru>
 <20230124054748.13980-3-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674936252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjSvEBHU/3a1EYjf9H3tv/yeylMTPkHJXIu0Shb2RtQ=;
 b=j7Bm2BN+8c/8tWWWiKYyuXxdKyhr65mHR3dHBo7HCpZuQfjnJlOM5W6ktYhBl4PuCy82nC
 0C3g9jWJERAOOf8tpFhVscP7FER7rDPRSlX9eAXFnAWxynG50E3zJLTTVWBZcl95/IPuuE
 xceX6jxHr6YdbxuKb1aOEdzp9aPd4Uki1l2QZFWqhbhgAvsiDv2qjctSdYc/Qkbl8xtWLl
 GrcrrpXzrOuH4DJDrn1DX9cndX3q1I4ZYCqH3mctauhBSp639z47O1K1EYGFhu+0PobxJV
 RXBxZhebAKuH7Hfvh1xQmWPpjSwggnvzQNycnLs7gQ1fhhtVicmTI7qmXhk5BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j7Bm2BN+
Subject: Re: [Buildroot] [PATCH 3/3] package/postgresql: add lz4 and zstd
 support
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

On Tue, 24 Jan 2023 08:47:48 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> PostgreSQL has optional compression support (LZ4 and Zstandard).
> So enable it if libraries are available.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/postgresql.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 5313e03b12..1f787231f8 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -58,6 +58,16 @@ else
>  POSTGRESQL_CONF_OPTS += --without-zlib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +POSTGRESQL_DEPENDENCIES += zstd
> +POSTGRESQL_CONF_OPTS += --with-zstd

Could add an explicit else clause here to pass --without-zstd ?

> +endif
> +
> +ifeq ($(BR2_PACKAGE_LZ4),y)
> +POSTGRESQL_DEPENDENCIES += lz4
> +POSTGRESQL_CONF_OPTS += --with-lz4

Same here ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
