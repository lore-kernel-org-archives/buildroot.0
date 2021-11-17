Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0BEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:42:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F2961B5F
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7F2961B5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C011D40276;
	Wed, 17 Nov 2021 22:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2kAZXB4_qtq8; Wed, 17 Nov 2021 22:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7404401C4;
	Wed, 17 Nov 2021 22:42:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEE91BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 383616078A
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Twgz1TTJB7g9 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:42:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CCBA60625
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:42:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 56152FF805;
 Wed, 17 Nov 2021 22:42:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnTdC-0000Uj-O7; Wed, 17 Nov 2021 23:42:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211112180802.3610653-1-fontaine.fabrice@gmail.com>
Date: Wed, 17 Nov 2021 23:42:18 +0100
In-Reply-To: <20211112180802.3610653-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 12 Nov 2021 19:08:02 +0100")
Message-ID: <871r3es8tx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: add girdir to
 glib-2.0.pc
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add girdir to glib-2.0.pc to fix the following build failure with atk,
 > gcr or harfbuzz:

 > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler
 > atk/Atk-1.0.gir --output atk/Atk-1.0.typelib
 > --includedir=/usr/share/gir-1.0
 > Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir

 > This build failure could also be fixed by removing our update of girdir
 > in gobject-introspection.mk but this will have side effects as gir files
 > won't be installed in the correct directory. So patch glib-2.0.pc
 > instead.

 > Note: autotools-based packages have already been fixed by
 > https://git.buildroot.net/buildroot/commit/?id=8dda79970661090f202e1f20e5982ba53fdaeb95

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
 >  - http://autobuild.buildroot.org/results/67a47386019c2a700df348ad6846064e0950e87b
 >  - http://autobuild.buildroot.org/results/2c6a4470542af574f9407fa5867f0408ec2b4880

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
