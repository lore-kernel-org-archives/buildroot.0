Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76FEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 15:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49E554056E;
	Sun, 20 Mar 2022 15:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlftHAJoKYlR; Sun, 20 Mar 2022 15:17:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBBA940168;
	Sun, 20 Mar 2022 15:16:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D58061BF57C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2E7640168
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIjQW1Amwy6t for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 15:16:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CA3540158
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 15:16:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 31CA060004;
 Sun, 20 Mar 2022 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647789413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EPcJvRPfjzCoQCrJ9RId9u8SbecsOeBcm6J3pO3995s=;
 b=ZJbL5JIrVvfycBTLV/3Riq+egQeB7iThNjSJ89etDvtzhU8B7TAjqMFSU7uNMAmAs7R8nG
 RUtY9nz0uS6FXsattdBPYbJ/esQoYJ9qxEKtvORKVc6b4d7N3ryeEjXTME/Tfj64nRXAm/
 7qvugCaerTcYOS13xJc35wwDHWpL5QEWIawQo0v5vHb/cr0I9DUE4Ke2RkBtFlbfAlBLu0
 vDtcvNmfiQgdAR+xvcRY9/PqWJNR+2N425+Y3dE4XJ3epI0DREHUGtN/ouBJLa4UVPzPO5
 cNyN/WDVFEaZLPIBAlfDtzizsnEWHWk0P3R2D9x7rAE+1AkQVN0EZGcjEB1/Ow==
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 16:16:49 +0100
Message-Id: <20220320151649.767880-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2021.02.x] DEVELOPERS: drop libqrtr-glib from
 Yegor Yefremov
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 73ce754531b5e45bd42b56c58718fbacc754406f in master added  the
libqrtr-glib package to Yegor Yefremov.

This commit was backported as fad154253deb5b5399ea52a19ed6608dcd00ee4d
in the LTS 2021.02.x branch, but this branch does not have the
libqrtr-glib package, as it was added after 2021.02.

Due to this, the DEVELOPERS file is bogus in 2021.02.x, which causes
the following warning when running pkg-stats:

WARNING: 'package/libqrtr-glib/' doesn't match any file

This commit fixes this by dropping the bogus line from the DEVELOPERS
file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fad5c13844..3397565457 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2755,7 +2755,6 @@ F:	package/libmbim/
 F:	package/libndp/
 F:	package/libnftnl/
 F:	package/libqmi/
-F:	package/libqrtr-glib/
 F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
