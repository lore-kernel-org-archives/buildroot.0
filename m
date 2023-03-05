Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4FDC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FDF5819D1;
	Sun,  5 Mar 2023 17:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FDF5819D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dC89A6WxnflX; Sun,  5 Mar 2023 17:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5C08193E;
	Sun,  5 Mar 2023 17:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5C08193E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B29B1BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44DD660E1D
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44DD660E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YibvSFF8mmac for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:18:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E5660DFE
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42E5660DFE
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:18:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 23F41100003;
 Sun,  5 Mar 2023 17:18:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYs0d-001c0X-Ag; Sun, 05 Mar 2023 18:18:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230221172829.3407641-1-fontaine.fabrice@gmail.com>
Date: Sun, 05 Mar 2023 18:18:55 +0100
In-Reply-To: <20230221172829.3407641-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 21 Feb 2023 18:28:29 +0100")
Message-ID: <871qm39kw0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: fix build failure when
 host provides an old gpgrt-config
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

 > As already done for gnupg2 in commit
 > d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8, apply the same fix to mutt to
 > avoid the following build failure:

 > /home/thomas/autobuild/instance-2/output-1/host/bin/i686-buildroot-linux-uclibc-gcc
 > -DPKGDATADIR=\"/usr/share/mutt\" -DSYSCONFDIR=\"/etc\"
 > -DBINDIR=\"/usr/bin\" -DMUTTLOCALEDIR=\"/usr/share/locale\"
 > -DHAVE_CONFIG_H=1 -I.  -I. -I.  -I/usr/include -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -pedantic
 > -Wno-long-long -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -O3 -g0 -c -o txt2c.o txt2c.c
 > i686-buildroot-linux-uclibc-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/98010be4ef70e58819ea2d17315bdac66a619b23

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
