Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA71EB64DD
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3917860ABE;
	Sat,  1 Jul 2023 14:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3917860ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xX3TR-sD8PJQ; Sat,  1 Jul 2023 14:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 785C360EE1;
	Sat,  1 Jul 2023 14:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 785C360EE1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0A21BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 121BE400F5
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121BE400F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kyb-vkwfKrYH for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:14:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D76416AB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69D76416AB
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:14:13 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E84631BF204;
 Sat,  1 Jul 2023 14:14:09 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:14:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701161408.441a4e83@windsurf>
In-Reply-To: <20230627182538.259570-1-bernd@kuhls.net>
References: <20230627182538.259570-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688220850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciGKQYtCmEWOcxGjOM+VvlHJ6lQHxAws/wR2+7PlTc0=;
 b=iiUmO36wJMGedzJgCZVQ5nuC5Tg927Gld78UUm/jHD/aKoEV68XpyB0TiCkU8fu7KtZOna
 JrLLG+/3/b6qm5TJ5PpN/5zRX/klBShvMwINb89Uthv06EyRTU6EXHmxwaXR38DAc98cUf
 LBKTKapLObeWXFEb8++JCMdlxK4GEZYLVKI4+dvIG5q089f9cbz6WR1NEYG207FJVqHUcV
 HvrobrsYH+9dZFt52wsusxsZcU9cJ+0pKpS1yj4To1BVf3WaATHggJKxxcnbvl2hX8tnVm
 so++Q5mdC+qICDT/v8Y4HIYSh0QLz7d8gHfGy+s0yA/IV0eCeuiFBgO2Kii+1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iiUmO36w
Subject: Re: [Buildroot] [PATCH 1/1] package/audit: update musl fix
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

On Tue, 27 Jun 2023 20:25:38 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream proposed a different fix:
> https://github.com/linux-audit/audit-userspace/pull/311#issuecomment-1609953611
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...ine-__attribute_malloc__-when-needed.patch | 35 +++++++++++++++++
>  ...ute_malloc__-with-__attribute__-__ma.patch | 39 -------------------
>  2 files changed, 35 insertions(+), 39 deletions(-)
>  create mode 100644 package/audit/0001-Define-__attribute_malloc__-when-needed.patch
>  delete mode 100644 package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch

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
