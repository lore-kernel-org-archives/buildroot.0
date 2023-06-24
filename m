Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B85EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 15:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C65F611C2;
	Sat, 24 Jun 2023 15:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C65F611C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3yX265JzGKi; Sat, 24 Jun 2023 15:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63634611BC;
	Sat, 24 Jun 2023 15:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63634611BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64C531BF420
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DE94611BC
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE94611BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1L_y63Pd7qdw for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 15:27:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2071960AFB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2071960AFB
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:27:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F0862B00565;
 Sat, 24 Jun 2023 17:27:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 17:27:13 +0200
Date: Sat, 24 Jun 2023 17:27:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bryce Johnson <bryce@redpinelabs.com>
Message-ID: <20230624152713.GY24952@scaer>
References: <CADXxVSKVs-LQ7we1DPQ3oN46ONQ-d56Cza8zRZ=2HyTGZ-bTow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADXxVSKVs-LQ7we1DPQ3oN46ONQ-d56Cza8zRZ=2HyTGZ-bTow@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687620437;
 bh=nt7cfaYSOkTzWB29QQKbuSgcxnZrOq9m4u4ocZAyB8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6M3Lk4yXqP80YsY0OH+0ixf7qA2//Hynk5PpShBLlslx771d3guCY/gf11PMIGth
 0Yu9OY20/otW4CT7wEkJArrW1EZHfRKCk9N3UiSyJsuu1JhEJYBaiR0BxvADrpaOWQ
 XZVHZO+j9PO4XcpCqpWpcySVHXZDjE7S0FdCAKjJgcM86Ihom4HwrOyaUbeT4apnfW
 eFj/I/yXFyC1/gIM9HBXgwkeS+cNaUDh+o2Ar7g5e+ML73tsG84WnjlQ/W9ORRrhl1
 dkUaJmDa2reiauCo1LaQWUhYDVc4YGbXOP271mbWqnuCkjTvibRhTud5o1wb0tM+NW
 lKcY7VocXp3xA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p6M3Lk4y
Subject: Re: [Buildroot] Using a go.mod in a subdirectory
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
Cc: christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bryce, All,

On 2023-06-23 10:59 -0600, Bryce Johnson spake thusly:
> Hi All,
> I was looking at adding a package for shellhub in buildroot.  Two
> issues, first one is that the latest needs go 1.20.  I applied this
> patch (https://patchwork.ozlabs.org/project/buildroot/list/?series=358451)
> to get around that which seems to work so far.   CC: Christian since
> I'm testing with his patch set.
> 
> The 2nd issue is the agent is in a subdirectory with its own go.mod
> that is different from one the on the root directory.
> 
> Is there a way to do this better?  Or is the go.mod required to be in
> the root of the repo?

When we introduced the go-package infra, we made the assumption that go
would be finely-grained packaged, with one single "go package" per
source tree, and that it would be at the root of the source tree.

The result of these assumptions are clearly visible in two location:

  - support/download/go-post-process expects that the vendoring and the
    go.mod are both at the root of the source tree; see lines 18 and 27;

  - package/pkg-golang.mk also expects that the go package lies at the
    root; see lines 111, 123, 139, and 148.

This restriction could certainly be lifted if support for FOO_SUB_DIR
was to be added to the go-package infra, but it is not straightforward.

When that is done, you'd need a buildroot package for each sub-part of
shellhub you need. Of course, in such a case, even though the different
parts would come from the same source tree, we could not share the
generated source archive with _DL_SUBDIR, becasue the different parts
would not be vendored similarly).

> SHELLHUB_VERSION = v0.12.3
> SHELLHUB_SITE = $(call github,shellhub-io,shellhub,$(SHELLHUB_VERSION))

We try to keep a "clean" version string without the decorum used to make
it a git tag, and make that part of the site URL, e.g.:

    SHELLHUB_VERSION = 0.12.3
    SHELLHUB_SITE = $(call github,shellhub-io,shellhub,v$(SHELLHUB_VERSION))

Regards,
Yann E. MORIN.

> SHELLHUB_LICENSE = Apache-2.0
> SHELLHUB_LICENSE_FILES = LICENSE.md
> SHELLHUB_DEPENDENCIES = libxcrypt
> 
> SHELLHUB_GOMOD = github.com/shellhub-io/shellhub/agent
> SHELLHUB_LDFLAGS =  -X main.AgentVersion=${SHELLHUB_VERSION}
> 
> # SHELLHUB_BUILD_TARGETS = agent
> # SHELLHUB_INSTALL_BINS = $(notdir $(SHELLHUB_BUILD_TARGETS))
> 
>  $(eval $(golang-package))
> 
> 
> I can export my output/host/usr/bin and do go build -ldflags "-X
> main.AgentVersion=v0.12.3" and it is able to build in that way, so it
> seems the host-go 1.20 patch is working.
> 
> Bryce
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
