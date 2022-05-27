Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17895C43217
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 07:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB444281A;
	Fri, 27 May 2022 07:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8WjSUrXH36k; Fri, 27 May 2022 07:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D43D42815;
	Fri, 27 May 2022 07:30:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 317521BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E0EE42815
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvARNoxKOMoe for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:30:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 703B142811
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:30:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CEA0AE0007;
 Fri, 27 May 2022 07:29:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuUPv-000tdB-Sy; Fri, 27 May 2022 09:29:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220424084538.2740476-1-fontaine.fabrice@gmail.com>
Date: Fri, 27 May 2022 09:29:49 +0200
In-Reply-To: <20220424084538.2740476-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Apr 2022 10:45:38 +0200")
Message-ID: <87o7zjph5e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/omniorb: fix openssl build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add host-pkgconf dependency to fix the following build failure with
 > openssl raised since commit 9d519412d65e13e4a7ffbb83edd8d1e4b2dfe4b7:

 > /nvmedata/autobuild/instance-25/output-1/per-package/omniorb/host/bin/m68k-buildroot-linux-uclibc-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -Wall -Wno-unused -fexceptions  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I.. -I./.. -I../../../../../include/omniORB4/internal -I../../../../../include/omniORB4/internal -D_OMNIORB_SSL_LIBRARY -D__OMNIORB4__ -I../../../../../stub -D_REENTRANT -I/usr/include -I. -I. -I../../../../../include -I../../../../../include -D__OSVERSION__=2 -D__linux__ -D__m68k__ -o static/sslActive.o sslActive.cc
 > m68k-buildroot-linux-uclibc-g++: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include'
 > In file included from /usr/include/stdlib.h:55,
 >                  from /usr/include/openssl/crypto.h:14,
 >                  from /usr/include/openssl/bio.h:20,
 >                  from /usr/include/openssl/ssl.h:18,
 >                  from ../../../../../include/omniORB4/sslContext.h:48,
 >                  from sslActive.cc:32:
 > /usr/include/bits/floatn.h:75:70: error: unknown machine mode '__TC__'
 >    75 | typedef _Complex float __cfloat128 __attribute__ ((__mode__ (__TC__)));
 >       |

 > Fixes:
 >  - http://autobuild.buildroot.org/results/47b1906eb7dd122a81191d14ad663c5931cbfade

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
