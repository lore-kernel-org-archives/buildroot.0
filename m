Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FC9C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50CBE405F5;
	Wed, 26 Oct 2022 19:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50CBE405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ypunRHZyxGp; Wed, 26 Oct 2022 19:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8053C405EB;
	Wed, 26 Oct 2022 19:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8053C405EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 866561BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58231408A7
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58231408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id STL9lShxZhvc for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:51:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170C440210
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 170C440210
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:51:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0758FF804;
 Wed, 26 Oct 2022 19:50:59 +0000 (UTC)
Date: Wed, 26 Oct 2022 21:50:58 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221026215058.1e623bb4@windsurf>
In-Reply-To: <20221026193508.482276-1-christian@paral.in>
References: <20221026193508.482276-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666813860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICEtd9jUu2fPabpZf0MZk11V9zgt/akHfCSOC7Y5Mj8=;
 b=cQE9ohsF5LFj04ESsvjmO1AqZiwt7FlYgE4/RjxkRZfxkx8IHgBKPZcZKjLQs+kaY8yfPe
 q0Kqx3HyN+5F7G27kv6r0qSpPx2ZkYrMYiJWs2mfUnY31CYd4yXreNS8eAZloE0LZ0lMmc
 4+/ulyl7opF8y+V1/f4W4quK7z6R5ZILD8hJOPpZ8+bX/LxVruyJj37PY1bIdd0Y2s3n2c
 SQVWYS+48Bh6bzH/NddsuPWizgcpQSrhzO2XVykIw6LqmYq4eNM/mhhUItUBq/CKJVzFt9
 NVnD0jE1aOTdwO2/HRFSK37LP4dR3NF0xT3hacgIIRuMRRzyq2ik5s8+HquTbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cQE9ohsF
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to 1.19.2
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 12:35:08 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> go1.19.2 includes security fixes to the archive/tar, net/http/httputil, and
> regexp packages, as well as bug fixes to the compiler, the linker, the runtime,
> and the go/types package.
> 
> https://go.dev/doc/devel/release#go1.19
> https://github.com/golang/go/issues?q=milestone%3AGo1.19.2+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
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
