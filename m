Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E88FC7618A
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 22:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0820C40472;
	Sat, 18 Mar 2023 22:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0820C40472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjAkwB_vy0uH; Sat, 18 Mar 2023 22:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41DFD40463;
	Sat, 18 Mar 2023 22:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41DFD40463
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 924D81BF2FF
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78B4040463
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B4040463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mkdpqCcPggm for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 22:22:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C4BC403B8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C4BC403B8
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 22:22:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D622FF802;
 Sat, 18 Mar 2023 22:22:53 +0000 (UTC)
Date: Sat, 18 Mar 2023 23:22:52 +0100
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230318232252.1a6ce79b@windsurf>
In-Reply-To: <20230316204743.26192-1-dalang@gmx.at>
References: <20230316204743.26192-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679178173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLDKBKehB2qRvpkEDB6dQurzU526pzgFzaX/J7VHPhk=;
 b=ltBOg2bQVvOp3ZZKCP37ajRRqMxvxz6aeWUVZhxQhzvNMi7NCQJ3hndllK/LegnV0ZGuTh
 eENHb8kSRVmUCcKFMM4sW5GKkqnaRaJ9dGpZLtNWfs0abmOGX2AmYjH181Kbff76jAE3u5
 URjKkzJkTn6tcMwJhSdttZMEPesbYOAHCc0W5JZ2UgkjT9IZSFsw2Mh+DJNWMgYbZ8/PR+
 lYo4LYoFM6C0KxJjtYw74Df6ncXvqUu8jNW+riuMd83WDbwyuaXWd565eBKX/HKjJc50dk
 bgrdK+mr2F1dbPLhm6XgZFzrveqTQ/NurW0DfeEf1JHpiEq7t2bssV8QnAp85A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ltBOg2bQ
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 16 Mar 2023 21:47:43 +0100
Daniel Lang <dalang@gmx.at> wrote:

> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  ...2pem.py-make-cryptography-module-opt.patch | 10 ++++---
>  ...2pem.py-Fix-compat-with-cryptography.patch | 29 -------------------
>  package/ca-certificates/ca-certificates.hash  |  4 +--
>  package/ca-certificates/ca-certificates.mk    |  4 +--
>  4 files changed, 10 insertions(+), 37 deletions(-)
>  delete mode 100644 package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch

I didn't look carefully, but it doesn't apply here:

Applying patch #1757985 using "git am -s"
Description: package/ca-certificates: bump version to 20230311
Applying: package/ca-certificates: bump version to 20230311
error: patch failed: package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch:36
error: package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch: patch does not apply
error: patch failed: package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch:1
error: package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch: patch does not apply
Patch failed at 0001 package/ca-certificates: bump version to 20230311
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

Does your patch apply on the master branch?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
