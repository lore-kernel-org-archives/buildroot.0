Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC17FC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 445E440B22;
	Mon,  5 Feb 2024 21:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 445E440B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijBAHKCu0IIQ; Mon,  5 Feb 2024 21:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE1140AFF;
	Mon,  5 Feb 2024 21:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE1140AFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46BB51BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2060C415E9
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2060C415E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cj8V_NFt7AOJ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:24:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE759415E6
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE759415E6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 017401BF203;
 Mon,  5 Feb 2024 21:24:27 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:24:27 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20240205222427.748f3859@windsurf>
In-Reply-To: <20240117192342.2633-1-raphael.pavlidis@gmail.com>
References: <20240117192342.2633-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707168268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qPKODVvkyjMYh9HZQhGCf1SuAZK8nO/d9+ONIUl5g0=;
 b=krVvGdseEMyfKEBuL9ItG4NH5rl1K42klzjqKXbb+HhWxZVui6yvVOmhpQXu/Su/RNH93/
 n260fnCWEdxomfGVu4ibkXiitcECAEowAc2ePm7lel9Ixuy2eXKx7c9ctycT09Hy1rAs4a
 jQylVIVRG3WwKPcK7CFuzpBTzVnMgZyAfnsYOouad+Xu7+Hig0CdpaLLnLJmNHt1nyIJ0i
 G70dLSpfy0knjcbBZJx4Or3pChE7XmQ6bkc4kKYbgFnidaPFV17IPRlOtbfh0dso22v+0H
 RrLj+AS5W3rwk9w+ON6xe2mQWMMurwB2GxeoC/NYrmelXm6CLJf9XQ0269hcXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=krVvGdse
Subject: Re: [Buildroot] [PATCH v1 1/1] package/shadow: bump to version
 4.14.3
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

On Wed, 17 Jan 2024 19:23:42 +0000
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Also, the new version has an optional dependency on libbsd.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  .../shadow/0001-Fix-yescrypt-support.patch    | 38 -------------------
>  package/shadow/shadow.hash                    |  5 ++-
>  package/shadow/shadow.mk                      |  9 ++++-
>  3 files changed, 11 insertions(+), 41 deletions(-)
>  delete mode 100644 package/shadow/0001-Fix-yescrypt-support.patch

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
