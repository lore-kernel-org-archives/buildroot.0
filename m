Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD27AC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B428415AB;
	Wed, 22 Feb 2023 15:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B428415AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1el6bCoXZmKe; Wed, 22 Feb 2023 15:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7BE040B8E;
	Wed, 22 Feb 2023 15:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7BE040B8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E65F91BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0A2B6116C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0A2B6116C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1AGmY4-UpwFR for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:52:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 490326116A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 490326116A
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:52:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0BCCA20019;
 Wed, 22 Feb 2023 15:52:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUrPv-007sG6-7W; Wed, 22 Feb 2023 16:52:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230206100315.9B99A839FF@busybox.osuosl.org>
Date: Wed, 22 Feb 2023 16:52:27 +0100
In-Reply-To: <20230206100315.9B99A839FF@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Mon, 6 Feb 2023 11:02:53 +0100")
Message-ID: <87edqhwvd0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/yajl: explicitly request a tag
 in _SITE
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

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5be76a39d3a0c21d6f3ceeab0889edc3cec9f2f3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The yajl repository has both a branch and a tag names 2.1.0. Because of
 > this, when we use the usual github URL [1], github doesn't return a
 > tarball but rather an ASCII string:
 >    the given path has multiple possibilities: #<Git::Ref:0x00007f193bebe4d8>, #<Git::Ref:0x00007f193bebd858>

 > This obviously (and fortunately) leads to a hash check failure.

 > To make sure we get the tag and not the branch, we should use a URL that
 > explicitly asks for refs/tags/2.1.0 [2]. We can't change VERSION to
 > include refs/tags, because that also affects the _SOURCE default, the
 > contents of the tarball, the CPE ID and the release-monitoring access.
 > Therefore, add the refs/tags/ prefix to the github helper call.

 > [1] https://github.com/lloyd/yajl/archive/2.1.0/yajl-2.1.0.tar.gz
 > [1] https://github.com/lloyd/yajl/archive/refs/tags/2.1.0/yajl-2.1.0.tar.gz

 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
