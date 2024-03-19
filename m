Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E77C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53453813E7;
	Tue, 19 Mar 2024 12:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81mSKL9Z7B0J; Tue, 19 Mar 2024 12:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A38F814B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A38F814B6;
	Tue, 19 Mar 2024 12:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9A8E1BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9301260A8B
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0anXxURhA8VP for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D951608EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D951608EB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D951608EB
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:05:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50D98240007;
 Tue, 19 Mar 2024 12:05:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmYDG-003R1o-2V;
 Tue, 19 Mar 2024 13:05:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240302125938.790570-1-fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2024 13:05:02 +0100
In-Reply-To: <20240302125938.790570-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 2 Mar 2024 13:59:38 +0100")
Message-ID: <871q86ctqp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: musl on aarch64 needs
 headers >= 5.0
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

 > strace needs headers >= 5.0 and
 > https://github.com/torvalds/linux/commit/9966a05c7b80f075f2bc7e48dbb108d3f2927234
 > to avoid the following build failure on musl and aarch64 due to headers
 > conflict raised at least since bump to version 6.0 in commit
 > 544806bfd8052d05dee671c23c354e5f73f954f9:

 > In file included from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/signal.h:48,
 >                  from strace.c:17:
 > /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/bits/signal.h:18:16: error: redefinition of 'struct sigcontext'
 >    18 | typedef struct sigcontext {
 >       |                ^~~~~~~~~~
 > In file included from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/asm/ptrace.h:26,
 >                  from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/linux/ptrace.h:107,
 >                  from ptrace.h:33,
 >                  from strace.c:16:
 > /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/asm/sigcontext.h:28:8: note: originally defined here
 >    28 | struct sigcontext {
 >       |        ^~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/74a480aa76970b36dcd890d9bd7a9df1d49e8e16
 >  - http://autobuild.buildroot.org/results/79ee8ae5fb9712fd874b56e836eca1b997c50cd9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
