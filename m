Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CCCC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D2881CA3;
	Sun,  5 Mar 2023 17:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D2881CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9OrchUtB4bv; Sun,  5 Mar 2023 17:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 385DB81991;
	Sun,  5 Mar 2023 17:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 385DB81991
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE011BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04F76409A7
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04F76409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEv6VyRJDkVw for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:14:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B776409A4
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B776409A4
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:14:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 16C77100003;
 Sun,  5 Mar 2023 17:14:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYrwK-001b1K-68; Sun, 05 Mar 2023 18:14:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230220223151.12965-1-fontaine.fabrice@gmail.com>
Date: Sun, 05 Mar 2023 18:14:28 +0100
In-Reply-To: <20230220223151.12965-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 20 Feb 2023 23:31:51 +0100")
Message-ID: <875ybf9l3f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4,
 1/1] package/libmodsecurity: needs dynamic library
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
Cc: Frank Vanbever <frank.vanbever@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 9fc652a373034118535397fdd4042ab9f8fd7adf was incomplete as
 > mbedtls can be pulled in libcurl through libssh2 resulting in the
 > following build failure:

 > /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc64le-buildroot-linux-musl/11.3.0/../../../../powerpc64le-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-4/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/lib//libmbedcrypto.a(md5.c.o):
 > in function `mbedtls_md5_init':
 > md5.c:(.text+0x0): multiple definition of `mbedtls_md5_init';
 > ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x0):
 > first defined here

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4c235e46188f23d1a48297f4e5942cec7b25959a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v3 -> v4 (after review of Thomas Petazzoni):
 >  - Disable building statically
 > Changes v2 -> v3:
 >  - Fix syntax
 > Changes v1 -> v2:
 >  - Update nginx-modsecurity

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
