Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FC8C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 19:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F6D640517;
	Sun, 23 Jul 2023 19:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F6D640517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SgIUDnWAdUc; Sun, 23 Jul 2023 19:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FCB7404C9;
	Sun, 23 Jul 2023 19:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FCB7404C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 243E41BF591
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F23E040004
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 19:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F23E040004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWJ3a8vwjUBU for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 19:53:06 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 372F9404F9
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 19:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 372F9404F9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:22c7:ca40:1a2e:1362])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CE11B5FFA9;
 Sun, 23 Jul 2023 21:52:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 21:52:56 +0200
Date: Sun, 23 Jul 2023 21:52:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230723195256.GB3544423@scaer>
References: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
 <20230720233629.1642220-3-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230720233629.1642220-3-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690141983;
 bh=y5qsSEcAsrVmXVB2KHYpe6Mt4d3hvW0lh94DQmHnT3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UO2d45kGzsGPJT4khERc6HosJMt8EmoAN0wkgdsh6TVSiSL+HL64SJYLWHl5O9f4Y
 B6FvuMwFbNUKk5vwqbceecBi61FN/FH86uEz5ZOSDrbkbYAgt6krEHgn0hMkEHQwAI
 YB7H8ueSMno4/Nz4pRcPPcvrRZf/fHtKASxgh9fAl6x+3AMV4Kq9hSG8QnqDkptQAI
 /dmQHExSK/hm6lPRRL5diyKvYWxIXHkNC9KYGcOpPRQQIvmLBJSMadBZUUqEZG7XIF
 sy7D2mGQahQfwRzVM8NiX1vtSyjPZYEOUykUagMVlmgAF5LC7L41BQpC04C36r1AdW
 wCLV+w/RvONmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UO2d45kG
Subject: Re: [Buildroot] [PATCH vRFC 2/3] package/depot-tools: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-07-20 16:36 -0700, Adam Duskett spake thusly:
> Chromium and Chromium OS use a package of scripts called
> depot_tools to manage checkouts and code reviews. This package
> also includes the gclient utility.
> 
> gclient is a Python script to manage a workspace of modular dependencies that
> are each checked out independently from different subversion or git
> repositories. Features include:
> 
>   - Dependencies can be specified on a per-OS basis.
>   - Dependencies can be specified relative to their parent dependency.
>   - Variables can be used to abstract concepts.
>   - Hooks can be specified to be run after a checkout.
>   - .gclient and DEPS are Python scripts. You can hack in easily or add
>      additional configuration data.
> 
> .gclient file: It's the primary file. It is, in fact, a Python script. It
> specifies the following variables:
> 
>   - solutions: an array of dictionaries specifying the projects that will be
>                fetched.
>   - hooks: additional hooks to be run when this meta checkout is synced.
>   - target_os: an optional array of (target) operating systems to fetch
>                OS-specific dependencies for.
>   - cache_dir: Primarily for bots, multiple working sets use a single git
>                cache.
> 
> gclient is necessary for checking out the flutter-engine source code, as the
> release tarballs provided on the flutter-engine github are in no state to
> compile. Google expects the use of gclient to download a source directory
> structure suitable to build the Flutter engine.

Thanks for this very detailed commit log.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[--SNIP--]
> diff --git a/package/depot-tools/0001-Disable-ninjalog-upload.patch b/package/depot-tools/0001-Disable-ninjalog-upload.patch
> new file mode 100644
> index 0000000000..55fd78247f
> --- /dev/null
> +++ b/package/depot-tools/0001-Disable-ninjalog-upload.patch
> @@ -0,0 +1,35 @@
> +From eeea6ad620b88a81a4b05d49f32a375b4bbcef36 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Thu, 13 Jul 2023 15:50:25 -0700
> +Subject: [PATCH] Disable ninjalog upload
> +
> +Google doesn't need the ninja logs.
> +
> +Upstream: buildroot-specific.
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + autoninja | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/autoninja b/autoninja
> +index 06d45d1..354a2f1 100755
> +--- a/autoninja
> ++++ b/autoninja
> +@@ -30,12 +30,12 @@ if eval "$command"; then
> +   fi
> + 
> +   # Collect ninjalog from googler.
> +-  python3 "$(dirname -- "$0")/ninjalog_uploader_wrapper.py" --cmd $command
> ++  # python3 "$(dirname -- "$0")/ninjalog_uploader_wrapper.py" --cmd $command

Don't comment lines out, just remove them (with the associated comment
while at it).

> +   exit
> + fi
> + 
> + # Collect ninjalog from googler.
> +-python3 "$(dirname -- "$0")/ninjalog_uploader_wrapper.py" --cmd $command
> ++# python3 "$(dirname -- "$0")/ninjalog_uploader_wrapper.py" --cmd $command

Ditto.

[--SNIP--]
> diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
> new file mode 100644
> index 0000000000..906340016c
> --- /dev/null
> +++ b/package/depot-tools/depot-tools.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# depot-tools
> +#
> +################################################################################
> +
> +DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
> +DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
> +DEPOT_TOOLS_SITE_METHOD = git
> +DEPOT_TOOLS_LICENSE = Chromium

The license in the LICENSE file looks suspiciously like it is in fact a
BSD-3-Clause:
    https://spdx.org/licenses/BSD-3-Clause.html

> +DEPOT_TOOLS_LICENSE_FILES = LICENSE
> +DEPOT_TOOLS_CPE_ID_VENDOR = google
> +HOST_DEPOT_TOOLS_DEPENDENCIES = \
> +	host-python3 \
> +	host-python-httplib2 \
> +	host-python-pyparsing \
> +	host-python-six
> +
> +define HOST_DEPOT_TOOLS_INSTALL_CMDS
> +	mkdir -p $(HOST_DIR)/share/depot_tools
> +	cp -dprf $(@D)/* $(HOST_DIR)/share/depot_tools/
> +endef
> +
> +# Helper wrapper to make using gclient easier.
> +DEPOT_TOOLS_GCLIENT=\

Spaces on both sides of the equal sign.

> +	PATH=$(BR_PATH):$(HOST_DIR)/share/depot_tools \
> +	LD_LIBRARY_PATH=$(HOST_DIR)/lib \

Ick. Why do we need to set LD_LIBRARY_PATH?

> +	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \

PYTHONPATH=$(PYTHON3_PATH)

Why do we need to force it?

> +	DEPOT_TOOLS_UPDATE=0 \
> +	PYTHONDONTWRITEBYTECODE=1 \

Why do we need PYTHONDONTWRITEBYTECODE=1? I have it in my environment to
avoid littering repositories, indeed, but why do we need to force it for
gclient?

Regards,
Yann E. MORIN.

> +	$(HOST_DIR)/share/depot_tools/gclient.py
> +
> +$(eval $(host-generic-package))
> -- 
> 2.41.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
