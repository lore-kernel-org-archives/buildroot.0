Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C66C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 22:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B491405FD;
	Tue,  7 Jun 2022 22:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYMTBFFqJfS3; Tue,  7 Jun 2022 22:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84DE54018E;
	Tue,  7 Jun 2022 22:01:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 146711BF423
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 22:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F133260D7B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 22:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eclJxUHpFT-f for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 22:01:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B811D60C15
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 22:01:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4EB71C0002;
 Tue,  7 Jun 2022 22:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654639290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rueVhsUCFqVQ4LscEpZXBRsc407W4ok1OCElJT+6M5Q=;
 b=Gpw08deQlOIRFh+E/YkmFNaesABrCs36TFNKuqt6adhveBAv0AWzOPEaPubYBzJ2lfa5Mf
 cPB1RJaYwUIJ617aOtQYr85cj0EX3lUfm7AXbS08sOCVOpaieSTvv/zpqYLOi2hZ4WjLah
 Ef94doXbGfb6g4evoN1OZKMDlNZtaask82I4H40HwfjjqliI5Z3m1rHmzoznPE4k6S5lQM
 7ESVJdzGrC+NlPUxQ0eOeO7tYhHZw7TJqMV3tzYFKZj/eEuTEqFDBFLzS9x9yKOuyuVQ6t
 HQLc2LVkzlTdYnynQ0hYBAE7Dr226dMKR61Zj4LQWhhyibcTN8CFMGjQTv9/Rg==
Date: Wed, 8 Jun 2022 00:01:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220608000128.046574c1@windsurf>
In-Reply-To: <20220413212745.480101-1-james.hilliard1@gmail.com>
References: <20220413212745.480101-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] scripts/autobuild-run: add
 --no-toolchains-csv option and drop docopt
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed, 13 Apr 2022 15:27:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Since docopt is unmaintained and less flexible than argparse lets
> drop it and migrate to argparse.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - suppress --no-toolchains-csv default output from help
> Changes v1 -> v2:
>   - fix configparser
> ---
>  scripts/autobuild-run      | 202 ++++++-------
>  scripts/docopt.LICENSE-MIT |  23 --
>  scripts/docopt.py          | 581 -------------------------------------
>  3 files changed, 93 insertions(+), 713 deletions(-)
>  delete mode 100644 scripts/docopt.LICENSE-MIT
>  delete mode 100644 scripts/docopt.py

I have finally applied this patch, but after splitting it into two
commits:

 * One implementing the docopt -> argparse migration

 * One implementing the --no-toolchains-csv option

Also, the --no-toolchains-csv option of utils/genrandconfig did not
exist back in the 2022.02.x branch, so when autobuild-run is executed
with --no-toolchains-csv, it never built any configuration on
2022.02.x, which is problematic.

I worked this around by doing a special case:

  https://git.buildroot.org/buildroot-test/commit/?id=cae22243b75f7766095cbef196016b3b3143b677

I have now deployed the new script on two of the autobuilder instances
that I manage (gcc159 and gcc160).

Could you on your side also update to use the latest version of
autobuild-run, so that we are aligned?

Thanks a lot for this work, it has been extremely useful to find more
problematic configurations!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
