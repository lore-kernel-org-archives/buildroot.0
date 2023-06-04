Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9978EC77B73
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 10:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4014A4188D;
	Sun,  4 Jun 2023 10:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4014A4188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYG4doHMv47O; Sun,  4 Jun 2023 10:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30A5741742;
	Sun,  4 Jun 2023 10:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A5741742
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 202391BF3B5
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBD6D41742
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD6D41742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAAk16l1e6uu for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 10:54:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A957F4086D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A957F4086D
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 10:54:41 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F10A240002;
 Sun,  4 Jun 2023 10:54:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q5lNe-00Cu35-3B; Sun, 04 Jun 2023 12:54:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <20230518210657.1287204-1-paul@crapouillou.net>
 <87pm6xvwbm.fsf@tarshish>
Date: Sun, 04 Jun 2023 12:54:38 +0200
In-Reply-To: <87pm6xvwbm.fsf@tarshish> (Baruch Siach via buildroot's message
 of "Fri, 19 May 2023 06:19:03 +0300")
Message-ID: <87ttvna45t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.3
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > Hi Paul,
 > On Thu, May 18 2023, Paul Cercueil wrote:

 >> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 >> ---
 >> package/strace/strace.hash | 2 +-
 >> package/strace/strace.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)
 >> 
 >> diff --git a/package/strace/strace.hash b/package/strace/strace.hash
 >> index d49abf1f16..de2f8c52b9 100644
 >> --- a/package/strace/strace.hash
 >> +++ b/package/strace/strace.hash
 >> @@ -1,5 +1,5 @@
 >> # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
 >> # https://strace.io/files/6.2/strace-6.2.tar.xz.asc

 > This link needs update.

 > I verified that the signature at
 > https://strace.io/files/6.3/strace-6.3.tar.xz.asc matches the hash
 > below.

Committed to next after fixing the link, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
