Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E51C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 08:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D0140339;
	Mon, 25 Apr 2022 08:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NGPgNfLJJnMf; Mon, 25 Apr 2022 08:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61A38402F7;
	Mon, 25 Apr 2022 08:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDE031BF3D7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D05402F7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dUK6Y1H3uGQ for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 08:15:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F5B440022
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 08:15:27 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 35B05440862;
 Mon, 25 Apr 2022 11:14:39 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1650874479;
 bh=heYRHoQ9Zft5T6II+5KmJwQkiAbBrkJvjTKQouFBBZw=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=isP4wQJEVvlomTyIMte50PwTSYE5k9KKa/5DbeyZil0XpCbJI14p3Z+6hC0MuxQBc
 O10GMoCZ5MVRomjJ5uPtsZunMO6HtQW+9DScekaebdE0r0dm7Gg/hdX4WSL2gD3mgr
 unFePxsOHOGdhLsE88xsSBUUCwCpWVLxnkxbojzUtxn/XuDD/g6cfXzlnHN5mXmmks
 G0OSac3VP2EcRZ/VtwYnzDYqxk1FZUYpPI+3NGrhRZdChWHQFjjGmXr+/JKCwh70kT
 /V3ndrQC3aZefJ4LFF6UPdXA3KYrdYIEVHgjiuJm+kVDuaVyJauIn0G8MoEUshPtzA
 WH9l10JIS8K6w==
References: <20220425080503.769954-1-buildroot@heine.tech>
User-agent: mu4e 1.6.10; emacs 27.1
To: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 25 Apr 2022 11:14:28 +0300
In-reply-to: <20220425080503.769954-1-buildroot@heine.tech>
Message-ID: <87o80p1sv8.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 3.20.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: 2dad10f61914960b2bc05a650450d7fe2b8aa211@osuosl.org, Sep@osuosl.org,
 17@osuosl.org, Asaf Kahlon <asafka7@gmail.com>, Mon@osuosl.org, rom@osuosl.org,
 2001@osuosl.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Matt Weber <matthew.weber@collins.com>,
 "00:00:00"@osuosl.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

On Mon, Apr 25 2022, Michael Nosthoff via buildroot wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/protobuf/protobuf.hash               | 2 +-
>  package/protobuf/protobuf.mk                 | 2 +-
>  package/python-protobuf/python-protobuf.hash | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index 60e64f54d4..f37b2dee40 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  645192532f28254152b51c01868efdf9b766b1dbe49c77cccd6efcdb2d7c7bc2  protobuf-cpp-3.19.1.tar.gz
> +sha256  dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9  protobuf-cpp-3.20.1.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 80764f0216..c4c33ba7da 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,7 +7,7 @@
>  # When bumping this package, make sure to also verify if the
>  # python-protobuf package still works and to update its hash,
>  # as they share the same version/site variables.
> -PROTOBUF_VERSION = 3.19.1
> +PROTOBUF_VERSION = 3.20.1
>  PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
>  PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>  PROTOBUF_LICENSE = BSD-3-Clause
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index 2bfef96676..ddfa48b491 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  2286615a3ae3e24c3524d171b6728b77b72cd2f3aab905f6a8d3fcaf6209dd00  protobuf-python-3.19.1.tar.gz
> +sha256  d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8  protobuf-python-3.20.1.tar.gz

The version update in python-protobuf.mk is missing.

baruch

>  sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
