Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3116EC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 15:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B9F614A7;
	Fri, 28 Jul 2023 15:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B9F614A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_urbfwQA2qU; Fri, 28 Jul 2023 15:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F41EA61492;
	Fri, 28 Jul 2023 15:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41EA61492
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63E071BF28B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 15:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DC3C61492
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 15:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC3C61492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBWCa1hr-kKt for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 15:19:06 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8809F60B46
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 15:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8809F60B46
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E31A9A4C0C45
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 17:19:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPPF9-0000w9-24
 for buildroot@buildroot.org; Fri, 28 Jul 2023 17:19:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 17:19:02 +0200
Message-Id: <20230728151903.466787-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690557543;
 bh=F12yM7So1bYfrgwCdITZ8BBng/FNkn0bZtH3hf6Er+k=;
 h=From:To:Subject:Date:From;
 b=fNaLfyUpyXbTGoqAPR0/cYOFfacBPS8DMlRqtAhzIDYJF7Edkd5s9vGUg/3Pd0CLU
 1lkhYZ5P1ahyywjFCcCsW2GtrsbA4xsVtyIVSGwLj+mfkUyhGzxvcjb2AILHwvO3s3
 3yS0habwkpmIyd/45SLAsVobGlXy9zrzeNqZHNHbmt5cHWE2w6cFuAJI0iT2BDCNev
 jpa8UAs3pXAZL/RakYte4LGVqJsLEBNdVyL85+6naT8CBQHhNH58cfvoLMEkvD8if3
 vXeMRQI46vRWoNbqEZYjNJH3WqeyMyv6MeLPWQ0yCRMsoVFcs5gJoCH/s4WA2AquJ4
 qrdt9YZj0iROg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fNaLfyUp
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: renumber patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ea3e60229bc5647e587685023de475276e28584d added a patch with a
wrong number.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ix-static-builds.patch => 0005-Revert-Fix-static-builds.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/libopenssl/{0006-Revert-Fix-static-builds.patch => 0005-Revert-Fix-static-builds.patch} (100%)

diff --git a/package/libopenssl/0006-Revert-Fix-static-builds.patch b/package/libopenssl/0005-Revert-Fix-static-builds.patch
similarity index 100%
rename from package/libopenssl/0006-Revert-Fix-static-builds.patch
rename to package/libopenssl/0005-Revert-Fix-static-builds.patch
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
