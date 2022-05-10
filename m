Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F033C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C10256106C;
	Tue, 10 May 2022 19:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSnuzw9Ijobn; Tue, 10 May 2022 19:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D66BA60D62;
	Tue, 10 May 2022 19:23:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4B461BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDAA340236
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txBFQ9eSdzpG for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:23:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1731401ED
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:23:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 98F94FF804;
 Tue, 10 May 2022 19:23:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1noVS3-003LG8-MP; Tue, 10 May 2022 21:23:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220508182727.888244-1-fontaine.fabrice@gmail.com>
Date: Tue, 10 May 2022 21:23:19 +0200
In-Reply-To: <20220508182727.888244-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 May 2022 20:27:27 +0200")
Message-ID: <87zgjpdwew.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bcusdk: fix build with
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
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with argp-standalone and NLS raised
 > since commit 5430c8fedd0392e79e0c011825b056fea129980a:

 > configure:16428:
 > /home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-linux-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Os -g0 -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c -largp >&5
 > /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld:
 > /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o):
 > in function `argp_version_parser':
 > /home/buildroot/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-parse.c:190:
 > undefined reference to `libintl_dgettext'

 > [...]

 > checking for library containing argp_parse... no
 > configure: error: argp_parse not found

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9277a064b61f24ad35334b318fe4d899a4c39aa1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/bcusdk/bcusdk.mk | 9 ++++++---
 >  1 file changed, 6 insertions(+), 3 deletions(-)

 > diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
 > index ff5becd84b..8006b265b9 100644
 > --- a/package/bcusdk/bcusdk.mk
 > +++ b/package/bcusdk/bcusdk.mk
 > @@ -21,9 +21,12 @@ BCUSDK_CONF_OPTS = \
 >  	--without-pth-test \
 >  	--with-pth=$(STAGING_DIR)/usr
 
 > -BCUSDK_DEPENDENCIES = \
 > -	libpthsem \
 > -	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 > +BCUSDK_DEPENDENCIES = libpthsem \

Dropped the backslash and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
