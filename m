Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88AACA0FE6
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 07:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF7141F1A;
	Fri,  1 Sep 2023 07:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FF7141F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zP_0RzbXuPVN; Fri,  1 Sep 2023 07:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3513541F06;
	Fri,  1 Sep 2023 07:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3513541F06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5CD1BF294
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 07:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12BEA60C0C
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 07:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12BEA60C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXY2OPcxPDFB for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 07:02:45 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD2E360709
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 07:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD2E360709
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id DE18DA035B
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 09:02:43 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id C3C31A00E2
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 09:02:43 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 9929E241482
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 09:02:43 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 01 Sep 2023 09:02:43 +0200
Message-ID: <13341192.uLZWGnKmhe@kilian-aisec>
In-Reply-To: <20230825053413.06922800FC@mxpostfix02.mail.de>
References: <20230825053413.06922800FC@mxpostfix02.mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1109
X-purgate-ID: 154282::1693551763-3AFFC660-A4FC2BD0/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1693551763;
 bh=wzm6N/72ozNdu8p00TTsWHYm706WOlinqQOR6BNd7Sw=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=5L84EtjsyntEnpSBjEoPdGH2OHyyePWR8qjJo7NfbLaVT8sGGuLERvT/ksbL02mI+
 8TwIL0t6tx3vUN9umzvj9YFiJRLUV1ESMtLa3hPeNI1tW8q1amVw5i506GMC604s6j
 rfuuhsDxo9cnt6udDDAaWn0SpaE7szsuD7QE2vXbRftyUGN6mSP6Rn1cCfDgTWennL
 Rt7TLw+oSuGEcqjUsg3+j7h4B7Y5aIEIea66XExpKYp1ZQruuRYDIyYfj+LxGyK8UA
 /SMIaDpfDpJb18EIMftCR1coLOl8OXxQb3YtBKezCBVbhzVPM1w2QLSt7vHv6yCZ1I
 WXe8vw9cIJqPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=5L84Etjs
Subject: [Buildroot] package: rockchip-rkbin - supposed wrong tarball hash
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I got a notification about a week ago, that building the rockchip-rkbin package 
fails:

[--SNIP--]
> Build failures related to your packages:
> 
>     arch     |             reason             |                             
>          url
> -------------+--------------------------------+----------------------------
> ----------------------------------------------------- arm      |
> rockchip-rkbin-b4558da0860c... |
> http://autobuild.buildroot.net/results/eb4231ebf8eeda3d17fb0571279a3ae09a52
> 7ef0

The build-end.log told me, that the downloaded tarball had a wrong sha256 
hash, i.e.:

ERROR: expected: 
bd8d19ace202ff26d1c0b4d7744cd467cd0093801dc674dde57290159eedee2b
ERROR: got     : 
6607b7fa314d3db91e60e5ba4eabdb90e233bba500578970f0879837ec03c231

I tried to reproduce this, but it actually looked like the hash from the 
package's hash file was correct? I also did not get any other notification over 
the last week, that any build failed again. Was it then actually some 
corrupted download during the build or some other issue?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
