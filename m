Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E8DC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 22:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D7B8417DA;
	Fri, 12 Aug 2022 22:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D7B8417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnLjY0DDpkLn; Fri, 12 Aug 2022 22:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB8C417C4;
	Fri, 12 Aug 2022 22:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB8C417C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 314791BF846
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 22:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0C8A417C4
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 22:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0C8A417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fNVFRRXLj9f for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 22:16:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F880417B4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F880417B4
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 22:16:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4223D240002;
 Fri, 12 Aug 2022 22:16:41 +0000 (UTC)
Date: Sat, 13 Aug 2022 00:16:40 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220813001640.4c0d488d@windsurf>
In-Reply-To: <YvTr2e/Y0o128SWs@waldemar-brodkorb.de>
References: <YvTr2e/Y0o128SWs@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660342601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ScM7xhXMchuiRnO0EW/iw4Ro1fPL0dwsqJKP7b21Xo=;
 b=TvOnunMCOHKNgnIV4/D0lqOrWiIMhOEkfRMcGOYmRxcTbPVqRL/Efnc8ajoAFr2mp2Om6a
 B1QGgr4rMjvNUAct0NV1/jHJk63kKYEzYnf1Yig6+llDIHJuDIyLgB9lD/kOmNYc6C0zeM
 BZ6khon4rI8n21RuotfR+peLYbruwwu6qFqeDVlLv8Q9uU9g6HWqwIu+PhEUN5dH/6YIZJ
 QbIDg1GFa1JfzmLGo+7TIIy/kmp6ZmUs2LvBF3aPgWR/ruQIsME9sHNUiRbe3t5Z/sT2AE
 rMxSrQrFWHCbtivdTGRnKutKWYH9DsY1+Jo3tuH3HjrhcvcldgZb1Xeu8gg/SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TvOnunMC
Subject: Re: [Buildroot] [PATCH 1/2] package/binutils: add version 2.39
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

On Thu, 11 Aug 2022 13:45:29 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch 0002-poison-system-directories.patch got rebased.
> Patch 0004+0005 is upstreamed and got removed.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/binutils/2.39/0001-sh-conf.patch      |  48 +++
>  .../2.39/0002-poison-system-directories.patch | 298 ++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch |  50 +++
>  package/binutils/Config.in.host               |   4 +
>  package/binutils/binutils.hash                |   1 +
>  5 files changed, 401 insertions(+)
>  create mode 100644 package/binutils/2.39/0001-sh-conf.patch
>  create mode 100644 package/binutils/2.39/0002-poison-system-directories.patch
>  create mode 100644 package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
