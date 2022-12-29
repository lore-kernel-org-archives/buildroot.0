Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC6BC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E251640583;
	Thu, 29 Dec 2022 09:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E251640583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yi1pxmsei4e9; Thu, 29 Dec 2022 09:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4048040578;
	Thu, 29 Dec 2022 09:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4048040578
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 478171BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A5A540578
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5A540578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CjPI57uWPxTp for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:27:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A845640573
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A845640573
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:27:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68CC2240004;
 Thu, 29 Dec 2022 09:27:54 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:27:53 +0100
To: Gleb Mazovetskiy <glex.spb@gmail.com>
Message-ID: <20221229102753.56ee4586@windsurf>
In-Reply-To: <20221219173935.3085978-1-glex.spb@gmail.com>
References: <20221219173935.3085978-1-glex.spb@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672306074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKZIlShWbPKPGInYJc+KUlf0RaUBbULjnXV0uxTc2H8=;
 b=mnBCx6EK8K2zCCw00PvFE+0Z4Td5Pe0FW2AnzTh1MGx4oUoPhJyz59JovfRN20D+/1jJhK
 qdQV+Wh4krONKNF/2JT1RLCuLdb5+dQzFRsqv3tXsihyiviW1RjPghauMoML4uoGMyjZng
 /ipnecx5vG9wSfkFGrtgdHoklNdKX6bBcQrgJyixcBsTwli73JG5BXBM4kEhfTqOwStkxZ
 f09FVrKE1slXs19ZE4TRKyiQb22NRll6BK3uyKle2B0iEnNiLH5GxKybRKvShLh8AOZAzf
 3sedwBrACMkQSMzBTk14CvPLOPqQAkMU8kFyf9d1TgZIHIrCeMeDCSxk6Iz8wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mnBCx6EK
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodplug: update to git
 version
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 19 Dec 2022 17:39:34 +0000
Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> The libmodplug release has not been updated for over 5 years.
> The git version contains many bug fixes, including for OOB
> accesses, unaligned reads and writes, etc.
> 
> This git repository is the official home of libmodplug (by the original
> author), however a new release does not seem likely anytime soon:
> there are multiple open issues in the repository asking the author to
> tag a release, all without a response.
> 
> Update buildroot to the current version of libmodplug from the official
> git repository. The build system changed from autotools to cmake since
> the last version.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/libmodplug/libmodplug.hash | 2 +-
>  package/libmodplug/libmodplug.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

I've applied, but with the following addition:

+# Our version is actually newer than this, but having this allows to
+# not have reports about CVEs for versions older than 0.8.9.0.
+LIBMODPLUG_CPE_ID_VERSION = 0.8.9.0

Indeed, with your change as-is, the results at
http://autobuild.buildroot.net/stats/master.html would have shown that
all known CVEs of libmodplug apply to our package... even though they
in fact affect older releases. This is due to the fact that with the
new version being a Git commit hash, it cannot be compared with the
stable version numbers known in the CVE database.

By making this variable value be 0.8.9.0, we allow the CVE matching
logic to exclude CVEs affecting versions older than 0.8.9.0, which we
now we are not affected by, as we have a newer code base than 0.8.9.0.

Thanks for your contribution!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
