Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA74C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 21:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08BD461070;
	Sat, 21 May 2022 21:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C22F3MmTTBPy; Sat, 21 May 2022 21:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 033D360E90;
	Sat, 21 May 2022 21:58:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAA0E1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 21:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA08C83FBA
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 21:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QotcIxcHTxkJ for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 21:58:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88ADC8401A
 for <buildroot@buildroot.org>; Sat, 21 May 2022 21:58:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A2591BF203;
 Sat, 21 May 2022 21:58:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsX6z-00B5Yw-M8; Sat, 21 May 2022 23:58:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220413124253.2481210-1-peter@korsgaard.com>
Date: Sat, 21 May 2022 23:58:13 +0200
In-Reply-To: <20220413124253.2481210-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Apr 2022 14:42:52 +0200")
Message-ID: <878rqu35vu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/git: security bump to version 2.31.2
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 >  CVE-2022-24765:
 >   On multi-user machines, Git users might find themselves unexpectedly in
 >   a Git worktree, e.g. when there is a scratch space (`/scratch/`) intended
 >   for all users and another user created a repository in `/scratch/.git`.
 >   Merely having a Git-aware prompt that runs `git status` (or `git diff`)
 >   and navigating to a directory which is supposedly not a Git worktree, or
 >   opening such a directory in an editor or IDE such as VS Code or Atom, will
 >   potentially run commands defined by that other user via
 >   `/scratch/.git/config`.

 > https://www.openwall.com/lists/oss-security/2022/04/12/7

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.02.x, thanks.

> ---
 >  package/git/git.hash | 2 +-
 >  package/git/git.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/git/git.hash b/package/git/git.hash
 > index 1db29ac457..5868fbffda 100644
 > --- a/package/git/git.hash
 > +++ b/package/git/git.hash
 > @@ -1,5 +1,5 @@
 >  # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
 > -sha256  9f61417a44d5b954a5012b6f34e526a3336dcf5dd720e2bb7ada92ad8b3d6680  git-2.31.1.tar.xz
 > +sha256  d9167d801cf4aa2abca6e8f43d5d1b383e02e4d257ac1dc071802bb773ed0e2a  git-2.31.2.tar.xz
 >  # Locally calculated
 >  sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 >  sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
 > diff --git a/package/git/git.mk b/package/git/git.mk
 > index 90b1acd6a4..0127ba5129 100644
 > --- a/package/git/git.mk
 > +++ b/package/git/git.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -GIT_VERSION = 2.31.1
 > +GIT_VERSION = 2.31.2
 >  GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 >  GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 >  GIT_LICENSE = GPL-2.0, LGPL-2.1+
 > -- 

 > 2.30.2


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
