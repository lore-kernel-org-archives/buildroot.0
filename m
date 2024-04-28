Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854BEC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 12:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 414C0605BD;
	Sun, 28 Apr 2024 12:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mARFEK5uugmF; Sun, 28 Apr 2024 12:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5393C605F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5393C605F1;
	Sun, 28 Apr 2024 12:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 002F41BF399
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 12:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF1DB40555
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 12:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7vVAgeUcygb for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 12:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6073A40552
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6073A40552
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6073A40552
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 12:11:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A7B4240002;
 Sun, 28 Apr 2024 12:11:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s13Nj-003JZU-1A;
 Sun, 28 Apr 2024 14:11:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240331202923.D47F8843B4@busybox.osuosl.org>
Date: Sun, 28 Apr 2024 14:11:42 +0200
In-Reply-To: <20240331202923.D47F8843B4@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 31 Mar 2024 22:21:52 +0200")
Message-ID: <87y18xd6v5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] utils/check-package: don't ignore
 check-package
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=81bb14a93535da0fbf02ca715ac9ebdca3486732
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 32934b526b64 (utils/checkpackagelib: check for Upstream trailers)
 > introduced a new python module to check Upstream tags in patch files. In
 > doing so, it introduced a flake8 coding style issue. That was not caught
 > when applying the change, and neither was it caught by our daily checks,
 > because the .checkpackagefile was regenerated right just in the next
 > commit, to apply ignore patterns to existing patch files.

 > It is a bit sad that one of our checks does not itself passes all our
 > checks...

 > Fix that trivial issue now.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
