Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4918C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:49:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BB361373
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1BB361373
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D08407BE;
	Mon,  4 Oct 2021 07:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlBPp-gRwHhg; Mon,  4 Oct 2021 07:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9AC4078F;
	Mon,  4 Oct 2021 07:49:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95B931BF2C5
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 859938440F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHWlCNgwfyZv for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 07:49:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86A7384408
 for <buildroot@uclibc.org>; Mon,  4 Oct 2021 07:49:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BF97420007;
 Mon,  4 Oct 2021 07:49:16 +0000 (UTC)
Date: Mon, 4 Oct 2021 09:49:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Matthew Weber <matthew.weber@collins.com>
Message-ID: <20211004094915.516ef395@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] Adding new products in the CPE database ?
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
Cc: "buildroot@uclibc.org" <buildroot@uclibc.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Matt,

I was wondering what was the process to add a new product in the CPE
database.

Indeed, I was investigating
https://security-tracker.debian.org/tracker/CVE-2011-3332, which is
affecting our "argus" package.

However CVE-2011-3332 affects the Argus product from Iceni, a PDF
extracting tool at https://www.iceni.com/legacy.htm.

This is completely different than the Argus package we have, which is
https://openargus.org/.

The NVD CPE database has several Argus products known:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=argus.
From Iceni, from Oracle, from Litronic. But none of them correspond to
the Argus that we have packaged.

So I guess we need to tell the NVD people to add an entry in the CPE
database for this other Argus product, so that we can then amend our
argus.mk package with the appropriate CPE ID information.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
