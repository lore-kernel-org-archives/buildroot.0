Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A506C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0274402E5;
	Mon,  6 Feb 2023 08:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0274402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYoDKiGRV6Fs; Mon,  6 Feb 2023 08:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27B1B4023F;
	Mon,  6 Feb 2023 08:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27B1B4023F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B12D31BF329
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81AE5411C6
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81AE5411C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lYsFKu9JKDF for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 08:47:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E8A410E8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3E8A410E8
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 08:47:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A0C1C000D;
 Mon,  6 Feb 2023 08:47:28 +0000 (UTC)
Date: Mon, 6 Feb 2023 09:47:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230206094727.07b2902b@windsurf>
In-Reply-To: <20230119184846.3693-1-fontaine.fabrice@gmail.com>
References: <20230119184846.3693-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675673249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27Y7y3wPvnfxIBWnVBCv5b3K4xH4tdfGPjZ3wmZKua0=;
 b=bmwUjLydDzJYYNkIigeGj+Sz2rBhZpHQQgSDQal3WlGUijYtgiS34n6YNYR+eWpGuoyUyy
 xW+FDVx3fPGaD6pWhn8ZRyO0MSNYdGaLwisN2+6QUdIVMTNQX9QqDgpmSeTIMURGW92AVL
 Y+jHTJdI6cU9BUBemQQjei60sFdGisqr5NduoDTVf0+p6bXhN5UG5a6VTINaBLXYHlE47l
 Q/9GP/moywEz3GXn0Mn9N0L5nXWLcVNb8O0D82icPEPiHaLW/ZSIXncBU1HvLNMF0+6Cer
 dBdVHLBQeiMqvnPegVC/6NIXTY4A0hbO0Xjd6iHVq8LlI9ST70plN8XWOX7HCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bmwUjLyd
Subject: Re: [Buildroot] [PATCH 1/1] package/xxhash: set MOREFLAGS
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

On Thu, 19 Jan 2023 19:48:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set MOREFLAGS instead of overriding CFLAGS to avoid the following build
> failure raised since commit 94b66fb49cd57d0863245fbe0a3dc0833e76aad0:
> 
> /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /tmp/ccabb8cF.o: relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/953133575d8c13266f1450fa545e70e4a518508d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xxhash/xxhash.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

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
