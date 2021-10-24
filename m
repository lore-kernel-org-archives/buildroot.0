Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFEAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:02:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F1960EDF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43F1960EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC3614022C;
	Sun, 24 Oct 2021 14:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qh7gXaGx5CCR; Sun, 24 Oct 2021 14:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E52F40124;
	Sun, 24 Oct 2021 14:02:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAAA1BF2A2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F79740332
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jbe4EFZv2UZk for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:02:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7CD74032F
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:02:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BAAA41BF205;
 Sun, 24 Oct 2021 14:02:44 +0000 (UTC)
Date: Sun, 24 Oct 2021 16:02:43 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211024160243.1ed3c012@windsurf>
In-Reply-To: <20211022190702.7782-1-ps.report@gmx.net>
References: <20211022190702.7782-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/gtest: fix gtest.pc/gmock.pc
 library names for the debug build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Stephan Hoffmann <sho@relinux.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 22 Oct 2021 21:07:01 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>    - http://autobuild.buildroot.org/results/e1bb8aa1de310f3d27b74ec7d8748d170ad444e2
> 
>   >>> libcamera 40f5fddca7f774944a53f58eeaebc4db79c373d8 Building  
>   [...]
>   [114/123] Linking target src/lc-compliance/lc-compliance
>   FAILED: src/lc-compliance/lc-compliance
>   [...]
>   .../host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lgtest
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...test.pc-gmock.pc-library-names-for-t.patch | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch

Series applied, thanks! To be honest, I always found it very weird this
choice of some upstream project to have a different library name
depending on whether it is built with/without debug. But oh well, if
that's how gtest wants it...

Note that you have to sign the Google CLA if you want them to consider
your patch on gtest.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
