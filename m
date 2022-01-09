Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F8DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A56E281AAC;
	Sun,  9 Jan 2022 16:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GCSkoLaaou6; Sun,  9 Jan 2022 16:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1911081B60;
	Sun,  9 Jan 2022 16:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5A81BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B27381B60
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0jbfnkBSYyi for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:34:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D00481AAC
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:34:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C61DE40007;
 Sun,  9 Jan 2022 16:34:28 +0000 (UTC)
Date: Sun, 9 Jan 2022 17:34:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Message-ID: <20220109173427.07372dae@windsurf>
In-Reply-To: <20200921101515.132359-4-gregory.clement@bootlin.com>
References: <20200921101515.132359-1-gregory.clement@bootlin.com>
 <20200921101515.132359-4-gregory.clement@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 3/3] package/pkg-utils/cve.py: Manage
 case when package version doesn't exist
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 21 Sep 2020 12:15:15 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Until now, when a package didn't report a version, then the CVE
> comparison was just skipped. It leads most of the time to declare the
> package not affected by the CVE.
> 
> Instead of it, report the CVE_UNKNOWN status in order to be aware that
> the CVE related to this package has to be checked.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Do you remember which packages/cases this was handling?

>              if not pkg_version:
> +                unknown_pkg_version = True

I've added a print() here, and did a full run of pkg-stats on all
packages, and did not get any match.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
