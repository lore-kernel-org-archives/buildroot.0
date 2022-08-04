Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CDCC25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A90BF40A13;
	Thu,  4 Aug 2022 22:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A90BF40A13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnePqxGAXkNO; Thu,  4 Aug 2022 22:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EB4940895;
	Thu,  4 Aug 2022 22:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EB4940895
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C26F1BF842
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DD3C60C2A
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD3C60C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXsmH1dGwIsU for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 22:04:00 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3CEE60BCA
Received: from smtpcmd10111.aruba.it (smtpcmd10111.aruba.it [62.149.156.111])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3CEE60BCA
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 22:03:58 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JippoMKr8hbqEJipqo2Mfs; Thu, 04 Aug 2022 23:56:54 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 23:56:52 +0200
Message-Id: <20220804215652.3423467-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMLnn98vOdnAKUleWNvYPtWB+AihspTw0uLQ5Ofb7tvNfXYd7rCqL5HBY8Hct7rZBxUTAk1FFyKNpWx/HAsnbJYT/NCp3WM3cbVZIq45DvXsO8IEBNiE
 wh/L7NAHk0ALBPS94ZcI5bQZiugwOY2g76rPoJ+UJP7D3OQXGdI0zGh6X9xjHE7eDdlQP2otkzMY3PWwgZEpqmVgo+iUK0vA3GtCMgUtp/XIHWT+l7HSLpej
 0LBdw5KVSVVgRb5vE92gvOwcT9Aaxk7nwQerXB0duHk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659650214; bh=mEy6yVRMLIRC4JjRoiH7zhxW7v7kyQOFXdMVjsziVjw=;
 h=From:To:Subject:Date:MIME-Version;
 b=jAmLlP8aqlk0VwbgqVAbPoLrTkhJs+X3v196JX6FmGK2IWA9Q6s3MvzKQ9kUCuCDg
 F66jC4D5E32tFliZ5juC2BzHsVB0+8YhhCO9M7kB7mn9mrU0RYXYf1SJks3c5wTkRf
 nxR05dN3PG1QrQGDMpxrdcZ/qpIouiydMXcQZiF3jgX7c0pt2m6+Vgm8FgU23gzQHm
 hlu9JL9faiN8oX+QjTD/HzoKfSRbeLS2Qb1i0ipinWI4xvzgVp23EWRZyi+G/I8gay
 Cu8r3jXvQdBIqKh+V9nxmt9WOtZqOsrfiGo7n51m+pPjunl17MOa/o08M4pCvu5baz
 Tis7whCj3oU3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jAmLlP8a
Subject: [Buildroot] [PATCH] package/libnspr: bump to version 4.34.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unfortunately local patch is still pending upstream. I've pinged them
again after 3 months with no answer:
https://bugzilla.mozilla.org/show_bug.cgi?id=1765100

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 4795b52aaf..a368f02c54 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.34/src/SHA256SUMS
-sha256  beef011cd15d8f40794984d17014366513cec5719bf1a78f5e8a3e3a1cebf99c  nspr-4.34.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.34.1/src/SHA256SUMS
+sha256  c5b8354c48b632b8f4c1970628146c0e0c0ca8f32c7315d7d5736c002e03774f  nspr-4.34.1.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 5d64d110ef..fcb2a1db49 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.34
+LIBNSPR_VERSION = 4.34.1
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
