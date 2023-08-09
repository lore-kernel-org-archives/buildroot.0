Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13121C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 18:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D37E418DD;
	Wed,  9 Aug 2023 18:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D37E418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0-TpnhsRKSc; Wed,  9 Aug 2023 18:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF87418C4;
	Wed,  9 Aug 2023 18:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF87418C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A11D61BF331
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7804083A37
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7804083A37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6CCfEFpzgUG for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 18:26:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E95F83A3E
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 18:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E95F83A3E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64BCF20002;
 Wed,  9 Aug 2023 18:26:06 +0000 (UTC)
Date: Wed, 9 Aug 2023 20:26:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230809202605.1fbe18f9@windsurf>
In-Reply-To: <20230809173334.2514813-2-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
 <20230809173334.2514813-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691605569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4qnb9ZfxDbPEwLpF2NqMkEmgtir6nwwSuAprNKPpTs=;
 b=H79KoGJdhI5ORJyW9Syt55TF//WnbR/0qrjgR/ZrUxkJMCsKWuJscpn2MFeKwf6TY2RJAb
 UYzYPY0MmT9sqrJY5x51Hk6GvF2k5vEmeu23LFiH2H/7ka87DTenu0Z+byEAkTWtHLoWl6
 WzaM5j6TIqj6Xor7Zs99yInXTVhaRzKdh+Nv1c08AhK08bEqd6rF6k9J1oZfRLoeKHcWNg
 Pqicsx6GvZ6AhoP4MD+Ed1JpoZa6+G0uAvkNaCOjmk4/A87pjbj9jxhK6mCUwJgSROIiAH
 74nsN+u+hPzQTIX31e3Z4pGZpA6XKdQ2oZ8wOACrhN3TXEEsl8pZXoV/o3Nsqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H79KoGJd
Subject: Re: [Buildroot] [PATCH/next v2 01/16] package/berkeleydb: add
 option for historic dbm interface
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Aug 2023 19:33:19 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Berkeley DB support in python depends on dbm, when missing python fails
> to detect libdb:
> https://github.com/python/cpython/blob/d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4002
> 
> quoting python configure log:
> checking for libdb... no
> 
> quoting python config.log:
> conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'
> 
> This patch provides a configure option for the historic dbm interface
> to be used by the python package.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/berkeleydb/Config.in     | 5 +++++
>  package/berkeleydb/berkeleydb.mk | 1 +
>  2 files changed, 6 insertions(+)

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
