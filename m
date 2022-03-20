Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D142DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6786581430;
	Sun, 20 Mar 2022 18:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yafP_yzw89lg; Sun, 20 Mar 2022 18:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A215C813EB;
	Sun, 20 Mar 2022 18:14:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 124D01BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E131813EB
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wW_ClcjKck5q for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:14:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AD5E812A1
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:14:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D343FF804;
 Sun, 20 Mar 2022 18:14:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW048-00FF8D-0J; Sun, 20 Mar 2022 19:14:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220225083037.229109-1-romain.naour@gmail.com>
Date: Sun, 20 Mar 2022 19:14:07 +0100
In-Reply-To: <20220225083037.229109-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 25 Feb 2022 09:30:37 +0100")
Message-ID: <87k0coo5jk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rust: set musl-root for musl
 toolchains
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Without musl-root in config.toml the build stop with the following error:
 > thread 'main' panicked at 'couldn't find libc.a in musl libdir:
 > output/host/arm-buildroot-linux-musleabihf/sysroot/lib/lib',
 > src/bootstrap/sanity.rs:192:25

 > musl-root is needed to provide the path to libc.a and libunwind.a because
 > rust link them statically into the standard library and liblibc [1].

 > For other libc, musl-root is not used and ignored [2].

 > [1] https://github.com/rust-lang/rust/commit/cd980b3bee5bd48e8a6cd4c0d7c8e0fb0fdb64dd
 > [2] https://github.com/rust-lang/rust/blob/1.58.1/src/bootstrap/sanity.rs#L181

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > Runtime tested with TestRust with ripgrep and bat packages.

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
