Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA24C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCAF141E87;
	Tue,  6 Feb 2024 10:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCAF141E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5SXSIav021iA; Tue,  6 Feb 2024 10:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4340841B5D;
	Tue,  6 Feb 2024 10:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4340841B5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C35721BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA09261124
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA09261124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSsPAsjl6GKx for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:53:45 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 165F26111E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 165F26111E
Received: from bubutux.localdomain (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 14C0C2C80CDD;
 Tue,  6 Feb 2024 11:53:43 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:52:37 +0100
Message-ID: <20240206105246.1220945-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707216823; bh=dxb6AfNfJtHYL8uGSwJHaTp6M1HJNV256kMK54U2VbQ=;
 h=From:To:Cc:Subject:Date;
 b=s1WfSVHolHQxqQW2qq0efJa3PsdFZ3yjvCmgTioc0joYZopRNoQ4hWE6D/n4B9Ijy
 4RNAI2BLB04+9DqyUWox3MUOXRaODqJ2cEdN9TxRGf/8ke6dSSlfwFA/TE/fTiXHFA
 TtVb18EwkGl0iS40Ma1V1aTijTTzjTaKwTnmV0GsdNsM/4V4R+ycwJ672z6coVqhle
 WEN6cMbwkDraF3+jb8I7EhF5AM6P+YUwT81QveI4XkKMBnkMKcEwNrQnYSuzhqs4sX
 uLcC9h6cKb2XnL04wdMKSHIutrwSuoUQsbGE9HZSTM+VPR0PbQMdqG1V3VSuGleCJV
 78Y+n14VIxTZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=s1WfSVHo
Subject: [Buildroot] [PATCH 1/6] utils/readme.txt: expand check-package
 description
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

check-package does a lot more by now than checking .mk and
Config.in files. Add this to the description.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 utils/readme.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/readme.txt b/utils/readme.txt
index 3e8833c4ea..d5cda70bfc 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -12,8 +12,11 @@ brmake
     nothing.
 
 check-package
-    a script that checks the coding style of a package's Config.in and
-    .mk files, and also tests them for various types of typoes.
+    a script that checks the coding style across the buildroot tree. It
+    checks package's Config.in and .mk files, runs shellcheck for all shell
+    scripts, flake8 for python files, checks for typoes, etc.
+    It checks the .checkpackageignore file if errors should be ignored and
+    errors if there's a file listed that doesn't produce an error.
 
 genrandconfig
     a script that generates a random configuration, used by the autobuilders
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
