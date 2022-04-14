Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE661C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 891798130C;
	Thu, 14 Apr 2022 20:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VrIjCR0B4kXC; Thu, 14 Apr 2022 20:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7954B80D1D;
	Thu, 14 Apr 2022 20:14:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6851BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28503418FA
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJRg8-L0bftL for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:14:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BD834187F
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:14:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5560420004;
 Thu, 14 Apr 2022 20:14:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nf5qq-00Brxj-GK; Thu, 14 Apr 2022 22:14:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220414164109.1724873-1-fontaine.fabrice@gmail.com>
Date: Thu, 14 Apr 2022 22:14:00 +0200
In-Reply-To: <20220414164109.1724873-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 14 Apr 2022 18:41:09 +0200")
Message-ID: <87v8vba0dz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix install of internal
 bind libraries
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

 > Internal bind libraries are not installed to target since commit
 > 0c8dd6ebd656e06cf99a63eb93343715f4853503 resulting in the following
 > runtime failure:

 > Starting DHCP server: /usr/sbin/dhcpd: error while loading shared
 > libraries: libirs.so.161: cannot open shared object file: No such file
 > or directory

 > RANLIB must also be set to avoid the following build failure at install
 > step:

 > libtool: install: arceb-buildroot-linux-uclibc-ranlib
 > /home/fabrice/buildroot/output/per-package/dhcp/target/usr/lib/libisccfg.a
 > /home/fabrice/buildroot/output/build/dhcp-4.4.3/bind/bind-9.11.36/libtool:
 > line 1719: arceb-buildroot-linux-uclibc-ranlib: command not found

 > Fixes:
 >  - No autobuilder failures (reported by Eugen.Hristev@microchip.com)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
