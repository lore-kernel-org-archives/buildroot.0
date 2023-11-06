Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F63AC0018A
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED1C142221;
	Mon,  6 Nov 2023 22:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED1C142221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZtLoRZNC1mz; Mon,  6 Nov 2023 22:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160F642189;
	Mon,  6 Nov 2023 22:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 160F642189
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50EE01BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 173F5824D4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 173F5824D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZSLQtJvnnCv for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:06 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C6AE8293D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6AE8293D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F4A060005;
 Mon,  6 Nov 2023 22:26:04 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:09 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232409.55e9df5b@windsurf>
In-Reply-To: <20231105063958.2861207-1-james.hilliard1@gmail.com>
References: <20231105063958.2861207-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IAKXxoGafFbMKnJWOlcB2uC/3jTKZo/4dnVm2myWkU=;
 b=kGEgEjLvJvs6NFgEnjt0WtSDu2WYJme1Ikr5G97e/ErRorlMuShfgXdd5//rHuC6vDK/8N
 nimxEzNj6RYjrI81Al49RogeLm0EpP8kO+IYpB4cu+yTt2nd3QQeT8kHCNiNaua4EIf71w
 hYutBApa3fTQls3lsu9ZmzDbpH8FLBC8o/XMJ/y+EVoW/TR7HFHQgXiEZkBMT7PbM9bXWi
 I3wMKJmJRLYIfCgBAj7ElXIid6k1L0jhFXUdje3YQfNhqO9pCmKsMv8v2cDZfOysvOUtFy
 PGiIBcahyvjlszhKBLxqjuicT6vgoG9YdXZOIqSH6ehBa2ycXAJQNGPwmfmHSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kGEgEjLv
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-wtf: bump to
 version 1.2.1
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

On Sun,  5 Nov 2023 00:39:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-wtf/python-flask-wtf.hash | 4 ++--
>  package/python-flask-wtf/python-flask-wtf.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
