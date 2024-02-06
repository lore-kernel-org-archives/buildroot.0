Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB808C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8503041F2D;
	Tue,  6 Feb 2024 10:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8503041F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LW-Z70fEv_6; Tue,  6 Feb 2024 10:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A5D41E87;
	Tue,  6 Feb 2024 10:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A5D41E87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 762681BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F4B941E94
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F4B941E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XTFlKGBmvcC for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:53:52 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A56A41B5D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A56A41B5D
Received: from bubutux.localdomain (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6FB862C80CDD;
 Tue,  6 Feb 2024 11:53:50 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:52:41 +0100
Message-ID: <20240206105246.1220945-5-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206105246.1220945-1-buildroot@bubu1.eu>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707216830; bh=+b1jSaMLyoZ0kyOJZUkT4JT+KwatRi4qf0rrtnri5Bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=o64cNS0203dDqGtBg48CpRflKqWsd9B1KYfYhrBPjAcXyQ48qZt0BFdyL4rL1/sUi
 qi2pJlf+S8zZbx48N+oCxDeCMy8kVSYGHL+3rsNebXXq3J8LrD7x24x1cWoJgfZXha
 EpEDB+/0wDyIQ2aLywZceZujuIHvMJhBCKTuU95ldkSBuAHWJNudF+FI2ysGqi+x6x
 eWkm6rUqsOcZq8J9MrC3MDW6Y5BU497XR3jkQQABuwLpcUG2ZUuYfse3AWhLmImLoR
 qK9mCVLuUMJ/86cdjjp6CNoshBhwdjTHbN/rWnGr6UosqIxzZAENy7iMyzjd2+glH9
 E9t69B5IaWURg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=o64cNS02
Subject: [Buildroot] [PATCH 5/6] docs/manual/contribute.adoc: link to
 git-send-email.io
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git-send-email.io/ is a page maintained by sourcehut which
explains how to setup git send-email on many OS's for many popular email
providers.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 2b90d13b41..684e9f4809 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -369,7 +369,7 @@ $ git send-email origin/master
 ---------------------
 
 Note that +git+ should be configured to use your mail account.
-To configure +git+, see +man git-send-email+ or google it.
+To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
 
 If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
