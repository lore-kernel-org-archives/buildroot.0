Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D924C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:12:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F83A603E5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F83A603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8D580E6A;
	Sun, 14 Nov 2021 14:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOvSmDnG670m; Sun, 14 Nov 2021 14:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85AA280E73;
	Sun, 14 Nov 2021 14:12:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40CD31BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3065A4034C
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGaS7vFbVr4y for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:12:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40D4740329
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:12:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 90A02240005;
 Sun, 14 Nov 2021 14:12:40 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:12:39 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211114151239.7259e55f@windsurf>
In-Reply-To: <20211108231852.15687-1-ps.report@gmx.net>
References: <20211108231852.15687-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.22.1
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

On Tue,  9 Nov 2021 00:18:52 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove 001-keymap.h-add-missing-includes-to-fix-musl-build.patch
>   (superseeded by upstream commit [1])
> 
> - add handling of new --with-libudev/--without-libudev option
> 
> For details see [2].
> 
> [1] https://git.linuxtv.org/v4l-utils.git/commit/?id=976a2f681b4e4e16edffd972d53a623b895c5646
> [2] https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.22
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...d-missing-includes-to-fix-musl-build.patch | 68 -------------------
>  package/libv4l/libv4l.hash                    |  2 +-
>  package/libv4l/libv4l.mk                      |  6 +-
>  3 files changed, 5 insertions(+), 71 deletions(-)
>  delete mode 100644 package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch

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
