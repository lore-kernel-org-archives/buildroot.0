Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6161DC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 13:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA98760AE4;
	Thu, 29 Sep 2022 13:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA98760AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUkvrrMoc1WL; Thu, 29 Sep 2022 13:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C995160B65;
	Thu, 29 Sep 2022 13:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C995160B65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59AEC1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34D0640B4E
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34D0640B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WcrjCGUW-bF for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 13:49:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6616C408F1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6616C408F1
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 13:49:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C0A49240003;
 Thu, 29 Sep 2022 13:49:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1odtuj-009ZyY-Ir; Thu, 29 Sep 2022 15:49:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220918103019.196327-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Sep 2022 15:49:21 +0200
In-Reply-To: <20220918103019.196327-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Sep 2022 12:30:19 +0200")
Message-ID: <87v8p68f4u.fsf@dell.be.48ers.dk>
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

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
