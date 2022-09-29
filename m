Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2B7C04A95
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 06:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADF5640B1D;
	Thu, 29 Sep 2022 06:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF5640B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhyFJJknDh-s; Thu, 29 Sep 2022 06:40:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D08C4402B1;
	Thu, 29 Sep 2022 06:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08C4402B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1622C1BF3E1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 06:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC24160E63
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 06:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC24160E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFot6fZyZA9K for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 06:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A6C760E2E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A6C760E2E
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 06:40:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E02F3FF809;
 Thu, 29 Sep 2022 06:40:07 +0000 (UTC)
Date: Thu, 29 Sep 2022 08:40:06 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220929084006.64c0a629@windsurf>
In-Reply-To: <dda7b7d2-4846-6623-5ca7-39799015a138@gmail.com>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
 <20220928233856.77bb191c@windsurf>
 <dda7b7d2-4846-6623-5ca7-39799015a138@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664433608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jALRbm7yknOhX9Rrr0nj7bygFxfR3QugrV9vx3ZKTDs=;
 b=RPJ75q9/7bARAi8c+YsKP6yAjsmXAepC0tj3knedQ7q1fBgpvFppYO/6XaocWqyNODNfQ0
 WhJL+oLeAK5FnSdpq6icy959x4UkTQ8Gb9BuUzeeXvGLh2npK5pQxUpxj2yse/8yvYIO+N
 53cUOCbms5rEufnACpdNu5CJIBXxlgLC8XNhDOdjZIDDUgjqsFXg/MyPovRB9lJu3H8xNP
 6ug2mE9HIsZCW3LJOJGm52o6km/fzx66Rba8oSwqIBLTd942uICrh24ygE+WrY9v/DWdyK
 ltna9LMWU5lXumskA8Xasm62l7NE3pBLyj6pmVTA7rOJEajZZs4JY26BX0RU/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RPJ75q9/
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Sep 2022 15:28:58 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> ./host/bin/aarch64-linux-readelf -h 
> build/linux-custom/tools/perf/tests/pe-file.exe | sed -r -e '/^ 
> Machine: +(.+)/!d; s//\1/;' | head -1
> IMAGE_FILE_MACHINE_AMD64 (0x8664)

Could you provide the full output? In other words, I'm interested to
see if it's really readelf showing the same "Machine:" field as for
regular ELF files, or if it's something somewhat different that we
could distinguish.

> I should mention that the readelf binary in this case is the LLVM Object 
> Reader and it does support PE/COFF which is probably why it even 
> remotely attempts to parse the file.

How come your readelf is from LLVM? Are you using an external toolchain
that isn't based on the standard GNU Binutils?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
