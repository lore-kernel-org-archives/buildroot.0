Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EE9C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 16:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC99740571;
	Sun, 12 Feb 2023 16:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC99740571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwy1KjZqy_uv; Sun, 12 Feb 2023 16:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19CEC40550;
	Sun, 12 Feb 2023 16:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19CEC40550
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7B5A1BF357
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 16:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADDE460E4B
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 16:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADDE460E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dV5pVuuAWLCI for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 16:33:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3689606BF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3689606BF
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 16:33:42 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.101.78])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AFB7E780372;
 Sun, 12 Feb 2023 17:33:38 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 17:33:22 +0100
Message-Id: <20230212163322.480467-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212163322.480467-1-ju.o@free.fr>
References: <20230212163322.480467-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676219621;
 bh=W7YIAsybzjtNWZbZF86qP2YH9h9idrj+JRiByvJj/YE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f7kUZu/YFX7wks76zm5AV8E+YKmoroslEawiqxSQwqZUTDZ/QFYq2Q/xYAgLURO57
 QKzGzbH34pouk4zKl2PS48X7Uy54X3G6QEUPQyRjeYpCYkXVhBxpPCwCP04gPOg+Nw
 04ah7I+YFjGZhNTnRKmYGWcq83HSTRhLF7jWiWGS8L5qPJ8o8ujUscTTh9DBq+fgw4
 msdrojfZtJC15nY6HVyUI6ckk/2ow7s/yznOS4vadXBQyEHz3m95/n11+Fyf4CNrcp
 SqQ97fJrQmAQevL7s9zdxESINTKTAujkzds6vUNk+Yarcggxr1hdziy2eSPd0kFE08
 Y6JKYlbDWjX3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f7kUZu/Y
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Julien Olivain for z3
 runtime test files
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ece0d986ae..dcc607ba60 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1724,6 +1724,7 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_z3.py
+F:	support/testing/tests/package/test_z3/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
