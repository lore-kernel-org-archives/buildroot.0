Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B47EC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C330E81A92;
	Sun, 19 Mar 2023 16:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C330E81A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJQi8_ZPXeuT; Sun, 19 Mar 2023 16:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED7381A73;
	Sun, 19 Mar 2023 16:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED7381A73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A04081BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79F6A81A73
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F6A81A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShR4Wlja2Kan for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:25:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 305B281A6A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 305B281A6A
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:25:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 65D95C0004;
 Sun, 19 Mar 2023 16:25:55 +0000 (UTC)
Date: Sun, 19 Mar 2023 17:25:54 +0100
To: Simon Rowe <simon.rowe@nutanix.com>
Message-ID: <20230319172554.0d5ea60c@windsurf>
In-Reply-To: <20230316113615.138847-1-simon.rowe@nutanix.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679243155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbpY0TBQVCDlJYXKwn3G001rTQN4tPtA+TcQZFYR+/U=;
 b=jrNKYEZYicylDS5gzFCKeEPMTtPhSHqq7Vro1dSye1IiEu3t9igSUaxXUf1YMYP/ac9OER
 iz4ciizLbc/28zsusFzWlcOx8/fTSep4piDeZIbCKUTD3Boue6enwKWboIaBHEOkgVK8OW
 VP+bCxZ866cJsGzO6ZxmBlvatm4kvdlXNT6xUc0XjHUV42oQd4wWqJiQeo6WYF2Emz67m6
 T6cYNcQSaTZAeZBmZLyVEJ/S6hePalomfMqJub6gjltbeMaLAp2g+rxC33zcFrFQOHYN2m
 6CeH3489GSt5f253OHwdRA1deRgCOEKlJhycOOO/2eIhkx8ESlgwbneQrdn59A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jrNKYEZY
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: enable package with musl
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

Hello Simon,

On Thu, 16 Mar 2023 11:36:15 +0000
Simon Rowe <simon.rowe@nutanix.com> wrote:

> LVM uses some glibc-specific functions to try and control locking
> memory in RAM. As a result the package is currently disabled when
> using musl.
> 
> Apply patches taken from gentoo:
> 
>     https://github.com/gentoo/gentoo/pull/25883
>     https://github.com/gentoo/gentoo/pull/26024
> 
> and drop the prohibition on musl in Config.in.
> 
> Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>

Thanks Simon for those patches! Could you rework the 4 patches so that
they are generated with git format-patch and have your Signed-off-by? I
recommend that you take the upstream Git repo of lvm2, checkout the tag
corresponding to version 2.03.14, apply the 4 Gentoo patches, each time
turning the changes into a proper commit.

Another thing to look at is that the multipath-tools package is
selecting BR2_PACKAGE_LVM2_STANDARD_INSTALL, so you need to check
whether the depends on !BR2_TOOLCHAIN_USES_MUSL used in
BR2_PACKAGE_MULTIPATH_TOOLS is still needed? Perhaps thanks to your
work on lvm2 it is now possible to build/use multipath-tools with musl.

Another question is the upstream status of the Gentoo patches? Have
they been submitted for inclusion by the upstream lvm2 project?

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
