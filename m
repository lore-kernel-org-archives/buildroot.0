Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62530C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 12:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCB8B4138F;
	Tue, 13 Feb 2024 12:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMdZpjGbyJes; Tue, 13 Feb 2024 12:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDE9540477
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDE9540477;
	Tue, 13 Feb 2024 12:37:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA6D21BF2FC
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 12:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF50740C53
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 12:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaWMy6Sq-Ibs for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 12:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6AA140477
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6AA140477
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6AA140477
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 12:37:56 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 91DCF2C80CDA;
 Tue, 13 Feb 2024 13:37:54 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 13:37:52 +0100
Message-Id: <20240213123753.2471309-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707827874; bh=j24iuhVog93vH/nm+mv5pDrs1si/sEn9KWAcD3Hof04=;
 h=From:To:Cc:Subject:Date;
 b=WoB3a7SHRKzWaabfNYxBN4ExNev+WUFAfuK0zIUCUOQONpWyIKOCxeO8HRcWgrLK6
 se/Wj13zrX/QCuEkj+uLBaa2038NGdLFZVRNNvLHepV+VseKup9mrQKKuK2+oVn0KR
 yuY7f7v56CuqDA8ePtdnpnig5WLK9sVwOKlqV8Vphnweeh5/0W1kW9h9fV7a2IgG/5
 KhLZM9trMej65dpjIlDEx8Y9sEEPnws2zYE0MEixW6pK8CWa1KtdOT+s7LZI1Q71/0
 DchxHFjUU8S2hNpwsHhUr1U0S4FOoC/0EE3RjVIpErKGQzCyj/pLUzOZjcOiNFlvvh
 bmhf4gaf39zew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=WoB3a7SH
Subject: [Buildroot] [PATCH 1/2] package/python-can/Config.in: sort selects
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sort python builtin modules before external python libs.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-can/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index a00c9263cf..61955a2b00 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  This module provides controller area network support for
 	  Python.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
