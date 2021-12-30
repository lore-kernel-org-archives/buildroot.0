Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C88C433FE
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB6C8402D0;
	Thu, 30 Dec 2021 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHtFYt-Vvrs8; Thu, 30 Dec 2021 20:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA0C6405C1;
	Thu, 30 Dec 2021 20:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BCFB1BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 595B1408C8
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvHnHvRciLmR for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:18:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70C3240219
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:18:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9CEE4E0008;
 Thu, 30 Dec 2021 20:18:15 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:17:57 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211230211757.2b4056f0@windsurf>
In-Reply-To: <20211230165351.2747283-1-fontaine.fabrice@gmail.com>
References: <20211230165351.2747283-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/neard: fix autoreconf
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 17:53:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 0.18 in
> commit 81d14a86258592b66b3cb170cda554a1eabf2c3f:
> 
> aclocal: error: couldn't open directory 'm4': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f8e26416e38c83e27e7945343f497a6c9310bfcf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/neard/neard.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

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
