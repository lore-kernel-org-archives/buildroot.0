Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0786C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5808E408C3;
	Sun, 10 Apr 2022 20:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fI4r9Iyey-3T; Sun, 10 Apr 2022 20:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62EC5405A3;
	Sun, 10 Apr 2022 20:04:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7658F1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65F3D83F23
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piAS5dLf7t58 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:04:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3687D83EDC
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:04:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C630620008;
 Sun, 10 Apr 2022 20:04:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nddnb-005E45-Pv; Sun, 10 Apr 2022 22:04:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220410173903.624901-1-fontaine.fabrice@gmail.com>
Date: Sun, 10 Apr 2022 22:04:39 +0200
In-Reply-To: <20220410173903.624901-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Apr 2022 19:39:03 +0200")
Message-ID: <87pmlon1rc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4732
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

 > Fix CVE-2022-1154: Use after free in utf_ptr2char in GitHub repository
 > vim/vim prior to 8.2.4646.

 > Fix CVE-2022-1160: heap buffer overflow in get_one_sourceline in GitHub
 > repository vim/vim prior to 8.2.4647.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

> ---
 >  package/vim/vim.hash | 2 +-
 >  package/vim/vim.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/vim/vim.hash b/package/vim/vim.hash
 > index d2c91dcfa5..d55b1ea355 100644
 > --- a/package/vim/vim.hash
 > +++ b/package/vim/vim.hash
 > @@ -1,4 +1,4 @@
 >  # Locally computed
 > -sha256  acca7330e41d01b53d4455ff98fafbf13282ba6461cd92eb1188836f6b03ec0f  vim-8.2.4632.tar.gz
 > +sha256  ccd57b074326b2faa15591eba3c86dcc07e53781079c44a0354436b8c4fe9b70  vim-8.2.4732.tar.gz
 >  sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 >  sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
 > diff --git a/package/vim/vim.mk b/package/vim/vim.mk
 > index 71aa735eff..4eb659fd6e 100644
 > --- a/package/vim/vim.mk
 > +++ b/package/vim/vim.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -VIM_VERSION = 8.2.4632
 > +VIM_VERSION = 8.2.4732
 >  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 >  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 >  VIM_SUBDIR = src
 > -- 

 > 2.35.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
