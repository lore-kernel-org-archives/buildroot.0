Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52598C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 15:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEFB340A45;
	Mon, 14 Nov 2022 15:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEFB340A45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyP9lUPEgVh8; Mon, 14 Nov 2022 15:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29A7F408B8;
	Mon, 14 Nov 2022 15:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29A7F408B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C17DC1BF2C5
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A2BF6074C
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A2BF6074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SC-AJYOQRzmi for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 15:43:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5579F60596
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5579F60596
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:43:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 522DBE0005;
 Mon, 14 Nov 2022 15:43:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oubcI-006z2n-Ch; Mon, 14 Nov 2022 16:43:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221104101639.24364-1-fontaine.fabrice@gmail.com>
Date: Mon, 14 Nov 2022 16:43:22 +0100
In-Reply-To: <20221104101639.24364-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 4 Nov 2022 11:16:39 +0100")
Message-ID: <87zgctk0dh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: add host-python3
 dependency
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

 > add host-python3 dependency to avoid the following build failure raised
 > since the addition of the package in commit
 > e43da7bb32285bbd41b38a379aef77132d149df7:

 > (cd /home/autobuild/autobuild/instance-19/output-1/build/botan-2.19.2;
 > PATH="/home/autobuild/autobuild/instance-19/output-1/host/bin:/home/autobuild/autobuild/instance-19/output-1/host/sbin:/home/autobuild/make:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
 > ./configure.py --cpu="m68k" --disable-cc-tests --os=linux --cc=gcc
 > --cc-bin="/home/autobuild/autobuild/instance-19/output-1/host/bin/m68k-linux-g++"
 > --prefix=/usr --without-documentation --extra-libs=atomic
 > --disable-shared-library --enable-static-library --no-autoload
 > --without-stack-protector --without-os-feature=getauxval --with-boost
 > --with-sqlite --with-zlib --disable-altivec --disable-neon)
 > /usr/bin/env: 'python': No such file or directory

 > Fixes:
 >  - http://autobuild.buildroot.org/results/91eb6d03ee899bc1034efc5ac7d1fe78961d37ca

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
