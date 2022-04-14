Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3941C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5280783300;
	Thu, 14 Apr 2022 20:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FFRSmq7ixPxk; Thu, 14 Apr 2022 20:12:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6982B831E3;
	Thu, 14 Apr 2022 20:12:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3A21BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7791B409E0
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 781N6cQYxeJZ for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:11:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 683D4404D7
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:11:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 971491C0003
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:11:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nf5ok-00Brm6-7L
 for buildroot@buildroot.org; Thu, 14 Apr 2022 22:11:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220413121822.2448474-1-peter@korsgaard.com>
Date: Thu, 14 Apr 2022 22:11:50 +0200
In-Reply-To: <20220413121822.2448474-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Apr 2022 14:18:22 +0200")
Message-ID: <874k2vbf21.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/subversion: security bump to
 version 1.14.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-28544: SVN authz protected copyfrom paths regression

 >   Subversion servers reveal 'copyfrom' paths that should be hidden according
 >   to configured path-based authorization (authz) rules.  When a node has
 >   been copied from a protected location, users with access to the copy can
 >   see the `copyfrom' path of the original.  This also reveals the fact that
 >   the node was copied.  Only the 'copyfrom' path is revealed; not its
 >   contents.  Both httpd and svnserve servers are vulnerable.

 >   https://subversion.apache.org/security/CVE-2021-28544-advisory.txt

 > - CVE-2022-24070: Subversion's mod_dav_svn is vulnerable to memory corruption

 >   While looking up path-based authorization rules, mod_dav_svn servers may
 >   attempt to use memory which has already been freed.

 >   https://subversion.apache.org/security/CVE-2022-24070-advisory.txt

 > Drop no longer needed patch and autoreconf, as this is now fixed upstream:

 > https://svn.apache.org/viewvc?view=revision&revision=1881534

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
