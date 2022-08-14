Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FB8C282E7
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 16:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73B2740616;
	Sun, 14 Aug 2022 16:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73B2740616
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8xmoblD_Hsc; Sun, 14 Aug 2022 16:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A205D405D8;
	Sun, 14 Aug 2022 16:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A205D405D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 523131BF410
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 396DF4196F
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 396DF4196F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKetD74GHPNy for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 16:39:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 255D34196A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 255D34196A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C954C240005;
 Sun, 14 Aug 2022 16:39:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oNGe1-000N3D-Ol; Sun, 14 Aug 2022 18:39:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220722060504.566262-1-james.hilliard1@gmail.com>
Date: Sun, 14 Aug 2022 18:39:21 +0200
In-Reply-To: <20220722060504.566262-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Fri, 22 Jul 2022 00:05:04 -0600")
Message-ID: <871qtiixty.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: set
 g-ir-scanner/g-ir-compiler paths
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > The g-ir-scanner/g-ir-compiler paths don't always get picked up
 > properly by cmake.

 > Fixes:
 > [ 98%] Linking CXX shared library libpoppler-glib.so
 > [ 98%] Built target poppler-glib
 > [ 98%] Generating Poppler-0.18.gir
 > /bin/sh: 1:
 > /home/buildroot/buildroot/output/per-package/poppler/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/per-package/poppler/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/../../bin/g-ir-scanner:
 > not found

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
