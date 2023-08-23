Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9857C27C40
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 20:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76724820F6;
	Wed, 23 Aug 2023 20:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76724820F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZciMGYHL4u2Y; Wed, 23 Aug 2023 20:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B50C7820D9;
	Wed, 23 Aug 2023 20:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B50C7820D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B96DD1BF2BE
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 20:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60727403C7
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 20:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60727403C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5BFX1enLQqA for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 20:45:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B38AF4035D
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 20:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38AF4035D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A78240002;
 Wed, 23 Aug 2023 20:45:43 +0000 (UTC)
Date: Wed, 23 Aug 2023 22:45:42 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230823224542.08943172@windsurf>
In-Reply-To: <ZOXFw5o17WS9rg8n@waldemar-brodkorb.de>
References: <20230822180900.6953F86114@busybox.osuosl.org>
 <ZOXFw5o17WS9rg8n@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692823543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lChmVrjGQxYXS1n1c6WT6hnHxgO3QXCl97pS1CBQ/Og=;
 b=Ls4O9O5Mrl8jl1Adb5RE8mdW3wqMCXIY5pbS1AVeHu8U/NyUtMShmp9N78qjZ7rDNuY5PO
 O56DPjRmSSMtmZgc9g0cp0KeOL+8yKYaL8RuNBIR6dUEoM6Omdo/1b4ZSqVsoVgetvsB/k
 x+CMMiZkPN4gj+gwRmoHS6puV5noIi4/6D+4syeu3ExUaU7INDSxEA64d4K4Zo+IssrmLD
 DnRNBhFC67CzcZh7OPoZXKOSIFLOBX9GHi87+rduujvyiusBkmhzsxOxJDYQvA4FZmYaTG
 /9ZGOWFCZy8ZFE73XLWLFGZ2QxBQEFanMA4BhPg3TSnQ0WJnDxMni/uc6In6IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ls4O9O5M
Subject: Re: [Buildroot] [git commit] package/gmp: fix compile error for
 riscv
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

On Wed, 23 Aug 2023 10:39:31 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

>  I think we need to guard it with BR2_riscv or not?

Ah dammit, you're absolutely right. Will you send a follow-up patch?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
