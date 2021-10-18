Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B77DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:22:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C5A61074
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20C5A61074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDA1A40474;
	Mon, 18 Oct 2021 19:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITiby6q7ki6x; Mon, 18 Oct 2021 19:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0297C4021F;
	Mon, 18 Oct 2021 19:22:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 309011BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B61060AE4
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5NlV-0aj7c6V for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB7B060AC9
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:20:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 77C90C0002;
 Mon, 18 Oct 2021 19:20:01 +0000 (UTC)
Date: Mon, 18 Oct 2021 21:20:00 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20211018212000.1d933476@windsurf>
In-Reply-To: <20211017123501.8253-1-post@lespocky.de>
References: <20211017123501.8253-1-post@lespocky.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/putty: bump version to 0.76
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

On Sun, 17 Oct 2021 14:35:01 +0200
Alexander Dahl <post@lespocky.de> wrote:

> Patch 0002 fixing CVE-2021-36367 gone upstream, part of the 0.76
> release.
> 
> Link: https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html
> Link: https://lists.tartarus.org/pipermail/putty-announce/2021/000032.html
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  ...o-reject-trivial-success-of-userauth.patch | 448 ------------------
>  package/putty/putty.hash                      |  10 +-
>  package/putty/putty.mk                        |   5 +-
>  3 files changed, 6 insertions(+), 457 deletions(-)
>  delete mode 100644 package/putty/0002-New-option-to-reject-trivial-success-of-userauth.patch

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
