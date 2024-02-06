Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EA8C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA40611E9;
	Tue,  6 Feb 2024 14:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA40611E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99v3G2GbPma8; Tue,  6 Feb 2024 14:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 513BB61122;
	Tue,  6 Feb 2024 14:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 513BB61122
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 550D81BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C8AE40BFE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8AE40BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjTT0mEKvn8w for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:11:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D150404D8
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D150404D8
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABA20FF802;
 Tue,  6 Feb 2024 14:11:44 +0000 (UTC)
Date: Tue, 6 Feb 2024 15:11:44 +0100
To: nvd <nvd@nist.gov>
Message-ID: <20240206151144.103d5b2b@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707228704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Exk+MuEkM4N6Opgkew7KOBrlhgDHX+vuZibc34dSufY=;
 b=bfVbg0TYNV/njnWa6CFZSI6ZuGG4OsmyKLCxe9jdezzRvq5L3+zQ3lPxGpBgVZE4t2W7xy
 I/vrvt/2RU7d1QJzqkkTXpUvv3Rkc3gSsrchVnzoA3y+UoZQ66NgXfqFlqaJxr63cvRglW
 /45ZKWdnt6h3VApDYVqKMgrysZiqw+O5qvmXtAb4BwWJ4QRUVY2mHcwhlGmGO0z/FEC5eY
 H0QI90eOZdc4mBiXdph76Qxkt50a9UlkvhYKRiP1pq2Idr/RukwR9K4ZgkAo0BTJWBCGaG
 mVl7JoDX/2Q1CT8aqXDKbAh0V1HN4UNLNcegu9vInlCNE/s+dk1x1RpZwAG8xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bfVbg0TY
Subject: [Buildroot] CVE-2023-0687 version range fix
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear NVD maintainers,

Your entry at https://nvd.nist.gov/vuln/detail/CVE-2023-0687 for
CVE-2023-0687 states that the affected CPE ID is
cpe:2.3:a:gnu:glibc:2.38:*:*:*:*:*:*:*, which indicates that only glibc
2.38 is affected.

But actually, the bug was fixed in glibc 2.38, so it's all versions
prior to 2.38 that are affected. According to the bug report at
https://sourceware.org/bugzilla/show_bug.cgi?id=29444, this issue was
fixed in commit
https://sourceware.org/git/?p=glibc.git;a=commit;h=801af9fafd4689337ebf27260aa115335a0cb2bc,
and:

$ git tag --contains 801af9fafd46
glibc-2.38
glibc-2.38.9000

So the commit fixing this issue made it to the 2.38 release.

Do you think you could adjust the NVD entry for this CVE ?

Thanks a lot in advance!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
