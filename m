Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E04C4167D
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 629494F240;
	Thu,  2 Nov 2023 17:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 629494F240
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mxn_CcdOPgu; Thu,  2 Nov 2023 17:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCAA14F257;
	Thu,  2 Nov 2023 17:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCAA14F257
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 646731BF350
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49EFE851CE
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49EFE851CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVfJBlcbKqlm for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:46:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2657E82118
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2657E82118
Received: by mail.gandi.net (Postfix) with ESMTPSA id 755ACC0008;
 Thu,  2 Nov 2023 17:46:14 +0000 (UTC)
Date: Thu, 2 Nov 2023 18:46:13 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231102184613.1d071280@windsurf>
In-Reply-To: <20231102171257.5910-1-fontaine.fabrice@gmail.com>
References: <20231102171257.5910-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698947174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrUxAzN7BsBMubnKJQDAr7FMaVX8MiN2MKIjXq3t6XQ=;
 b=SEOO6CJn/K3C9a7c3ZA3jR/8hkBkIy55voLVoN2YwWnItzTRaqOcwtcqO7VPiJpl2Xxr/r
 5zQfAvHLzSvdOJeO12gMbyOLtnADqXHon27oES5GoEBZfqaD8BMTWLaDYPsOSBpTS74qxi
 vFgo/QxH+uv/BmKDpJT2H1c/w6EMhe2zpQv5Tcw9FFElzIPhP9uwkP8SjcljtLrj6FKRvG
 vIpPiC4D2evV+d2Tq74zfXdLs1LFzIHyFGYnghbJhbi2M4599hbpc3CFmx8YUyUDSqBTBK
 q3evYZMv+AONH6Hj/W3xqCPzv8ZyuuVDLBR2MV2K8nFO+lwDavZKuhlGhCen6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SEOO6CJn
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.6
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

On Thu,  2 Nov 2023 18:12:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update hash of COPYING (year updated with
>   https://github.com/strace/strace/commit/b45ed94f6926c9a7aae6bfb54f9a47ea313c0646)
> - This bump will fix the following build failure with kernel >= 6.6 raised
>   since
>   https://github.com/torvalds/linux/commit/182741d287fb1ea870ee6ef45aa1915a0b031233
>   thanks to
>   https://github.com/strace/strace/commit/4eda6d7b61f46d81f7f87afa6fa802dcbe136ca1:
> 
> In file included from btrfs.c:51:
> xlat/btrfs_key_types.h:167:37: error: 'BTRFS_EXTENT_REF_V0_KEY' undeclared here (not in a function); did you mean 'BTRFS_EXTENT_DATA_KEY'?
>   167 | static_assert((unsigned long long) (BTRFS_EXTENT_REF_V0_KEY)
>       |                                     ^~~~~~~~~~~~~~~~~~~~~~~
>       |                                     BTRFS_EXTENT_DATA_KEY
> 
> https://github.com/strace/strace/releases/tag/v6.6
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/da026b8307a4ef1406d2c90d42564df38a172a50
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/strace/strace.hash | 6 +++---
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
