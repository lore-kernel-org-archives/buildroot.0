Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD8AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 07:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CD41408EF;
	Thu,  9 Jun 2022 07:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtqOx1CWkA78; Thu,  9 Jun 2022 07:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E74240907;
	Thu,  9 Jun 2022 07:23:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DD391BF2B7
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DF6F8137B
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rg40ix-IgZYm for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 07:23:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEA0983F17
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 07:23:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F417C0010;
 Thu,  9 Jun 2022 07:23:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzCVq-001ns8-Kj; Thu, 09 Jun 2022 09:23:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220606075325.70794-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 09:23:26 +0200
In-Reply-To: <20220606075325.70794-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 Jun 2022 09:53:25 +0200")
Message-ID: <87leu62tch.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rustc: fix
 BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv6
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

 > Fix the following build failure with ARMv6 raised since commit
 > d69d40c029dc7d8199b745eaee759d92b66c5d17:

 > rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz: OK (sha256: 83c3fb8645379ec308192fa713df87044892639495722077e07aa779b310239e)
 > wget --passive-ftp -nd -t 3 -O
 > '/nvmedata/autobuild/instance-20/output-1/build/.rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz.rnWGvt/output'
 > 'https://static.rust-lang.org/dist/rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz'
 > --2022-06-05 12:30:08--  https://static.rust-lang.org/dist/rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz
 > Resolving static.rust-lang.org (static.rust-lang.org)... 108.156.120.70, 108.156.120.75, 108.156.120.122, ...
 > Connecting to static.rust-lang.org (static.rust-lang.org)|108.156.120.70|:443... connected.
 > HTTP request sent, awaiting response... 404 Not Found
 > 2022-06-05 12:30:08 ERROR 404: Not Found.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4b187767c233f0dae3fa7f8fea9dd67e2b5bb7d0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
