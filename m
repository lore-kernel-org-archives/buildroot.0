Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3388ECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 09:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52A0641030;
	Thu, 15 Sep 2022 09:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A0641030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2A3mD1peD01F; Thu, 15 Sep 2022 09:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34A334102D;
	Thu, 15 Sep 2022 09:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A334102D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 996C31BF3C3
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 09:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FD5B61031
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 09:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD5B61031
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNVP9BzYquu0 for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 09:47:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C5816102A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C5816102A
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 09:47:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5CCE240003;
 Thu, 15 Sep 2022 09:46:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYlST-008Dk9-4t; Thu, 15 Sep 2022 11:46:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220814131906.B8C9A874A0@busybox.osuosl.org>
Date: Thu, 15 Sep 2022 11:46:57 +0200
In-Reply-To: <20220814131906.B8C9A874A0@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 14 Aug 2022 15:29:01 +0200")
Message-ID: <87a671km0e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] paclage/ace: explain why we use C+
 pre-processor flags for C++ flags
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b717880f1fb7728648a2426dc20c3985fa3c530b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit e8011a08b6fd (package/ace: needs C++11) did not explain why it
 > passed C++ flags via the pre-processor flags rather than as C++ flags
 > (via ACE's CCFLAGS).

 > This caused some head-scratching when reviewing and applying
 > 803247337d35 (package/ace: fix build failure due to gcc bug 101915).

 > Add a comment to try and explain the non-standard use of pre-processor
 > flags to pass actual C++ flags.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Cc; Weber, Matthew L Collins <Matthew.Weber@collins.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
