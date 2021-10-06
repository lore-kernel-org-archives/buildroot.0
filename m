Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C420AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 05:32:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBBB461040
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 05:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBBB461040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BCE360E50;
	Wed,  6 Oct 2021 05:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nAiczPLPhwpj; Wed,  6 Oct 2021 05:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D743D60E4A;
	Wed,  6 Oct 2021 05:32:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5FB1BF869
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 05:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72BE760E4A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 05:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id za2ZQYDUBGMi for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 05:32:47 +0000 (UTC)
X-Greylist: delayed 00:05:07 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C26CB60E46
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 05:32:46 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.42.49]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M5fQq-1mRvjA1NNq-007FrR; Wed, 06 Oct 2021 07:27:34 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex@home.lespocky.de>)
 id 1mXzSm-0005bw-EM; Wed, 06 Oct 2021 07:27:33 +0200
Received: (nullmailer pid 7391 invoked by uid 2001);
 Wed, 06 Oct 2021 05:27:28 -0000
From: Alexander Dahl <post@lespocky.de>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 07:27:16 +0200
Message-Id: <20211006052717.7328-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211006052717.7328-1-post@lespocky.de>
References: <20211006052717.7328-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 7afd21de660cdd80d8d82112ab1a3b35
X-Provags-ID: V03:K1:CiPeNpEOAzCgIe87oY/nEmq13u58S0sAhGxpk9JiD+U6uj2lIXM
 S3I9ZYJobP9SZumcjiqdNzE1bFEA3gtoPUa7lUbrdesaM5mrCtmyV7k2bibKLkoZFm9EiFZ
 issPEJ77mZTe/X9WnzqrBRAddQ3cetrcAfhbehUgBWqduOXpIplA6d9kL8QNmiilHgGy1VK
 5yaexy4P0jL+8HkfSA0AA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CrLWr4JWA/I=:QH1ukQXiY3/3Ueqndp7p61
 EpeIhef+CsmcN9wqFH2GuVxAbajf0K+MK5my5UoXNR0xc+1QWanEKe/tVGfYoT1m/S7vwu/8q
 wFyxyJX5uK2RJaM4ErYY6rl+ZJ8aH3WDB2Xgvtk2HUUUtgrF5UlUsCSVPxEcfRDjNtEzAW2Tn
 J8JL9cuXyvRAH90g3g16JWdKDLdLpgs77a9olDcGV26K73KWiT+wU4usQFD2i07p/unRbxAQc
 TG014NVoOimNDq5+cqmkrTlAHPqmIfLqvwKiIV4rNIrGepvoUVfpK0H2xzhx+WgHsZ6O9uQiZ
 JzWW9y9nnZpyE5AL6lOKV36SY3m2XgcZr6Fc+YlQ/JDiVmJAF8d0b6Lx5/DUxPp6BBzRb1pxr
 /fMD1gJYfG5QxPj4JxqObOOFIdtq3B+3xewiXiIMwO3PGMMWHn9kn6gnUSZmahSa4UhlNVEsA
 E41QTuKeXp0Uo9PB+uwWPe/Zm7bHkOvzq+8iCXrZ+J8XeOvUzP67AI+UaZFnjD8DyMUVKExKa
 K30ytxNvEMQTm+e+VmnmDwUF1/scnVrgg/eNnDgTkPbvh8s5LF6G8g093USZtldaLtg+F9frm
 7d3izx6QzmW0jGyJjzhOg47IhTeTEk7xq96xA/LEx+5ez6tCs7wAHKe5jXa+ZUMKPbMO3Q2O+
 j8z/MxRk3/K27xI3yT0bTfYTGMVdvZXSfS2AXygI/B5QT6QZM8tzhiqa0m7Ia3hHHYzTtdijF
 yEFEwYZjKBCmvir6wZAb/yjFTA9PQD3eheKqyg==
Subject: [Buildroot] [PATCH 2/3] package/dfu-util: Fix licenses
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since v0.8 a script 'dfuse-pack.py' is part of the package, which has a
different license.

Fixes: c212a90b612a ("package/dfu-util: bump version to 0.8, add hash, fix SITE url")
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/dfu-util/dfu-util.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 9f26948a1a..4c9c9662c6 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -6,7 +6,7 @@
 
 DFU_UTIL_VERSION = 0.10
 DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
-DFU_UTIL_LICENSE = GPL-2.0+
+DFU_UTIL_LICENSE = GPL-2.0+, LGPL-3.0
 DFU_UTIL_LICENSE_FILES = COPYING
 
 DFU_UTIL_DEPENDENCIES = libusb
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
