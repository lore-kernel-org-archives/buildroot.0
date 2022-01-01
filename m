Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCBDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 14:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC29C605EE;
	Sat,  1 Jan 2022 14:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QLFQYXJSZcU; Sat,  1 Jan 2022 14:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD22D60D78;
	Sat,  1 Jan 2022 14:01:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB9611BF39A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA20C80B92
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnJFbtrYT02z for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 14:01:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98A1780B87
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 14:01:26 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id r22so48655725ljk.11
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 06:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9XLc9hev/YqNxetQ2HbcURXWhV5uKSI7rbb3VQm/Zo8=;
 b=FiFYki8sCqmmdASDSNh6SM6xTzvYOXSsFIUU8C4EspjZ1pNZhAcZSD67RvNKsP8pJo
 T0Jne6m2KHmyOsmwh4xYGvbeXyx4smsuqi0lAvmXdFQ0jncsBxfdALL8RLdODPkuc+Lr
 XyJK6VJrJMpAQlCjVqG2yHVO0mZzEFrLUKEtdFrdPNSjCcbkD3Uc4JWbu0ak9dZj2qIY
 V8CX8C/Y+9s0PEDIM7gwkWIPAdhBZjzyJqDtvrX2AHlnYn5Tp3o580qEUQY8fN1MkeYx
 FXpIHis2N70s3qcE6E4H/JsGtt6uEWBPMrIIoKUEF/Y8cwmyawcypQPcW4FLUyiz+zSR
 W0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9XLc9hev/YqNxetQ2HbcURXWhV5uKSI7rbb3VQm/Zo8=;
 b=8Lg++NCnL+PVlIWU3kBZNFKq7tQ3+DWmV+noThz74h6kHIbCCx9+/SimwnwMmtCuUc
 qnXW6WpoGs772bIQFKsU1LI1Ij3Bn0c3dXiHvFvzItqgPOtEB84f5uzst0lt5Y6n8e8T
 ZTlddIIQouEKMjGM5wqOanGqXg/meZsjQJK99HuFIw08ags9k/ktkF4xM4XvONfsotfS
 H6k2jz/9SlS5LcLY9JSfVg95WHHnOM7FM0IE8lLZdBBCuI8crInfaN9TmPcBS9BJq7rU
 lXu9pa85ohT/1lhdL20Gcp0b290rzGvwYCOvuNq0UtbpqtmIsBfA0ZJv4GVDZJwi1iJj
 sH+Q==
X-Gm-Message-State: AOAM530Gk+tz344gq1a9/tNJuicICTtInBqeCZBXjFxK4HoRDQfJ1pBy
 y4Vo7dnHPrzL9s8QUlhs8oI=
X-Google-Smtp-Source: ABdhPJybwAPbEZReal4oW6iTQ43OEDzqjVqAWa3r4C8wYAxtgP0g8rIYuxqdLIlF9VgoVXc4Pusi9g==
X-Received: by 2002:a2e:8849:: with SMTP id z9mr10297776ljj.399.1641045684339; 
 Sat, 01 Jan 2022 06:01:24 -0800 (PST)
Received: from luthien ([176.10.248.201])
 by smtp.gmail.com with ESMTPSA id n14sm1244082lfu.28.2022.01.01.06.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 06:01:23 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Matt Weber <matt@thewebers.ws>, buildroot@buildroot.org
In-Reply-To: <20210215053258.3323654-1-matt@thewebers.ws>
References: <20210215053258.3323654-1-matt@thewebers.ws>
Date: Sat, 01 Jan 2022 15:01:23 +0100
Message-ID: <87ee5r1rnw.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [[Next]RFC] sdk-docker: new make target using
 Dockcross
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
Cc: Matt Weber <matt@thewebers.ws>, konrad.schwarz@siemens.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 angelo@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi,

sorry for the late review:

On Sun, Feb 14, 2021 at 23:32, Matt Weber <matt@thewebers.ws> wrote:
> This patch adds a new make target for building a Docker with
> an SDK installed. This patch has not been broken up and is for
> RFC only to get feedback on the technical approach.
>
>  - `make sdk-docker` first sets up the dockcross package and
>    the environment-setup script to stage the environment.
>
>  - The dockcross package in Buildroot includes a folder with
>    a custom Dockerfile and pre-exec setup scripts which are
>    copied into the dockcross build folder at configure time.
>    This Dockerfile uses the Buildroot base and sets up other
>    tools to allow a project to completely execute a build flow
>    with make / cmake / meson / scons.
>
>  - Within the Dockcross package, the entrypoint and sudo
>    scripting are reused but a new standard image/custom image
>    is not defined.  Instead this patchset duplicates the
>    docker build step in the Buildroot top-level Makefile.
>    The entrypoint / sudo scripting were reused because it
>    handles seamless mapping of the calling user into the
>    container for the build and back with all the files uid/gid
>    intacted.
>
>  - One of the best advantages of this environment is the
>    fact it resets on each new lauch and is clean for a new
>    build.  I.e. just the PWD which is mapped as /work inside
>    is maintained after the container tears down.
>
>  - I'm unsure if it makes sense to use dockcross or just pull
>    over the concepts they use into Buildroot directly....
>    I think I found a good balance considering each Buildroot
>    defconfig build is unique so it doesn't seem like there is
>    a chance to upstream a Buildroot configuration to dockcross.
>
>  - TODO: Add a manual section that includes usage notes
>
>  - How to test
>    make qemu_aarch64_virt_defconfig
>    make sdk-docker
>    # Usage from https://github.com/dockcross/dockcross
>    # Setup container launch script
>    docker run --rm dockcross/buildroot-sdk-aarch64-buildroot-linux-gnu  > ./dockcross
>    # This dockcross script maps the pwd into the container as /work
>    # as well as the current users $HOME as $HOME inside.
>    # Executing the script to dump the env, should list all the
>    # environment-setup exported values for use
>    ./dockcross bash -c 'export'
>    # Check that the cross toolchain executes
>    ./dockcross bash -c '$CC -version'
>
> Signed-off-by: Matt Weber <matt@thewebers.ws>

This looks *really* interesting!  At $DAYJOB we currently have locally
maintained docker containers to get reproducible build environments on
developer laptops.  Having it integrated in Buildroot would be great!

I've tested your patch using latest Buildroot and qemu_x86_64_defconfig
but it failed with the following, which turned out to be a too old
buildroot/base.  When I bumped to 20211120.1925 it worked fine.  Turns
out GitHub dropped insecure cryptos last summer and the old Debian base
had a bit too old curl:

Downloading https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64
######################################################################## 100.0%
curl: (35) Unknown SSL protocol error in connection to objects.githubusercontent.com:443 
The command '/bin/sh -c set -x &&   /buildscripts/install-gosu-binary.sh &&   /buildscripts/install-gosu-binary-wrapper.sh &&   rm -rf /buildscripts' returned a non-zero code: 35
make[1]: *** [Makefile:629: sdk-docker] Error 35

Only two things that stick out to me are:

 1. might need to have some small check in the top Makefile to verify
    that 'docker' is available on the host system -- maybe obvious to
    experienced users, but it would help reduce the support burden for
    the mailing list, I think
 2. the dockcross project apparently doesn't do releases, or even tags,
    so it might be a bit of a hassle to track changes and do updates?
    Maybe we could reach out to them and ask for tags, at least

Can't give better technical feedback than that, maybe Mr Petazzoni can
chime in here wrt the actual integration.

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
