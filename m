Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48562C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFB9541815;
	Wed, 30 Aug 2023 21:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB9541815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8j0gsAZpX_g5; Wed, 30 Aug 2023 21:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5824441883;
	Wed, 30 Aug 2023 21:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5824441883
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 315CB1BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F22E24181D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22E24181D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBJXSYH5SxN8 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:58:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15D4041815
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15D4041815
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41A53FF805;
 Wed, 30 Aug 2023 21:58:55 +0000 (UTC)
Date: Wed, 30 Aug 2023 23:58:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230830235854.4dbb1636@windsurf>
In-Reply-To: <20230830204213.1158602-1-bernd@kuhls.net>
References: <20230830204213.1158602-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693432735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3tbKelFQIZSC4Q89ra9PuriQc9yBSe+sFwYbnT/r+k=;
 b=BjjigCPTf+Cx/vWwcBg+eUUuBVRgAO95B18UkpuPRaS8KySjycxCld5/ojuNzLSlq2EDZz
 FAKd0X9jQyG6vIFD4OeyG3Uzuz6p3M0zl8+tjP3C1sDLK7nRvYRLVdhICSZE8y/yJHP5tG
 XucG0CBdp69AB9frgc6wOJID47QxZ8zfOmcg7hPKTTxhB0d4Bg9CO0jAHRAh8ztxfhpwJE
 OjKS9eo3PjVKTxbdmDDI0e1TcHGyJsyrcO69Ae10wSUj3ncV3W0OYzP6yJwwllwk8gvcMK
 u1EiDQ9yIWVLzNpOEaK2TxF1tZPyeGpNLViKtrEFoVUBIFwjb9pLGIhkbCd+2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BjjigCPT
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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

On Wed, 30 Aug 2023 22:42:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in                      |  2 +-
>  linux/linux.hash                     | 14 +++++++-------
>  package/linux-headers/Config.in.host | 14 +++++++-------
>  3 files changed, 15 insertions(+), 15 deletions(-)

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
