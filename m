Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC5EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3A6E403AC;
	Sun,  6 Feb 2022 09:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txz1w9Vu5i1R; Sun,  6 Feb 2022 09:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33486403C8;
	Sun,  6 Feb 2022 09:26:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0A191BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACAEE403C8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxROT4N_qe41 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:26:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66A1C403A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:26:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 41F1040003;
 Sun,  6 Feb 2022 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644139568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t05KYxUrCLMDnP+bSHeqO9QnKZBazhu8MhNEUyAcBfs=;
 b=FySnYbpAfoNbpyOGyGUDvN6pkcJqdjPfQbQgxLRvsLBcSmip0En7kayO4AYaUJjTYC9KVv
 SWeGhS4p4l731zt5CMFABG8KFXM595aeK/7LoKa4I+PBrQC5uvYQBy+4LQgo0BUbRzlerU
 gMHO0tfstVfEuD+wkx8BDdiWbSwTJmVX8/yQWbHvRtJC4jmBc2uC43Wyr/F4onjCh6p2Qg
 DR85qht3JPsirkKF1aQhEeb17WWbf7ms3Tw/2xLzlOR1ohw0VXxfT4M4jvZfBzhTKD07rR
 e/MebOrDkDYeW3rWktgKfVyygLxp9RgSBVsnVTiK4bz+aflrUbwRZ3ifGSfgXA==
Date: Sun, 6 Feb 2022 10:26:07 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220206102607.737fa77b@windsurf>
In-Reply-To: <20220205135132.3007-1-peter@korsgaard.com>
References: <20220205135132.3007-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/xen: security bump to version 4.14.4
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Feb 2022 14:51:30 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Includes a number of bugfixes and the security fixes up to xsa-395:
> https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-4/
> 
> Drop the now upstream xsa38* patches.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/xen/xen.hash | 11 +----------
>  package/xen/xen.mk   | 19 +------------------
>  2 files changed, 2 insertions(+), 28 deletions(-)

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
