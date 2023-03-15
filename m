Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28030C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8C7C40B73;
	Wed, 15 Mar 2023 14:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8C7C40B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZsJoMWxI3uI; Wed, 15 Mar 2023 14:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BEEB40B93;
	Wed, 15 Mar 2023 14:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BEEB40B93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80CB51BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A0644183F
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A0644183F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctgo27V3N8XM for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:10:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AE5C4183B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AE5C4183B
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:10:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D2D711C000A;
 Wed, 15 Mar 2023 14:10:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pcRpp-0026uM-4K; Wed, 15 Mar 2023 15:10:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230228220741.54827-1-fontaine.fabrice@gmail.com>
 <20230228220741.54827-3-fontaine.fabrice@gmail.com>
Date: Wed, 15 Mar 2023 15:10:33 +0100
In-Reply-To: <20230228220741.54827-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 28 Feb 2023 23:07:41 +0100")
Message-ID: <87fsa62jhi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/proftpd: needs dynamic library
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

 > proftpd doesn't build statically because it does not use pkg-config to
 > retrieve its dependencies since its addition in commit
 > 5d173ec4122b89857e6d93fc337311b1f87631c9:

 > /tmp/instance-13/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 > /tmp/instance-13/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/lib/libidn2.a(libunistring_la-striconveh.o):
 > in function `iconv_carefully_1':
 > buildroot/build/libidn2-2.3.4/unistring/striconveh.c:233: undefined reference to `libiconv'

 > [...]

 > /tmp/instance-5/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.2.0/../../../../arceb-buildroot-linux-uclibc/bin/ld:
 > /tmp/instance-5/output-1/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(bio_lib.o):
 > in function `BIO_free':
 > bio_lib.c:(.text+0x3f2): undefined reference to `__atomic_fetch_sub_4'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/09f3f37b63dc68d31b18816b818df86fa3be095c
 >  - http://autobuild.buildroot.org/results/2aba5297206e44dc086c3138ace70e85739196f3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
