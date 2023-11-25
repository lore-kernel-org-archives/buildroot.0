Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29E7C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 21:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D09F812AB;
	Sat, 25 Nov 2023 21:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D09F812AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFlh5j-ADWqh; Sat, 25 Nov 2023 21:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B75F581490;
	Sat, 25 Nov 2023 21:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B75F581490
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 659DB1BF473
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 383D660A5A
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 383D660A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3xBMM0gXHYA for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 21:22:25 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B927B60A4F
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 21:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B927B60A4F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9135413F838;
 Sat, 25 Nov 2023 22:22:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 22:22:18 +0100
Date: Sat, 25 Nov 2023 22:22:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231125212218.GN3177259@scaer>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700947342;
 bh=5XMAUUREZEWugXVDaoH2F1dGkxWIq4wx6QznkQNRebM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oot/CZSvOYkCFKXvnOKpBFjlNpU3CgItagUUcJlst3UiOcFYpEq5O0mQJgj0llKl7
 8hQA19AOp2cV4SbBimE9o2lxUZeC6KmNNJEghntAg5q8yMTOTmEQ1BAyDZFWt3nE3l
 AuLmn//geTQv3WCCw/kLx/Huahqkyq5FwEta3uRm3E6st0ZhiTb80cWZ9ow2KqzPgj
 KsWdQB7toxsc1mdOMnFLFYPI7l30CnmupIcxqZMkARo3n2gbzozOBD7E/BUIrzhBA/
 z1x9VZrW1ZfmzS6VrjzRUW0wVsLi3H9KI6t62k2F5bmzdoaj3R2QDoWrl/FvBgtZa+
 hFpzR+0Un7fhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oot/CZSv
Subject: Re: [Buildroot] package/pkg-python.mk: refactor setup-type variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-10-01 00:16 +0200, Arnout Vandecappelle via buildroot spake thusly:
> Most of the python-package infrastructure consists of a big conditional
> tree that sets various variables based on the package's setup type.
> Initially, this was quite OK, but since we have 7 different setup types
> now, some of which share some variables with others, it's becoming quite
> complicated and hard to read.
> 
> This patch series refactors it so that the inner-python-package doesn't
> dispatch the setup type through a conditional tree, but instead does it
> with variable indirection, i.e. by using variables like
>  $(PKG_PYTHON_$($(PKG)_SETUP_TYPE_UPPER)_ENV)

I've applied the whole series to next, now, thanks!

When I started looking at:

    package/pkg-python.mk: replace $(_BASE_ENV) with $($(SETUP_TYPE)_ENV)

I was not very happy with it, because it moves the variable part of the
variable name in the middle, while I believe it is more customary to
have it at the end.

Also, I did not initially see why we needed to go with UPPERCASE,
especially as dot and dash are perfectly legit in variable names.

So I started changing your patch to use:

    FOO_ENV_$($(PKG)_SETUP_TYPE)

And then I did the same to the other patches.

Until I realised that those variables were used in specific packages,
and there it looked misplaced to use such a naming.

Also, this would have also meant we'd have to renamed the remaining
variables, like _OPTS and co for consistency, so I backpedaled on it and
restored your patches as you initially sent them.

Still, I reworked the jailhouse package slightly, to move the odd
condition-in-_CMDS to conditionally defined macros.

So, bottom of it: whole series applied to next.

Thanks a lot for this immensely valuable rework!

I think we could even go a bit further and drop the conditional block
that defines the dependencies...

Any taker? ;-)

Regards,
Yann E. MORIN.

> The rist two patches are simple cleanups, removing variables that are
> not really needed.
> 
> The third patch is a preparatory one that splits the build commands for
> target and host builds. This is necessary because we need to use
> different variables for the two, i.e. HOST_PKG_PYTHON_* for host build.
> 
> The fourth and fifth patch each replace one variable from the
> conditional tree with an indirectly addressed one.
> 
> The following three patches are needed because the ninth patch removes
> the PKG_PYTHON_*_OPTS variables, which were used in 3 packages. It is in
> fact not strictly needed to remove those variables, but IMHO they don't
> add sufficient value to keep them. I think it's better to handle the few
> special cases explicitly.
> 
> The ninth patch replaces the remaining variables from the conditional
> tree with indirectly addressed ones. The conditional tree is now empty,
> and the error handling that was in there is made more explicit.
> 
> The tenth patch edits the documentation to remove the references to the
> PKG_PYTHON_*_OPTS variables that were removed in the previous patch.
> 
> This series adds lines rather than removing lines. That is because
> things are made more explicit, introducing per-setup-type variables
> where previously several setup types were (partially) reusing the pep517
> variables. There are also some additional lines because of more line
> splitting.
> 
> To test this series, I built all the python packages with one specific
> toolchain configuration, and I ran all runtime tests for python packages.
> One package failed to build: host-python-sip. It also fails on master.
> For the runtime tests, 14 of them failed, all of them also fail on
> master.
> 
> 
> The following changes since commit 7906272c39744e26ed73028725787aa3a4441c54:
> 
>   package/python-rtoml: migrate to setuptools-rust infrastructure (2023-09-29 22:02:31 +0200)
> 
> are available in the Git repository at:
> 
>   git@gitlab.com:arnout/buildroot.git pkg-python-refactor-variables
> 
> for you to fetch changes up to 89b33e004fc13e22a9c0bdcafcee245a97d2dd51:
> 
>   docs/manual: remove references to PKG_PYTHON_*_OPTS (2023-09-30 15:18:48 +0200)
> 
> ----------------------------------------------------------------
> Arnout Vandecappelle (Essensium/Mind) (10):
>       package/pkg-python.mk: remove $(2)_PYTHON_INTERPRETER variable
>       package/pkg-python.mk: remove _BASE_BUILD_OPTS variable
>       package/pkg-python.mk: split the commands in a target and host section
>       package/pkg-python.mk: replace $(_BASE_ENV) with $($(SETUP_TYPE)_ENV)
>       package/pkg-python.mk: replace $(_BASE_BUILD_CMD) with $($(SETUP_TYPE)_BUILD_CMD)
>       package/python-flit-core: instantiate _INSTALL_CMDS
>       package/jailhouse: expand PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS
>       package/i2c-tools: expand PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS
>       package/pkg-python.mk: replace $(_BASE_INSTALL*_CMD) with $($(SETUP_TYPE)_INSTALL*_CMD)
>       docs/manual: remove references to PKG_PYTHON_*_OPTS
> 
>  docs/manual/adding-packages-python.txt       |  14 +-------
>  package/i2c-tools/i2c-tools.mk               |   6 ++--
>  package/jailhouse/jailhouse.mk               |   7 +++-
>  package/pkg-python.mk                        | 256 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------
>  package/python-flit-core/python-flit-core.mk |   9 +++--
>  5 files changed, 173 insertions(+), 119 deletions(-)
> 
> 
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
