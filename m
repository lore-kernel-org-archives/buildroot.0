Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D43C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C15708440F;
	Sun, 18 Sep 2022 10:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C15708440F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCrl46PRaOpg; Sun, 18 Sep 2022 10:55:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63BDE8427D;
	Sun, 18 Sep 2022 10:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63BDE8427D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4933E1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 255258427D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255258427D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_STy4F2zTNY for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:55:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEE1A84236
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEE1A84236
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:55:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EBD69200003;
 Sun, 18 Sep 2022 10:54:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZrww-00BbIh-UW; Sun, 18 Sep 2022 12:54:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220918103019.196327-1-fontaine.fabrice@gmail.com>
Date: Sun, 18 Sep 2022 12:54:58 +0200
In-Reply-To: <20220918103019.196327-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Sep 2022 12:30:19 +0200")
Message-ID: <87a66xgdfh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/git: security bump to version
 2.31.4
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2022-29187: Git is a distributed revision control system. Git
 > prior to versions 2.37.1, 2.36.2, 2.35.4, 2.34.4, 2.33.4, 2.32.3,
 > 2.31.4, and 2.30.5, is vulnerable to privilege escalation in all
 > platforms. An unsuspecting user could still be affected by the issue
 > reported in CVE-2022-24765, for example when navigating as root into a
 > shared tmp directory that is owned by them, but where an attacker could
 > create a git repository. Versions 2.37.1, 2.36.2, 2.35.4, 2.34.4,
 > 2.33.4, 2.32.3, 2.31.4, and 2.30.5 contain a patch for this issue. The
 > simplest way to avoid being affected by the exploit described in the
 > example is to avoid running git as root (or an Administrator in
 > Windows), and if needed to reduce its use to a minimum. While a generic
 > workaround is not possible, a system could be hardened from the exploit
 > described in the example by removing any such repository if it exists
 > already and creating one as root to block any future attacks.

 > https://github.com/git/git/blob/v2.31.4/Documentation/RelNotes/2.31.4.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
