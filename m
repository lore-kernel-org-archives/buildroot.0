Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CD8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B7781B70;
	Sun,  9 Jan 2022 16:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlEcWynk2eSP; Sun,  9 Jan 2022 16:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A5A81B60;
	Sun,  9 Jan 2022 16:33:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6E0E1BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B50BF81B60
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMLeXpSnoTYl for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:33:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C23381AAC
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:33:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B98F2240004;
 Sun,  9 Jan 2022 16:33:50 +0000 (UTC)
Date: Sun, 9 Jan 2022 17:33:49 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Message-ID: <20220109173349.62a8d794@windsurf>
In-Reply-To: <20200921101515.132359-3-gregory.clement@bootlin.com>
References: <20200921101515.132359-1-gregory.clement@bootlin.com>
 <20200921101515.132359-3-gregory.clement@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/3] support/script/cve-checker: Manage
 the CVEs that need to be check
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

On Mon, 21 Sep 2020 12:15:14 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> When looking for if a package is affected, the version comparison can
> fail. This means that we don't know if the version of the package used
> is affected or not and we need to check manually the version.
> 
> This patch exposes this new information in json and html format.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  support/scripts/cve-checker | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)

The cve-checker script was removed and merged back into pkg-stats, for
which this feature was added by PATCH 1/3 in this series, so I've
marked this patch as Rejected.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
