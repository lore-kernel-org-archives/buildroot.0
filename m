Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7A3C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB83B820E9;
	Tue, 21 Feb 2023 08:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB83B820E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHNT4-nrEomP; Tue, 21 Feb 2023 08:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C63822DD;
	Tue, 21 Feb 2023 08:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C63822DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4301BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18E3B82016
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E3B82016
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qzh_7Ml3EbtN for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:23:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34FE81FFF
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D34FE81FFF
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:23:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E436C240002;
 Tue, 21 Feb 2023 08:23:16 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:23:16 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230221092316.12468ad1@windsurf>
In-Reply-To: <20230220234200.464390-1-ju.o@free.fr>
References: <20230220234200.464390-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676967797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIgEqL1fA8DqAt1Vl4Gncpu4fWUSdES4ydkK01QeBrY=;
 b=iUqatURzQepoHqnk9KCxeP40DlRqXwvOR6uyr0yD0VpGvnWhR6ggItC2GoCYRDrTTntFLS
 JiqZsXQac+qfWYaEf7o14Q9m0gtafyQWH8I3cLc9dAjVTtlNz+yLv0rf+a98h+d0PvF+JF
 KCw937ibYT/TwXcusRrLOwGNKrUm5jPc8CKH+cIxygQXSJREIk/kvemT6GvJ8IDOUN5sHv
 waMyOBR/bduC3wp7iB52pW6UQ4AzSAIF0k1+X/ym61ady4GN/izdUI2HkdXQksn8U7JrvO
 KKETjkS7M0BBvVMqzG45GVQkVxHNw1n7IZJ0bpqkUKQKQF3JSivvmt+9H0egCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iUqatURz
Subject: Re: [Buildroot] [PATCH 1/1] package/highway: bump to version 1.0.3
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

On Tue, 21 Feb 2023 00:42:00 +0100
Julien Olivain <ju.o@free.fr> wrote:

> - Dropped patch upstreamed in:
>   https://github.com/google/highway/commit/1cab22047a6ef750ef2bc38ad47d6e765d6d376a
> 
> - Add an upstream patch, not in 1.0.3 release:
>   https://github.com/google/highway/commit/411300d0eec10d5635cbdd064299630c507348e1
> 
> - Add a new patch, to fix armv7 builds with vfp < v4.
>   Proposed upstream in:
>   https://github.com/google/highway/pull/1143
> 
> - Add a comment about -DHWY_CMAKE_ARM7=OFF since the name is a bit
>   misleading. It should better be ARMV7 or ARMV7_VFPV4.
> 
> For change log since 1.0.2, see:
> - https://github.com/google/highway/releases/tag/1.0.3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Tested on top of branch master at commit 9cd2e6e with commands:

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
