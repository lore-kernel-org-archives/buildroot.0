Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0D1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4BDB4036F;
	Wed, 26 Jan 2022 22:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvEUvoZOPFON; Wed, 26 Jan 2022 22:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCAB04015A;
	Wed, 26 Jan 2022 22:35:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F010D1BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBAF94015A
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4uLLo5JDfY-h for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:35:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D927040143
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:35:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC1581BF203;
 Wed, 26 Jan 2022 22:35:36 +0000 (UTC)
Date: Wed, 26 Jan 2022 23:35:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220126233536.36053b53@windsurf>
In-Reply-To: <CAPi7W82ePwzyPvUG2K=uk-cvsOH7iRb=O=HSM3OGpxaDOTBbAQ@mail.gmail.com>
References: <20220124213445.2426794-1-fontaine.fabrice@gmail.com>
 <20220126230532.43ebcc51@windsurf>
 <CAPi7W82ePwzyPvUG2K=uk-cvsOH7iRb=O=HSM3OGpxaDOTBbAQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Adam Duskett <aduskett@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jan 2022 23:22:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Indeed, this is true but atk and libnice are meson packages.
> For autotools packages, commit
> 8dda79970661090f202e1f20e5982ba53fdaeb95 updated
> Makefile.introspection.

Correct, I also looked into these :-)

> poppler is a cmake-package and I thought that the suggested approach
> is the simplest, less invasive and quickest approach. Upstream is also
> ok for this patch.

Yeah, maybe it's the most pragmatic solution. It just feels annoying
that we have to teach "all" users of GOI where the GIR files are
located.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
