Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4756FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 22:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCED260AF0;
	Sun, 16 Jan 2022 22:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLbfPgqJGCP2; Sun, 16 Jan 2022 22:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3021360AE4;
	Sun, 16 Jan 2022 22:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A60F41BF3CB
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 946AF81415
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mg-cavuI-Ka for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 22:15:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95D5881289
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 22:15:10 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 b15-20020a4a878f000000b002dccc412166so4407428ooi.11
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 14:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6fveETHuSgxLiat7ZpXCiFhbKuogeRUrM1PRaCAaQGA=;
 b=RpT+y46TDP1HDXT1KFKnuej7lqg1fSdIca2Ty2GMtxW5ziU1ED37a8qDlaXxRMOpNP
 inIL6oTV6IKaUmPp5m2c8P+4PTTH262hfNnRklyrPMAJYVNFyMqECe2gmJe6Olb0i/y9
 06ES6rgwIOfySoSFKwuQv2xM3/XGaxZLAHaKDp9HZxvODaP8oDLBv+NK43DF7GQnqTwA
 wLZpDhRCT/GjZY1I90OmCHCjslssx3FARwwD7R9IgAYz+Y3aZobFpTEQXoPpoQVk0Z6O
 wgPhtzL/Rxp+PV2c/BS7Wwr4frxfyFq/00WJo+Bk3TdE/ORU0hM8EixVtKkotMlHsPSO
 o05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6fveETHuSgxLiat7ZpXCiFhbKuogeRUrM1PRaCAaQGA=;
 b=VUEGnKTYIUONeNEPypS7UBuH7Z7i3xwAG6UTJajpeVACvPR884ReXqIZsONHvhFGVY
 2yzqtwiTIHBhhVYlR8VZ9QVAsJmoxeUb1KmYwdEDwPoWVXQBBGKhJ5ej+4/sGMsZPoj7
 UAzzwjKL21igoS3NCWxhT5jvpEAAXHKvJYgJHyGRuaM5GTbdwDhVSluSrorch2xPIoiA
 Vdz8i1njB92ZaEiEzorC2MjXcFjzs9zijviWORGYJRBhWzTCQJZFjreRmNrna16SsvyJ
 R6iE10ZcS3Owx7YgigvIv/xL4uysKp1UhTUj4ba8KqEShVdlVPXQZKRujUPPmJimf4cl
 09/Q==
X-Gm-Message-State: AOAM531DbrPu84Rf6QcI3oPLv7LGX5JH+rhw0MMAqCpo3YH7NDbUqsAp
 dOXNasW34n5mZ4xg3HHOSd7JhJFaOavSC787p6e3oy2tjoQ=
X-Google-Smtp-Source: ABdhPJzN6Qj1YBjOuXw+MuJ/F2NTQN68ve7kHQtwuDBt30z/pcyQaIHMQZnSiLzbdFE9BuYJKoVPr8h+rnQI2Mq7l6I=
X-Received: by 2002:a4a:a50e:: with SMTP id v14mr1526714ook.22.1642371309501; 
 Sun, 16 Jan 2022 14:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20220116230404.71f68dbb@c3po>
In-Reply-To: <20220116230404.71f68dbb@c3po>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Jan 2022 15:14:58 -0700
Message-ID: <CADvTj4qFSfOYQ+AkOsQyGgNbuRROEmgx1giiKGaJn2jRVyhsOw@mail.gmail.com>
To: Danilo Bargen <mail@dbrgn.ch>
Subject: Re: [Buildroot] Hash verification from GitHub
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 16, 2022 at 3:04 PM Danilo Bargen <mail@dbrgn.ch> wrote:
>
> Hello folks
>
> I'm trying to create a new buildroot package (my first one). This is
> what the makefile (tealdeer.mk) looks like:
>
>   TEALDEER_VERSION = 1.5.0
>   TEALDEER_SITE = $(call github,dbrgn,tealdeer,v$(TEALDEER_VERSION))
>   TEALDEER_LICENSE = Apache-2.0 or MIT
>   TEALDEER_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
>   $(eval $(cargo-package))
>
> The URL should expand to
> https://github.com/dbrgn/tealdeer/archive/v1.5.0/tealdeer-1.5.0.tar.gz.
> To generate the checksum, I ran:
>
>   $ sha256sum tealdeer-1.5.0.tar.gz
>   00902a50373ab75fedec4578c6c2c02523fad435486918ad9a86ed01f804358a  tealdeer-1.5.0.tar.gz

Just use the hash buildroot generated for you, it should be correct.

>
> I also added a hash file (tealdeer.hash):
>
>   # Locally generated
>   sha256  00902a50373ab75fedec4578c6c2c02523fad435486918ad9a86ed01f804358a  tealdeer-1.5.0.tar.gz
>   sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
>   sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
>
> When building this package, checksum verification fails every time.
>
>   ERROR: tealdeer-1.5.0.tar.gz has wrong sha256 hash:
>   ERROR: expected: 00902a50373ab75fedec4578c6c2c02523fad435486918ad9a86ed01f804358a
>   ERROR: got     : 42febf9ee84721b9230077d62e2fc51201fd59624d3c776ccc1a634788768a60

Use this hash.

>   ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> No matter how I download the file (via wget, through the GitHub web UI,
> etc), it always results in the SHA256 checksum starting with 009...,
> but buildroot always thinks it should be 42f... I also tried changing
> the TEALDEER_SITE variable as follows:

Yeah, it's not going to match since buildroot is doing stuff like
vendoring the cargo deps
before generating the tarball(to ensure that the package can be built
from the tarball without
having to download anything additional from cargo):
https://github.com/buildroot/buildroot/blob/master/support/download/cargo-post-process

>
>   TEALDEER_SITE = https://github.com/dbrgn/tealdeer/archive/v$(TEALDEER_VERSION)
>
> ...to ensure that this URL is *really* being downloaded, but it fails
> every time.
>
> Full build log can be found here:
> https://gist.github.com/dbrgn/cc9e96051a079f5b63c531ca3c195954

You can see it vendoring the deps in the log here:
https://gist.github.com/dbrgn/cc9e96051a079f5b63c531ca3c195954#file-gistfile1-txt-L23-L200

>
> Does someone have any pointers why the hash verification would fail in
> this case? It must be some obvious mistake I'm making, but I cannot
> figure out what it is.
>
> Best regards,
> Danilo Bargen
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
