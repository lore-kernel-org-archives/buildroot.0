Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA6DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:11:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62AD560FD8
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62AD560FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39AA060730;
	Sun, 14 Nov 2021 14:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 750c8w322ipB; Sun, 14 Nov 2021 14:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C95606F7;
	Sun, 14 Nov 2021 14:11:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 121661BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0158F6070E
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFte9vrnD0XB for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:10:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 700C060717
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:10:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A463E40002;
 Sun, 14 Nov 2021 14:10:45 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:10:44 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211114151044.665d5eff@windsurf>
In-Reply-To: <20211108222902.29000-2-ps.report@gmx.net>
References: <20211108222902.29000-1-ps.report@gmx.net>
 <20211108222902.29000-2-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/2] package/iwd: bump version to 1.19
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Nov 2021 23:29:02 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - removed 0001-build-Add-reallocarray-to-missing-h.patch
>   (from upstream [1])
> 
> - removed 0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
>   (from upstream [2])
> 
> - Changelog (since 1.18, from [3]):
> 
>   ver 1.19:
>     Fix issue with handling OCV if offloading is supported.
>     Fix issue with handling SA Query on channel switch event.
>     Fix issue with starting FT-over-DS actions after roaming.
>     Add support for OWE transition networks.
>     Add support for extended key IDs.
> 
> [1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971
> [2] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7
> [3] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...-build-Add-reallocarray-to-missing-h.patch | 55 -------------------
>  ...nfig-Remove-usage-of-in6_addr__in6_u.patch | 32 -----------
>  package/iwd/iwd.hash                          |  2 +-
>  package/iwd/iwd.mk                            |  2 +-
>  4 files changed, 2 insertions(+), 89 deletions(-)
>  delete mode 100644 package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
>  delete mode 100644 package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
