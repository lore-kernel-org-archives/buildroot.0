Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C1CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 10:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59A542262;
	Sat, 23 Sep 2023 10:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C59A542262
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZcB0M_xoNch; Sat, 23 Sep 2023 10:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F4C84226B;
	Sat, 23 Sep 2023 10:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F4C84226B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF541BF372
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 10:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D004226B
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 10:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D004226B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GdMfNQynEODv for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 10:09:19 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 600B742274
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 10:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600B742274
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:94e1:f2dc:4d87:6249])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2CE3113F89C;
 Sat, 23 Sep 2023 12:09:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Sep 2023 12:09:09 +0200
Date: Sat, 23 Sep 2023 12:09:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jens Maus <mail@jens-maus.de>
Message-ID: <20230923100909.GC1469982@scaer>
References: <20230923093901.1372593-1-mail@jens-maus.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923093901.1372593-1-mail@jens-maus.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695463755;
 bh=A22bjp49SJpKkZCM2sK+sb9ubomoTjm+24CH7T5GANc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ru8h1KW3Lsr9zY5ZWaKnxg2pzWVZJoXfB+5SsNw+2dbBTtfkXMylT+UG4WFME3UNr
 /NQ4NHHD41noewWzz6Cwi5MuoJrmWB3L9y8vY56KU7KWIBwFYMOA18SeYVyeF0gluD
 aHrQgE6C9bKi18Ydej1U0f4uV9Odl2Di2qtCzv2KzPNQyniGp7iuKGSu0NkVgH7AZ4
 8qQWebGOZQAP1qAInAFnOKz+v5nE9QDUKS2ZVmA+bnb8YdrVh3RSWOEBXV0DoB47+p
 SfNIGJOiCAQ2jx2u8GtARysAut+MEqVhxc3kQMeO5oXjG2Mg9oz/Jvcr+JkEfL0nST
 YPbRwlEv7oNWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ru8h1KW3
Subject: Re: [Buildroot] [PATCH] package/nodejs: fix parallel build
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jens, All,

+Thomas for the qemu part...

On 2023-09-23 11:39 +0200, Jens Maus via buildroot spake thusly:
> In ninja-based nodejs builds performing parallel builds using "make -jX"
> is not working during buildroot initiated builds because the JOBS
> variable is set in the MAKE_OPTS variables in nodejs.mk. This commit
> remedies the issue by setting JOBS to BR2_JLEVEL and also by fixing the
> top-level Makefile of nodejs due to an incorrect tab-based indentation
> being used. Furthermore, it is important to also set LD_LIBRARY_PATH in
> v8-qemu-wrapper.in to our staging libdirs as otherwise execution of
> build tools fail due to host OS libraries being preferred.

That are two different changes, so they should be two different patches.

The commit log is thus misleading, becausee you are not "just" fixing
the parallel build issue.

See below for more comments.

> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>  ...-fixing-Makefile-for-parallel-builds.patch | 37 +++++++++++++++++++
>  package/nodejs/nodejs.mk                      |  6 ++-
>  package/nodejs/v8-qemu-wrapper.in             |  1 +
>  3 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch
> 
> diff --git a/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch b/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch
> new file mode 100644
> index 0000000000..73db129979
> --- /dev/null
> +++ b/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch
> @@ -0,0 +1,37 @@
> +From 1c4582c7dd7c80fbac89031d8fa8cf418249d01e Mon Sep 17 00:00:00 2001
> +From: Jens Maus <mail@jens-maus.de>
> +Date: Sat, 23 Sep 2023 11:09:50 +0200
> +Subject: [PATCH] fixing Makefile for parallel builds
> +
> +This change fixing incorrect GNU makefile indentation in the top-level
> +Makefile which causes issues with parallel "make -jXX" builds.
> +
> +Upstream: N/A (specific to buildroot builds)

If the indentation is causing issues, then that's surely a fix that
*must* be sent upstream.

Also, please explain what the actual error is.

[--SNIP--]
> diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
> index e1083f47f7..48222d089b 100644
> --- a/package/nodejs/v8-qemu-wrapper.in
> +++ b/package/nodejs/v8-qemu-wrapper.in
> @@ -5,5 +5,6 @@
>  exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
>      @QEMU_USERMODE_ARGS@ \
>     -L "${STAGING_DIR}/" \
> +   -E LD_LIBRARY_PATH="${STAGING_DIR}/lib:${STAGING_DIR}/usr/lib/" \
>      "$@"

We've already had hints about doing something like that, but this is
going to require a much more detailed commit log than you provided.
Ah, I see you were part of:

    https://bugs.busybox.net/show_bug.cgi?id=14366

Also, Thomas did quite some in-depth analysis of the qemu issue (you
even were in Cc of that mail):

    https://lore.kernel.org/buildroot/20221031213926.50d3c778@windsurf/

As you see, just stating "it is important to also set LD_LIBRARY_PATH in
v8-qemu-wrapper.in to our staging libdirs as otherwise execution of
build tools fail due to host OS libraries being preferred" is not
enough. We really need an actual explanation.

So, please, canyou split this patch into two:
  - fix the parallel build issue,
  - fix the qemu wrapper with a synthesis of Thomas' extensive analysis

And in that second patch, please add a reference to the bug you close.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
