Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1924EC43217
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7DD560E24;
	Tue,  1 Nov 2022 20:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7DD560E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvQcEUZwBHxr; Tue,  1 Nov 2022 20:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E239660AA7;
	Tue,  1 Nov 2022 20:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E239660AA7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2E101BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B9B540503
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B9B540503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLTtCwBMRBBB for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:34:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 180D8401C9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 180D8401C9
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:34:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13BD61C0002;
 Tue,  1 Nov 2022 20:34:37 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:34:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221101213436.46cfd602@windsurf>
In-Reply-To: <20221101134032.100587-1-fontaine.fabrice@gmail.com>
References: <20221101134032.100587-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667334878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czdjaovSoczs6snrEkKBwiBI3EB6mcXJuys1oNbFjcM=;
 b=YkShxo2ZyrIw1/o9QeA5ALlPd4BzD91qWDjc889pKJZlpesOdxKZYaHbi4Zp5XDYy/VDD3
 jv3e54oR4Lm7wbOWcs+DiQ0tKjSsFLXUe59HVV4cpZPtjruIpUfOFwRy1MVfo3suMcmHGY
 qM7C5jx1+TyHR0hGE6o6mkoYnxoKxkVSEZ62YM2/3AHgzLNTvmBBwzTTBrfvrdpxGf25K4
 xAovv3/L+1jsx81pZ277xUcat+T8YCSb8H/vDH/sd4YgdB5RvVpARik81k4RAYzXYi2G1L
 vLY1gIvpFMpEJ+oBIfd8E7b4QGDDExNSkekHx7Cvlh5KN6IR7KVdH4e+kKstXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YkShxo2Z
Subject: Re: [Buildroot] [PATCH 1/1] package/catatonit: fix build with
 kernel < 5.9
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

On Tue,  1 Nov 2022 14:40:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with kernel < 5.0 raised since the
> addition of the package in commit
> e3975ec7d4b478ec6c1ba56b63cbb5bccfb9dd09:
> 
> catatonit.c:39:11: fatal error: linux/close_range.h: No such file or directory
>    39 | # include <linux/close_range.h>
>       |           ^~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-fix-build-with-kernel-5.9.patch      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/catatonit/0002-fix-build-with-kernel-5.9.patch

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
