Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B352AC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6183542CDC;
	Tue, 31 Oct 2023 12:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6183542CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOAJbsyFogGq; Tue, 31 Oct 2023 12:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C4D42C4E;
	Tue, 31 Oct 2023 12:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C4D42C4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EDD11BF321
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0589A61383
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0589A61383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phdj-6ynT7AD for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:52:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C18346137B
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C18346137B
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5AC81BF205;
 Tue, 31 Oct 2023 12:52:07 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:52:07 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20231031135207.6de4a317@windsurf>
In-Reply-To: <20231020114236.4129636-3-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698756728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Q25vOm5cgOTu0mTuYmnh38lA+1PERL248f2qBfgWGQ=;
 b=L8WI8TQQuHELxmHgcnY1H1u6S1pBB3YAZJZkToCflAsHkEGkkMtR8ykdUjrYGANm3CMQ6U
 Hur0DqVZeQ5KhCLB972S1NxwgXwDFTgZlO+5XLJ7I/b24E+g4hLhryQHdKCh7rkJXiou+u
 tSYTJD+tpBhxOCA4JkE4FPMsASqhkDk1cbwvkYkVjl4BDqe17WcB5SelO5sJ89nXnOd+8r
 UiFSof+hXNiYZTYt3xLopmHnudeGzPBq8DRQ7ATJR4a94/BWupTsyI4tAlrJZRJhhDz8/l
 3DHu6sUMBsWbvNVKuuvaVb5XDuRTuFNlVze/XWfvtmeUdSnYalPf+/piiCrbpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L8WI8TQQ
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 20 Oct 2023 12:42:29 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> +$(eval $(host-autotools-package))

Thinking more about this, this should very likely be a target package
(newlib-bare-metal) rather than a host package
(host-newlib-bare-metal). Indeed, newlib is really cross-compiled for
the target, it's akin to the glibc/musl/uclibc packages, but for the
bare metal toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
