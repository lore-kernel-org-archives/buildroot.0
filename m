Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9986C48260
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F6A4161A;
	Mon,  5 Feb 2024 22:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F6A4161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOIyl9nxrWBW; Mon,  5 Feb 2024 22:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1D654161B;
	Mon,  5 Feb 2024 22:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D654161B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D69241BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8C9D60D68
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C9D60D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNcgR9Hmx2Q5 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:37:58 +0000 (UTC)
Received: from mail-a.sr.ht (mail-a.sr.ht [46.23.81.152])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25083606C0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25083606C0
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id AA384201E5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:38:06 +0000 (UTC)
From: ~bubu <bubu@git.sr.ht>
Date: Mon, 05 Feb 2024 23:28:12 +0100
Message-ID: <170717267442.23753.14671176069067053494-0@git.sr.ht>
X-Mailer: git.sr.ht
To: buildroot@buildroot.org
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=/A75I8vO2oSATSj6luWknDAuhi3Pi/k04gVzoXWBM0Y=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To; q=dns/txt;
 s=20240113; t=1707172686; v=1;
 b=dZzZXJ7+6xJ6pfTun+/O4GXLtJ7n9YQf/Ex2I1/4tahaCmLS3zSokehS/OKmuZ8tQmficC/3
 9bnHau2l47un/J/P4EgA5WpQcs1ysKM0Yo9+EWe5lf5bAnyGcUImdO0agh9VT9MuqZRzRTDj9J4
 shgh0tSqlHOaY5Pgg5ll85t3d0r/B0c+be5BJkmr8Wz5iAzvR2FcRBHrhrquTV2LpoKmsKbTGiE
 5lSJWzStpy3aLAP9RWYig30tmh4YOseE6+5Ergk7Pg+IZfoOUEv52Y3/zShE01+c0Rs4A/N6wP5
 roskVKSB8/7zNzx5wVo6dvjkVNZHDcax3WTBGsObHzZNg==
Subject: [Buildroot] [PATCH buildroot] support/testing: remove unused import
 from sample_python_crossbar
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
Reply-To: ~bubu <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <buildroot@bubu1.eu>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 support/testing/tests/package/sample_python_crossbar.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_crossbar.py b/support/testing/tests/package/sample_python_crossbar.py
index 8160a37219..3695fe92c0 100644
--- a/support/testing/tests/package/sample_python_crossbar.py
+++ b/support/testing/tests/package/sample_python_crossbar.py
@@ -1,4 +1,3 @@
-import os
 import crossbar
 
 crossbar.run(["version"])
-- 
2.38.5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
