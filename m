Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E7FC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B81DD41014;
	Thu,  9 Jun 2022 20:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pASQvW3dDUXg; Thu,  9 Jun 2022 20:32:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFCA141154;
	Thu,  9 Jun 2022 20:32:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A968D1BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 964D641B8A
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTx4g9O2QGP6 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:32:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BDE341B6B
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:32:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17C621C0003;
 Thu,  9 Jun 2022 20:32:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzOpS-002MHE-8b; Thu, 09 Jun 2022 22:32:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220606102822.398093-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 22:32:30 +0200
In-Reply-To: <20220606102822.398093-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 Jun 2022 12:28:22 +0200")
Message-ID: <87sfodzig1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.5062
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

 > Fix CVE-2022-1851: Out-of-bounds Read in GitHub repository vim/vim prior
 > to 8.2.

 > Fix CVE-2022-1886: Heap-based Buffer Overflow in GitHub repository
 > vim/vim prior to 8.2.

 > Fix CVE-2022-1898: Use After Free in GitHub repository vim/vim prior to
 > 8.2.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

> ---
 >  package/vim/vim.hash | 2 +-
 >  package/vim/vim.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/vim/vim.hash b/package/vim/vim.hash
 > index 9d61d6fc87..55e5643b90 100644
 > --- a/package/vim/vim.hash
 > +++ b/package/vim/vim.hash
 > @@ -1,4 +1,4 @@
 >  # Locally computed
 > -sha256  5606a3c62dba038f4c4f2eddb305ffccbae58a7bfd569bdb8100f524564c8a32  vim-8.2.4980.tar.gz
 > +sha256  3052bc702cfb49571dbcf9824827ae6032c37c7bf1a2aa0d3f7cc18c8f085dfb  vim-8.2.5062.tar.gz
 >  sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 >  sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
 > diff --git a/package/vim/vim.mk b/package/vim/vim.mk
 > index 9e70360b90..6dbb32d27b 100644
 > --- a/package/vim/vim.mk
 > +++ b/package/vim/vim.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -VIM_VERSION = 8.2.4980
 > +VIM_VERSION = 8.2.5062
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
