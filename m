Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C0CC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 851FD4063B;
	Sat,  8 Jun 2024 07:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFdP1d6jz8d6; Sat,  8 Jun 2024 07:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F0004063D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F0004063D;
	Sat,  8 Jun 2024 07:10:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71FFB1BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DEB84063D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WK10PAC_1KD7 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:10:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E288C4063B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E288C4063B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E288C4063B
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:10:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2A131C0005;
 Sat,  8 Jun 2024 07:10:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFqDb-00GESY-0j;
 Sat, 08 Jun 2024 09:10:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240310163150.4373-1-fontaine.fabrice@gmail.com>
Date: Sat, 08 Jun 2024 09:10:27 +0200
In-Reply-To: <20240310163150.4373-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Mar 2024 17:31:50 +0100")
Message-ID: <874ja3c3ks.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: disable -Werror
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable -Werror to fix the following build failure raised at least since
 > bump to version 3.9.0 in commit e76d9868c940f2d19968077b97e79c49376aa464
 > and
 > https://github.com/zhaojh329/libuhttpd/commit/81db1fa371bc80f40c1bfe60010e7d64bdf30b46:

 > /home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c: In function '__serve_file':
 > /home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c:322:50:
 > error: format '%llu' expects argument of type 'long long unsigned
 > int', but argument 4 has type '__off_t' {aka 'long int'}
 > [-Werror=format=]
 >   322 |         conn->send_header(conn, "Content-Range", "bytes */%" PRIu64, st->st_size);
 >       |                                                  ^~~~~~~~~~~         ~~~~~~~~~~~
 >       |                                                                        |
 >       |                                                                        __off_t {aka long int}
 > In file included from /home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c:36:
 > /home/autobuild/autobuild/instance-8/output-1/per-package/libuhttpd/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/inttypes.h:91:41: note: format string is defined here
 >    91 | # define PRIu64         __PRI64_PREFIX "u"
 > cc1: all warnings being treated as errors

 > Fixes: e76d9868c940f2d19968077b97e79c49376aa464
 >  - http://autobuild.buildroot.org/results/46349a1409f9cff027b462456078284459e75511

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
