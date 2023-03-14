Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0216C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 419C48144F;
	Tue, 14 Mar 2023 07:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 419C48144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GeAd40mwr5G5; Tue, 14 Mar 2023 07:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76FA181445;
	Tue, 14 Mar 2023 07:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76FA181445
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E03A1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 696C740328
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 696C740328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qUnde1vsRrH for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:38:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ED8F4011F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ED8F4011F
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:38:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 18E66E0005;
 Tue, 14 Mar 2023 07:38:41 +0000 (UTC)
Date: Tue, 14 Mar 2023 08:38:41 +0100
To: roman <roman.passler@gmail.com>
Message-ID: <20230314083841.294bfd43@windsurf>
In-Reply-To: <CAJYrM9Kk8tG2x4Zpv_OPH0kQCvrv6ddgBbe7SX1S1xnKdFCH+w@mail.gmail.com>
References: <20230313183235.2665-1-roman.passler@gmail.com>
 <20230313225431.45802c0f@windsurf>
 <CAJYrM9Kk8tG2x4Zpv_OPH0kQCvrv6ddgBbe7SX1S1xnKdFCH+w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678779522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+tFPCIdefRvBxKU5MoYrXsFre4zgDVadY8tsHY0NtI=;
 b=eF26tFqtu8uGS8l7BGNzOVRea/mCUvL4GEO6in/kzqcHLYnHGeCCgC7rZwELJY2eSBVCb9
 JdAxB/ZH1l7N+oMJ8gSxSGgYPiDoSWSdnN6a9HBR45Q27usIWQisx9J9Bf3SKEpxVtT2XG
 ch2pVYyb9tbTvOhWFZQO6BCupanP/iQ3cMaDNtOKrjQeRbqAFyxiw5Y6S9WL2ZO56ecmnL
 6whPBXDCcqPX+UyNE3ww/S1UumefIKXNabgPvBIP5pxCne7mspe4/7JINrxFRcCiX2GcLy
 uWY5oVXs3ETrBDIVzwegqKPUa6YfYQOEJ2LVQSN6TQaRt/ci+tNOCUly2ebsrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eF26tFqt
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: bump to 0.12.0
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

Hello Roman,

On Tue, 14 Mar 2023 08:25:27 +0100
roman <roman.passler@gmail.com> wrote:

> The license files have been relocated to the LICENSES/* directory (available
> at https://sourceforge.net/p/openocd/code/ci/v0.12.0/tree/LICENSES/).
> The license files have been moved to the LICENSES/* directory, which can be
> found at https://sourceforge.net/p/openocd/code/ci/v0.12.0/tree/LICENSES/.
> Should they be added to the hash file, or is the COPYING file at
> https://sourceforge.net/p/openocd/code/ci/v0.12.0/tree/COPYING sufficient?

Yes, it would be good to add the files in LICENSES/ in the
OPENOCD_LICENSE variable, and therefore in the hash file as well;

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
