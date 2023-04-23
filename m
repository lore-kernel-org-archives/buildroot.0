Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270ADC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B45F540B5B;
	Sun, 23 Apr 2023 10:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B45F540B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPCxBN4PQaPk; Sun, 23 Apr 2023 10:37:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA03B40AB1;
	Sun, 23 Apr 2023 10:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA03B40AB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 204421C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDEDA60B74
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDEDA60B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptRq7cxSJMBe for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:37:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B9D960B69
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B9D960B69
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:37:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 846F3240004;
 Sun, 23 Apr 2023 10:37:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqX5y-002b3y-DS; Sun, 23 Apr 2023 12:37:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
References: <20220902222849.1098641-1-mario.haustein@hrz.tu-chemnitz.de>
 <20220926160849.1046939-1-mario.haustein@hrz.tu-chemnitz.de>
Date: Sun, 23 Apr 2023 12:37:26 +0200
In-Reply-To: <20220926160849.1046939-1-mario.haustein@hrz.tu-chemnitz.de>
 (Mario Haustein's message of "Mon, 26 Sep 2022 18:08:49 +0200")
Message-ID: <87cz3u6g0p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/dcron: fix /etc/cron.d/system
 cron jobs
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
Cc: "Alvaro G. M" <alvaro.gamez@hazent.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Mario" == Mario Haustein <mario.haustein@hrz.tu-chemnitz.de> writes:

 > Jobs with the syntax @hourly, @daily, ... were not executed since the
 > version bump from `v4.5` to commit `1ba33c3325df48de46263276a43ed76cf9d81518`.
 > This patch fixes the bug downstream.

 > Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
 > ---
 > Changes v1 -> v2:
 >   - Use `git format-patch` to export the patch
 >   - Specify the version bump which broke dcron in the commit message

 > Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>

Committed to 2023.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
