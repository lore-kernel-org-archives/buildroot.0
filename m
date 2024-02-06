Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BC1C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40EAF41B5D;
	Tue,  6 Feb 2024 10:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40EAF41B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etHne2VGWlSA; Tue,  6 Feb 2024 10:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9113A41EBD;
	Tue,  6 Feb 2024 10:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9113A41EBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8295E1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A0AA41E94
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A0AA41E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1P7CzXIxHnu for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:53:49 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 790CD41B5D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 790CD41B5D
Received: from bubutux.localdomain (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 759972C80CDD;
 Tue,  6 Feb 2024 11:53:47 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:52:38 +0100
Message-ID: <20240206105246.1220945-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206105246.1220945-1-buildroot@bubu1.eu>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707216827; bh=yKJokFr2qTeGGSiJU9sENSQQ8C8yKc1icumzhv9YvfI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=THc7DdGKSRpaNZei7JsFS+uVRFW7YbdbBojHGD9yAofwaVbmwW3vyUuO/oTYfnhqS
 J/jQA67Tnp8UpAAQpu1UswejIugQ551YWu31r5Tgdn91QvUByVf5Z3ugKJvNTu+qeE
 GZAzgaSQIooOZZzZjaubI1oQD+hpgw6LBSHsI/QnjVPV/f9ujoikmfp6rPHNG8LZaE
 x2rjV9wW9vOqzcaaXqcMdz0puVyS4dDZ0eSwSX4kuvgvf7Gxaq30Jd5B+lPRdW8YCi
 cWB8v2H3fczDDLU2yaVDki+iKuNDzlty3Wje/0KPwxqpe1WvexkEi7KfrhNIXuX3GD
 8GVlUz0+wVeCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=THc7DdGK
Subject: [Buildroot] [PATCH 2/6] utils/readme.txt: document docker-run script
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 utils/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/readme.txt b/utils/readme.txt
index d5cda70bfc..2cb6b0af9b 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -18,6 +18,10 @@ check-package
     It checks the .checkpackageignore file if errors should be ignored and
     errors if there's a file listed that doesn't produce an error.
 
+docker-run
+    a script that runs a command (like make check-package) inside the buildroot
+    ci docker container.
+
 genrandconfig
     a script that generates a random configuration, used by the autobuilders
     (http://autobuild.buildroot.org). It selects a random toolchain from
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
