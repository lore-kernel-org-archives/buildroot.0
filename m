Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C53C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CADD420A4;
	Sun, 12 May 2024 10:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOMgz5PpzWNg; Sun, 12 May 2024 10:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30AA34209B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30AA34209B;
	Sun, 12 May 2024 10:04:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14ACD1BF27A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B86A607A0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsXluwn5tgZI for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:04:51 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.20;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05FF16079E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FF16079E
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05FF16079E
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:04:50 +0000 (UTC)
X-CSE-ConnectionGUID: M3no4WU3Q6qfGCqfaZAPVA==
X-CSE-MsgGUID: xAoO74LKS3SHuQ22rD+A3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11288410"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; d="scan'208";a="11288410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 03:04:50 -0700
X-CSE-ConnectionGUID: 1tcs1dV+S4CNYDmMrlxkvQ==
X-CSE-MsgGUID: MYTszlJgSgiHt8hw3n4YVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; d="scan'208";a="67561083"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP; 12 May 2024 03:04:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 8900124D; Sun, 12 May 2024 13:04:46 +0300 (EEST)
Date: Sun, 12 May 2024 13:04:46 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240512100446.GG4162345@black.fi.intel.com>
References: <20240512074753.251535-1-fontaine.fabrice@gmail.com>
 <20240512095341.3aad1e0d@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240512095341.3aad1e0d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715508291; x=1747044291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0FKpI2zR/3eiEHhzzZbOE2AfwbzsmWXv/8UZKFVa1Ds=;
 b=Z+wN2dn9iIP3WyXlEVTvPmAEaal8mo7C7Pua8o1hAh4iQlda0nFCwtVc
 ldMp8aBiQtCKfkBC1IpLuNEi001Tl11Ar0DzsoiMWG71urjYUNY8WIV/q
 1A3z6ENmeyTMACw1JrKRvSZ7De9b0LuiA2rGscnJlxjWXdZ5/8BYbGuFJ
 ZfYwxvBIXJwkkuT5GeGJVCof/mgweI0aOp8dPZmLd7ojwTways9mksZX6
 Y10h23eYnimqrsY5LgtBiDjiUPMJkUavnB8ZZlNNwNzTjC335BdaEp5LL
 zH2yt6/7La0Lq8e2ZIJBU0HOREziAEBG0pC8hC4cNupksrh1M5Uek9QLq
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z+wN2dn9
Subject: Re: [Buildroot] [PATCH 1/1] package/tbtools: add hashes
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, May 12, 2024 at 09:53:41AM +0200, Thomas Petazzoni wrote:
> On Sun, 12 May 2024 09:47:53 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Commit 8d5b3aac435880333833d4a3909b1818fe8af045 forgot to add a hash
> > file. Moreover, also update TBTOOLS_VERSION to match what is returned by
> > https://release-monitoring.org/project/372327
> > 
> > Fixes: 8d5b3aac435880333833d4a3909b1818fe8af045
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/tbtools/tbtools.hash | 3 +++
> >  package/tbtools/tbtools.mk   | 4 ++--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >  create mode 100644 package/tbtools/tbtools.hash
> 
> Dammit, how can I have missed this when reviewing :-/

Sorry about missing these.

Thanks for fixing! :)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
