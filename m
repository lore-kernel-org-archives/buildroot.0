Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07031C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7957660B2D;
	Sun, 18 Dec 2022 13:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7957660B2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzi8FrxPRBxY; Sun, 18 Dec 2022 13:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA962606AA;
	Sun, 18 Dec 2022 13:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA962606AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E603A1BF5A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1124606AA
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1124606AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GImpirJdf07m for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:26:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 390BC60692
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 390BC60692
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:26:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5C070240002;
 Sun, 18 Dec 2022 13:26:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p6tga-003qys-CX; Sun, 18 Dec 2022 14:26:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20221213140306.1202098-1-bagasdotme@gmail.com>
Date: Sun, 18 Dec 2022 14:26:36 +0100
In-Reply-To: <20221213140306.1202098-1-bagasdotme@gmail.com> (Bagas Sanjaya's
 message of "Tue, 13 Dec 2022 21:03:06 +0700")
Message-ID: <87wn6oonar.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.39.0
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailman <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bagas" == Bagas Sanjaya <bagasdotme@gmail.com> writes:

 > The git package on Buildroot is quite lagging behind (v2.31.4, released
 > on July 12, 2022 while the baseline v2.31.0 was released on March 15,
 > 2021). Bump the package to v2.39.0 (released December 12, 2022).

 > While at it, also replace patch fixing uclibc no threads build with two
 > patches cherry-picked from upstream next branch, which fixes the same
 > issue by fixing the handling of flockfile(), funlockfile(), and
 > getc_unlocked() declarations. These patches missed the release but
 > planned for next maintenance release (v2.39.1).

 > The reason for replacing the patch is when original fix patch was
 > upstreamed [1], Jeff King noted that the build failure root cause
 > was flockfile() is defined regardless of whether uclibc is configured with
 > threads support or not [2].

 > Release notes for v2.39.0 is available on release announcement on Git
 > mailing list at [3].

 > [1]: https://lore.kernel.org/git/20221125092339.29433-1-bagasdotme@gmail.com/
 > [2]: https://lore.kernel.org/git/Y4RAr04vS%2FTOM5uh@coredump.intra.peff.net/
 > [3]: https://lore.kernel.org/git/xmqqlencspnl.fsf@gitster.g/

 > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
 > ---
 >  .../git/0001-Fix-build-without-threads.patch  | 100 ----------------
 >  ...avoid-redefining-system-function-nam.patch | 107 ++++++++++++++++++
 >  ...undefine-system-names-before-redecla.patch |  55 +++++++++
 >  package/git/git.hash                          |   2 +-
 >  package/git/git.mk                            |   4 +-
 >  5 files changed, 164 insertions(+), 104 deletions(-)
 >  delete mode 100644 package/git/0001-Fix-build-without-threads.patch
 >  create mode 100644 package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
 >  create mode 100644 package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch

 > +++ b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
 > @@ -0,0 +1,107 @@
 > +From 385f67eb2254edb1fb4cf523e5e3d5a8f123d72c Mon Sep 17 00:00:00 2001
 > +From: Jeff King <peff@peff.net>
 > +Date: Wed, 30 Nov 2022 16:15:14 -0500
 > +Subject: [PATCH 1/2] git-compat-util: avoid redefining system function names

NIT: The patch numbers tend to get outdated fast, so we use
--no-numbered as pointed out by ./utils/check-package:

package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch:4:
generate your patches with 'git format-patch -N'
package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch:4:
generate your patches with 'git format-patch -N'

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
