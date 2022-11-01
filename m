Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A50C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C9B44064D;
	Tue,  1 Nov 2022 22:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C9B44064D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANxHKFHt5sd2; Tue,  1 Nov 2022 22:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A673408A5;
	Tue,  1 Nov 2022 22:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A673408A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 635D61BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DA3B4022C
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA3B4022C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsyitTMcdO4E for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:24:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3BE140216
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3BE140216
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:24:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 048CDE0006;
 Tue,  1 Nov 2022 22:24:01 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:24:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221101232401.3e2e9d25@windsurf>
In-Reply-To: <20221031215748.41579-1-fontaine.fabrice@gmail.com>
References: <20221031215748.41579-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=um+HRyDo9YEEFooifTGMvXiglI1YChtbHxBNDqsnEfc=;
 b=kX6xer3Kg4HpIpD3BLFNQv6tHvW96xooqIy7TvUlb5sMd7WOH4X606RioEUALuXsh94aHN
 KXPlbxoInZhGsA/v8QDzFyvHysvj+Pvni/6laswxWcupdUMJDTHAmS0apgT+zNTw9twZPI
 k4Akg1MgEraYUjToVAkLloyBfU602Lw2Ehq4F7qkax+uZs7nrUnOzj3aRJ2oDg0LaOB9Xh
 Xf2PYMaFC13fxt9GkonROMyUQ7txpteLDfQ2ANI55+1fuQNZulnQYIsb0voWpTuGB16PUL
 pzaJXDEQB0HQK4OxbfMdSzYLksAHyKw03Y7eOmG/cDoaG5CA74xwmIu4y126lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kX6xer3K
Subject: Re: [Buildroot] [PATCH 1/1] package/flann: bump to version 1.9.2
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
Cc: Davide Viti <zinosat@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 22:57:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - lz4 is a mandatory dependency since
>   https://github.com/flann-lib/flann/commit/df3fc59212660e43867cb85d5e557f5cae6d30d7
> - Drop patch (not needed since
>   https://github.com/flann-lib/flann/commit/86c92adbdea3e41d7ad371732cfe3b8231e0ecc6)
> - PYTHON_EXECUTABLE can be dropped since
>   https://github.com/flann-lib/flann/commit/5f4ac506323585c1f74ef57a73962beb887e3a3b
> 
> https://github.com/flann-lib/flann/blob/1.9.2/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-src-cpp-fix-cmake-3.11-build.patch   | 80 -------------------
>  package/flann/Config.in                       |  1 +
>  package/flann/flann.hash                      |  2 +-
>  package/flann/flann.mk                        |  4 +-
>  4 files changed, 4 insertions(+), 83 deletions(-)
>  delete mode 100644 package/flann/0001-src-cpp-fix-cmake-3.11-build.patch

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
