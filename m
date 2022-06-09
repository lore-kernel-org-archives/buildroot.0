Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FFCC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 06:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B334640BEE;
	Thu,  9 Jun 2022 06:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4YU-FZ9PoHj; Thu,  9 Jun 2022 06:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2E0340BE8;
	Thu,  9 Jun 2022 06:50:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 858761BF376
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 06:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73ED683EA5
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 06:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzlJ3WEUd31x for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 06:50:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 094F083E94
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 06:50:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 407E51C0012;
 Thu,  9 Jun 2022 06:50:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzBzc-001lYz-9V; Thu, 09 Jun 2022 08:50:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220519164200.918286-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 08:50:08 +0200
In-Reply-To: <20220519164200.918286-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 19 May 2022 18:42:00 +0200")
Message-ID: <87fske49gf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iucode-tool: fix build with
 argp-standalone and NLS
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

 > Fix the following build failure with argp-standalone and NLS raised
 > since commit 5430c8fedd0392e79e0c011825b056fea129980a:

 > configure:6091:
 > /home/autobuild/autobuild/instance-3/output-1/host/bin/x86_64-buildroot-linux-musl-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -O3 -g0 -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c -largp >&5
 > /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libargp.a(argp-parse.o):
 > in function `argp_version_parser':
 > /home/autobuild/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-parse.c:181:
 > undefined reference to `libintl_dgettext'

 > [...]

 > checking for library containing argp_parse... no
 > configure: error: An implementation of GNU Argp was not found, please install libargp

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3d2d9e27aabcd6763510238087fe25d5273d3535

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
