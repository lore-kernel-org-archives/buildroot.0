Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF93BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B7960DF6;
	Sun, 22 May 2022 10:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQoIDJLP1guN; Sun, 22 May 2022 10:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F1560D65;
	Sun, 22 May 2022 10:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0736B1BF389
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E95804017C
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDE7y0oigR7Z for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:03:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2D5B400F1
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:03:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C760DC0004;
 Sun, 22 May 2022 10:03:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsiQc-00BfWo-8n; Sun, 22 May 2022 12:03:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220414164109.1724873-1-fontaine.fabrice@gmail.com>
Date: Sun, 22 May 2022 12:03:14 +0200
In-Reply-To: <20220414164109.1724873-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 14 Apr 2022 18:41:09 +0200")
Message-ID: <87y1yt28bh.fsf@dell.be.48ers.dk>
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

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
